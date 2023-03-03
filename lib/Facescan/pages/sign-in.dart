import 'dart:async';
import 'package:camera/camera.dart';
import 'package:chrome_pay_mobile_flutter/Activity/agent.dart';
import 'package:chrome_pay_mobile_flutter/Activity/login.dart';
import 'package:chrome_pay_mobile_flutter/Activity/register_customer.dart';
import 'package:chrome_pay_mobile_flutter/Customer/customer_dash.dart';
import 'package:chrome_pay_mobile_flutter/Facescan/locator.dart';
import 'package:chrome_pay_mobile_flutter/Facescan/models/GetUserStore.dart';
import 'package:chrome_pay_mobile_flutter/Facescan/pages/app_button.dart';
import 'package:chrome_pay_mobile_flutter/Facescan/pages/app_text_field.dart';
import 'package:chrome_pay_mobile_flutter/Facescan/pages/auth-action-button.dart';
import 'package:chrome_pay_mobile_flutter/Facescan/pages/auth_button.dart';
import 'package:chrome_pay_mobile_flutter/Facescan/pages/camera_detection_preview.dart';
import 'package:chrome_pay_mobile_flutter/Facescan/pages/camera_header.dart';
import 'package:chrome_pay_mobile_flutter/Facescan/pages/signin_form.dart';
import 'package:chrome_pay_mobile_flutter/Facescan/pages/single_picture.dart';
import 'package:chrome_pay_mobile_flutter/Facescan/services/camera.service.dart';
import 'package:chrome_pay_mobile_flutter/Facescan/services/face_detector_service.dart';
import 'package:chrome_pay_mobile_flutter/Facescan/services/ml_service.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:google_mlkit_face_detection/google_mlkit_face_detection.dart';
// import 'package:google_ml_kit/google_ml_kit.dart';

import 'package:shared_preferences/shared_preferences.dart';

class SignIn extends StatefulWidget {
  const SignIn({Key? key}) : super(key: key);

  @override
  SignInState createState() => SignInState();
}

class SignInState extends State<SignIn> {
  CameraService _cameraService = locator<CameraService>();
  FaceDetectorService _faceDetectorService = locator<FaceDetectorService>();
  MLService _mlService = locator<MLService>();
  final TextEditingController _userTextEditingController =
  TextEditingController(text: '');
  final TextEditingController _passwordTextEditingController =
  TextEditingController(text: '');
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  bool _isPictureTaken = false;
  bool _isInitializing = false;

  @override
  void initState() {
    super.initState();
    _initializeServices(CameraLensDirection.front);

  }
  bool loading = true;
  bool loading2 = false;
  _initializeServices(CameraLensDirection flipcam) async {
    setState(() => loading = true);
    await _cameraService.initialize(flipcam);
    await _mlService.initialize();
    _faceDetectorService.initialize();
    _start();
    setState(() => loading = false);
  }

  @override
  void dispose() {
    _cameraService.dispose();
    _mlService.dispose();
    _faceDetectorService.dispose();
    super.dispose();
  }

  void changeCamera(){
    _cameraService.dispose();
    _mlService.dispose();
    _faceDetectorService.dispose();
  }

  Future _signUp(context) async {
    List predictedData = _mlService.predictedData;
    String user = _userTextEditingController.text;
    String password = _passwordTextEditingController.text;
    await MLService.Storefaces(user,predictedData);
    this._mlService.setPredictedData([]);
    print("users");
    // Navigator.of(context).pop();
    Navigator.pushReplacement(context,
        MaterialPageRoute(builder: (BuildContext context) => RegisterCustomer(_cameraService.imagePath!, user)));
  }

  Future _start() async {
    setState(() => _isInitializing = true);
    await _cameraService.initialize(CameraLensDirection.front);
    setState(() => _isInitializing = false);
    _frameFaces();
  }

  int countbling=0;
  bool isopen=false;
  _frameFaces() async {
    bool processing = false;
    _cameraService.cameraController!
        .startImageStream((CameraImage image) async {
      if (processing) return; // prevents unnecessary overprocessing.
      processing = true;
      await _predictFacesFromImage(image: image);
      if(_faceDetectorService.faceDetected) {
        Face face = _faceDetectorService.faces[0];
        double? leftEyeOpenProbability = face.leftEyeOpenProbability;
        if(leftEyeOpenProbability!=null) {
          if (leftEyeOpenProbability! < 0.2) {
            // left eye is likely closed
            if (isopen) {
              countbling++;
              print("leftEyeOpenProbability $countbling");
              isopen = false;
            }
          } else {
            if (!isopen) {
              countbling++;
              print("leftEyeOpenProbability $countbling");
              isopen = true;
            }
            // left eye is likely open
          }
        }
      }
      // FaceData2? user = await _mlService.predict();

      processing = false;
    });
  }
  String? imagePath;
  Future<void> _predictFacesFromImage({@required CameraImage? image}) async {
    assert(image != null, 'Image is null');
    await _faceDetectorService.detectFacesFromImage(image!);
    if (_faceDetectorService.faceDetected) {
      _mlService.setCurrentPrediction(image, _faceDetectorService.faces[0]);
    }
    if (mounted) setState(() {});
  }




  Future<void> takePicture() async {

      if (_faceDetectorService.faceDetected) {
        await _cameraService.takePicture();
        setState(() => _isPictureTaken = true);
      } else {
        showDialog(context: context,
          builder: (context) =>
              AlertDialog(content: Text('No face detected!')));
      }

  }

  _onBackPressed() {
    Navigator.of(context).pop();
  }

  String imagepath="";
  bool isloadbutton=true;
  bool isflip=true;
  _onFlipPressed() async {
    setState(() {
      isloadbutton=false;
      loading = true;
    });
    print("isflip $isflip");
    changeCamera();
    new Future.delayed(const Duration(seconds: 3), () {
      if(isflip) {
        _initializeServices(CameraLensDirection.back);
        isflip=false;
      }else{
        _initializeServices(CameraLensDirection.front);
        isflip=true;
      }
      setState(() {
        isloadbutton=true;
      });
    });

  }

  _reload() {
    if (mounted) setState(() => _isPictureTaken = false);
    _start();
  }

  bool _saving = false;
  bool _bottomSheetVisible = false;

  Future<bool> onShot() async {
    if(countbling>6){
    if (!_faceDetectorService.faceDetected) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Text('No face detected!'),
          );
        },
      );

      return false;
    } else {
      _saving = true;
      await Future.delayed(Duration(milliseconds: 500));
      // await _cameraService.cameraController?.stopImageStream();
      await Future.delayed(Duration(milliseconds: 200));
      XFile? file = await _cameraService.takePicture();
      // uploadData(file!);
      imagePath = file?.path;

      setState(() {
        _bottomSheetVisible = true;
        pictureTaken = true;
      });

      return true;
    }
    }else{

      Fluttertoast.showToast(msg: "blink your eyes 4 5 times",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER);
      return false;
    }
  }
  bool pictureTaken = false;

  Future<void> onTap() async {
    if(countbling>3){
    await takePicture();
    if (_faceDetectorService.faceDetected) {
      print("users1234567");
      FaceData2? user = await _mlService.predict();
      if(user==null){
        var bottomSheetController = scaffoldKey.currentState!
            .showBottomSheet((context) => signInSheet(user: user));
        bottomSheetController.closed.whenComplete(_reload);
      }else {
        Fluttertoast.showToast(msg: "User already register",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER);
        naviagteUser(context);
      }
    }
    }else{
      Fluttertoast.showToast(msg: "Blink you eyes ${4 - countbling} more time",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER);
      print("leftEyeOpenProbability $countbling");
    }
  }

  void naviagteUser(BuildContext context) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    SharedPreferences custPrefs = await SharedPreferences.getInstance();
    bool? status = prefs.getBool('agentislogin');
    bool? custStatus = custPrefs.getBool('custislogin');
    var type = prefs.getString('loginStatus');
    // var custType = prefs.getString('custLoginStatus');
    // var type = prefs.getString('loginStatus');
    // var ctype = prefs.getString('loginStatus');
    print(status);
    print(custStatus);
    print(type);

    if(custStatus == true){
      if(type?.matchAsPrefix("customer") != null) {
        print("CustomerLogein");
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => CustomerDash(),
        )
        );
      }
    }
    else if (status == true ) {
      if(type?.matchAsPrefix("agent") != null){
        print("Agent Logging");
        Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => Agent(),
        )
        );
      }
    } else {
      print("login");
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => Login(),
      )
      );
    }
  }

  Widget getBodyWidget() {

    if (_isInitializing) return Center(child: CircularProgressIndicator());
    if (loading) return Center(child: CircularProgressIndicator());
    if (_isPictureTaken) return SinglePicture(imagePath: _cameraService.imagePath!);
    return CameraDetectionPreview();
  }

  signSheet() {
    return Container(
      padding: EdgeInsets.all(20),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            child: Column(
              children: [
                AppTextField(
                  controller: _userTextEditingController,
                  labelText: "Your Name",
                ),
                SizedBox(height: 10),
                // AppTextField(
                //   controller: _passwordTextEditingController,
                //   labelText: "Password",
                //   isPassword: true,
                // ),
                // SizedBox(height: 10),
                Divider(),
                SizedBox(height: 10),
                AppButton(
                  text: 'Submit',
                  onPressed: () async {

                    await _signUp(context);

                    },
                  icon: Icon(
                    Icons.person_add,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget header = CameraHeader("Move your face center of the Box and blink your eyes",isloadbutton, onBackPressed: _onBackPressed,onflipPressed: _onFlipPressed);
    Widget body = getBodyWidget();
    Widget? fab;
    if (!_isPictureTaken) fab = AuthButton(onTap: onTap);


    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.black,
      body:Stack(
        children:
        [body, header],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: fab,
    );
  }

  signInSheet({@required FaceData2? user}) => user == null
      ?
  // Container(
  //   width: MediaQuery.of(context).size.width,
  //   padding: EdgeInsets.all(20),
  //   child: Text(
  //     'User not found 😞',
  //     style: TextStyle(fontSize: 20),
  //   ),
  // )
  signSheet()
      : SignInSheet(user: user);
}