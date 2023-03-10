
import 'package:camera/camera.dart';
import 'package:chrome_pay_mobile_flutter/Facescan/locator.dart';
import 'package:chrome_pay_mobile_flutter/Facescan/services/camera.service.dart';
import 'package:flutter/services.dart';
// import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:flutter/material.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';

class FaceDetectorService {
  CameraService _cameraService = locator<CameraService>();

  late FaceDetector _faceDetector;
  FaceDetector get faceDetector => _faceDetector;

  List<Face> _faces = [];
  List<Face> get faces => _faces;
  bool get faceDetected => _faces.isNotEmpty;

  void initialize() {
    _faceDetector = FaceDetector(
      options: FaceDetectorOptions(
        enableContours: true,
        enableClassification: true,
        enableTracking: true,
        enableLandmarks: true,
        performanceMode: FaceDetectorMode.accurate
      ),
    );
    // _faceDetector = GoogleMlKit.vision.faceDetector(
    //   FaceDetectorOptions(
    //     mode: FaceDetectorMode.accurate,
    //     enableContours: true,
    //     enableClassification: true,
    //     enableLandmarks: true,
    //     enableTracking: true
    //   ),
    // );
  }

  Future<List<Face>> detectFacesFromImage(CameraImage image) async {
    InputImageData _firebaseImageMetadata = InputImageData(
      // imageRotation: _cameraService.cameraRotation ?? InputImageRotation.Rotation_0deg,
      imageRotation: _cameraService.cameraRotation ?? InputImageRotation.rotation0deg,
      // inputImageFormat: InputImageFormatMethods.fromRawValue(image.format.raw) ?? InputImageFormat.NV21,
      inputImageFormat: InputImageFormatValue.fromRawValue(image.format.raw) ?? InputImageFormat.nv21,
      size: Size(image.width.toDouble(), image.height.toDouble()),
      planeData: image.planes.map(
            (Plane plane) {
          return InputImagePlaneMetadata(
            bytesPerRow: plane.bytesPerRow,
            height: plane.height,
            width: plane.width,
          );
        },
      ).toList(),
    );
    final WriteBuffer allBytes = WriteBuffer();
    for (final Plane plane in image.planes) {
      allBytes.putUint8List(plane.bytes);
    }
    final bytes = allBytes.done().buffer.asUint8List();
    InputImage _firebaseVisionImage = InputImage.fromBytes(
      bytes: bytes,
      // bytes: image.planes[0].bytes,
      inputImageData: _firebaseImageMetadata,
    );
    // final inputImage =
    // InputImage.fromBytes(bytes: bytes, inputImageData: _firebaseImageMetadata);
    _faces = await _faceDetector.processImage(_firebaseVisionImage);

    
    return _faces;
  }


  ///for new version
  // Future<void> detectFacesFromImage(CameraImage image) async {
  //   // InputImageData _firebaseImageMetadata = InputImageData(
  //   //   imageRotation: _cameraService.cameraRotation ?? InputImageRotation.rotation0deg,
  //   //   inputImageFormat: InputImageFormatMethods ?? InputImageFormat.nv21,
  //   //   size: Size(image.width.toDouble(), image.height.toDouble()),
  //   //   planeData: image.planes.map(
  //   //     (Plane plane) {
  //   //       return InputImagePlaneMetadata(
  //   //         bytesPerRow: plane.bytesPerRow,
  //   //         height: plane.height,
  //   //         width: plane.width,
  //   //       );
  //   //     },
  //   //   ).toList(),
  //   // );
  //
  //   final WriteBuffer allBytes = WriteBuffer();
  //   for (Plane plane in image.planes) {
  //     allBytes.putUint8List(plane.bytes);
  //   }
  //   final bytes = allBytes.done().buffer.asUint8List();
  //
  //   final Size imageSize = Size(image.width.toDouble(), image.height.toDouble());
  //
  //   InputImageRotation imageRotation = _cameraService.cameraRotation ?? InputImageRotation.rotation0deg;
  //
  //   final inputImageData = InputImageData(
  //     size: imageSize,
  //     imageRotation: imageRotation,
  //     inputImageFormat: InputImageFormat.yuv420,
  //     planeData: image.planes.map(
  //           (Plane plane) {
  //         return InputImagePlaneMetadata(
  //           bytesPerRow: plane.bytesPerRow,
  //           height: plane.height,
  //           width: plane.width,
  //         );
  //       },
  //     ).toList(),
  //   );
  //
  //   InputImage _firebaseVisionImage = InputImage.fromBytes(
  //     bytes: bytes,
  //     inputImageData: inputImageData,
  //   );
  //
  //   _faces = await _faceDetector.processImage(_firebaseVisionImage);
  // }

  dispose() {
    _faceDetector.close();
  }
}