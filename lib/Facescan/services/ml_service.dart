import 'dart:convert';
import 'dart:ffi';
import 'dart:io';
import 'dart:math';
import 'dart:typed_data';
import 'package:camera/camera.dart';
import 'package:chrome_pay_mobile_flutter/Facescan/models/GetUserStore.dart';
import 'package:chrome_pay_mobile_flutter/Facescan/models/UserStore.dart';
import 'package:chrome_pay_mobile_flutter/Facescan/services/image_converter.dart';
import 'package:chrome_pay_mobile_flutter/Services/Services.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
import 'package:shared_preferences/shared_preferences.dart';
// import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:tflite_flutter/tflite_flutter.dart';
import 'package:image/image.dart' as imglib;
import 'package:http/http.dart' as http;

class MLService {
  Interpreter? _interpreter;
  double threshold = 0.5;

  List _predictedData = [];
  List get predictedData => _predictedData;

  Future initialize() async {
    late Delegate delegate;
    try {
      if (Platform.isAndroid) {
        print("android");
        delegate = GpuDelegateV2(
          options: GpuDelegateOptionsV2(
            isPrecisionLossAllowed: false,
            inferencePreference: TfLiteGpuInferenceUsage.fastSingleAnswer,
            inferencePriority1: TfLiteGpuInferencePriority.minLatency,
            inferencePriority2: TfLiteGpuInferencePriority.auto,
            inferencePriority3: TfLiteGpuInferencePriority.auto,
          ),
        );
        // print("android12");
      } else if (Platform.isIOS) {
        delegate = GpuDelegate(
          options: GpuDelegateOptions(
              allowPrecisionLoss: true,
              waitType: TFLGpuDelegateWaitType.active),
        );
      }
      var interpreterOptions = InterpreterOptions()..addDelegate(delegate);


      this._interpreter = await Interpreter.fromAsset('mobilefacenet.tflite',
          options: interpreterOptions);
    } catch (e) {
      print('Failed to load model.');
      print(e);
    }
  }

  void setCurrentPrediction(CameraImage cameraImage,Face face) {
    if (_interpreter == null) throw Exception('Interpreter is null');
    if (face == null) throw Exception('Face is null');
    List input = _preProcess(cameraImage, face);

    input = input.reshape([1, 112, 112, 3]);
    // List output = List.generate(1, (index) => List.filled(192, 0));

       List output = List.filled(1 * 192, null, growable: true).reshape([1, 192]);
    // print("userss ${output}");
    this._interpreter?.run(input, output);
    output = output.reshape([192]);

    this._predictedData = List.from(output);
  }

  Future<FaceData2?> predict() async {
    return _searchResult(this._predictedData);
  }

 // void setCurrentPrediction(CameraImage cameraImage, Face face) {
 //    /// crops the face from the image and transforms it to an array of data
 //    List input = _preProcess(cameraImage, face);
 //
 //    /// then reshapes input and ouput to model format 🧑‍🔧
 //    input = input.reshape([1, 112, 112, 3]);
 //    List output = List.filled(1 * 192, null, growable: true).reshape([1, 192]);
 //    // List output = List(1 * 192).reshape([1, 192]);
 //    /// runs the interpreter and produces the output 🤖
 //    this._interpreter?.run(input, output);
 //    output = output.reshape([192]);
 //
 //    this._predictedData = List.from(output);
 //  }

  List _preProcess(CameraImage image, Face faceDetected) {
    imglib.Image croppedImage = _cropFace(image, faceDetected);
    imglib.Image img = imglib.copyResizeCropSquare(croppedImage, 112);

    Float32List imageAsList = imageToByteListFloat32(img);
    return imageAsList;
  }

  imglib.Image _cropFace(CameraImage image, Face faceDetected) {
    imglib.Image convertedImage = _convertCameraImage(image);
    double x = faceDetected.boundingBox.left - 10.0;
    double y = faceDetected.boundingBox.top - 10.0;
    double w = faceDetected.boundingBox.width + 10.0;
    double h = faceDetected.boundingBox.height + 10.0;
    return imglib.copyCrop(
        convertedImage, x.round(), y.round(), w.round(), h.round());
  }

  imglib.Image _convertCameraImage(CameraImage image) {
    var img = convertToImage(image);
    var img1 = imglib.copyRotate(img, -90);
    return img1;
  }

  Float32List imageToByteListFloat32(imglib.Image image) {
    var convertedBytes = Float32List(1 * 112 * 112 * 3);
    var buffer = Float32List.view(convertedBytes.buffer);
    int pixelIndex = 0;

    for (var i = 0; i < 112; i++) {
      for (var j = 0; j < 112; j++) {
        var pixel = image.getPixel(j, i);
        buffer[pixelIndex++] = (imglib.getRed(pixel) - 128) / 128;
        buffer[pixelIndex++] = (imglib.getGreen(pixel) - 128) / 128;
        buffer[pixelIndex++] = (imglib.getBlue(pixel) - 128) / 128;
      }
    }
    return convertedBytes.buffer.asFloat32List();
  }

  Future<FaceData2?> _searchResult(List predictedData) async {
    List<GetData>? users = await GetStorefaces();
    double minDist = 999;
    double currDist = 0.0;
    GetData? predictedResult;

    for (GetData u in users!) {
      currDist = _euclideanDistance(u.faceData?.facedata, predictedData);
      if (currDist <= threshold && currDist < minDist) {
        print("match");
        minDist = currDist;
        predictedResult = u;
      }
    }
    return predictedResult?.faceData;
  }

  static Future<UserStore> Storefaces(String name,List facelist) async {
    final params = {
      "Face_data" : {
        "username": name,
        "password": "123",
        "facedata": facelist
      }
    };
    SharedPreferences? prefs = await SharedPreferences.getInstance();
    String token="";
    token = prefs!.getString("token").toString();
    // print('state'+params.toString());
    http.Response responce = await http.post(Uri.parse("${Services.BaseUrl}v1/DID/Store_Face_Data"),
        headers: {"Content-Type": "application/json",
        "Authorization":"Bearer ${token}"
        }, body: json.encode(params));
    // print('state'+params.toString());
    print('statestore'+responce.body);

    if (responce.statusCode == 200) {
      var data = jsonDecode(responce.body);
      UserStore user = UserStore.fromJson(data);
      return user;
    } else {
      var data = jsonDecode(responce.body);
      UserStore user = UserStore.fromJson(data);
      return user;
    }
  }
  static Future<List<GetData>?> GetStorefaces() async {
    SharedPreferences? prefs = await SharedPreferences.getInstance();
    String token="";
    token = prefs!.getString("token").toString();
    http.Response responce = await http.get(Uri.parse("${Services.BaseUrl}v1/DID/Get_Face_Data"),
        headers: {"Content-Type": "application/json",
          "Authorization":"Bearer ${token}"
        });
    print('stateget'+responce.body);

    if (responce.statusCode == 200){
      var data = jsonDecode(responce.body);
      GetUserStore user = GetUserStore.fromJson(data);
      return user.data;
    } else {
      var data = jsonDecode(responce.body);
      GetUserStore user = GetUserStore.fromJson(data);
      return user.data;
    }
  }

  double _euclideanDistance(List? e1, List? e2) {
    if (e1 == null || e2 == null) throw Exception("Null argument");

    double sum = 0.0;
    for (int i = 0; i < e1.length; i++) {
      sum += pow((e1[i] - e2[i]), 2);
    }
    return sqrt(sum);
  }

  // double _euclideanDistance(List e1, List e2) {
  //   double sum = 0.0;
  //   for (int i = 0; i < e1.length; i++) {
  //     sum += pow((e1[i] - e2[i]), 2);
  //   }
  //   return sqrt(sum);
  // }

  void setPredictedData(value) {
    this._predictedData = value;
  }

  dispose() {}
}