import 'dart:async';
import 'package:camera/camera.dart';
import 'package:chrome_pay_mobile_flutter/Facescan/locator.dart';
import 'package:chrome_pay_mobile_flutter/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:chrome_pay_mobile_flutter/Activity/agent.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Activity/login.dart';
import 'Customer/customer_dash.dart';

List<CameraDescription> cameras = [];
void main() async {

  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white
      ),
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }

}

class SplashScreen extends StatefulWidget{
  @override

  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>{

  @override
  void initState(){
    super.initState();
    getAsync();
    Timer(Duration(seconds: 3),
            () => naviagteUser(context));

    Timer(Duration(seconds: 1),
            () => callamination());

  }
   void getAsync() async{
     WidgetsFlutterBinding.ensureInitialized();
     await Firebase.initializeApp(
       options: DefaultFirebaseOptions.currentPlatform,
     );
     cameras = await availableCameras();
     setupServices();
   }
  void callamination(){
    setState(() {
      _width = 70;
      _height = 70;
    });
  }
  double _width = 5.0;
  double _height = 5.0;

  @override
  Widget build(BuildContext context) {
    // final width = MediaQuery.of(context).size.width;
    // final height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: Stack(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: Image(image: AssetImage('images/login_stuff_32.png'),
                fit: BoxFit.cover,),
            ),
            Container(
              padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.5,
                  left: 20),
              alignment: Alignment.centerLeft,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height:70,
                    width: 70,
                    alignment: Alignment.center,
                    child:  AnimatedContainer(
                      width: _width,
                      height: _height,
                      color: Colors.transparent,
                      alignment: Alignment.center,
                      duration: const Duration(seconds: 1),
                      child: Image.asset("images/login_stuff_02.png",
                        height: _width,
                        width: _height,),
                    ),
                  ),
                  Container(
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      child: const Text("Let`s Get\nStarted ",
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                        textDirection: TextDirection.ltr,
                      ) ,
                    ),
                ],
              ),
            )
          ],
        ),
      );
  }
}

void naviagteUser(BuildContext context) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  SharedPreferences custPrefs = await SharedPreferences.getInstance();
  bool? status = prefs.getBool('agentislogin');
  bool? custStatus = custPrefs.getBool('custislogin');
  var type = prefs.getString('loginStatus');

  if(custStatus == true){
    if(type?.matchAsPrefix("customer") != null) {
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => CustomerDash(),
      )
      );
    }
  }
  else if (status == true ) {
    if(type?.matchAsPrefix("agent") != null){
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => Agent(),
    )
    );
    }
  } else {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => Login(),
    )
    );
  }
}

