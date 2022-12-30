import 'dart:async';

import 'package:chrome_pay_mobile_flutter/Activity/agent.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'Activity/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget{
  @override

  _SplashScreenState createState() => _SplashScreenState();

  @override
  Widget build (BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: const Color(0xff003d66)),
      home: Scaffold(
        body: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[

              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState(){
    super.initState();

    Timer(Duration(seconds: 3),
            () => naviagteUser(context));
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(scaffoldBackgroundColor: Colors.white),
      home: Scaffold(
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
                    child: Image.asset("images/login_stuff_02.png",
                      height: 70,
                      width: 70,),

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
      ),
    );
  }
}

void naviagteUser(BuildContext context) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  bool? status = prefs.getBool('islogin');
  if (status == true) {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => Agent(),
    )
    );
  } else {
    Navigator.of(context).pushReplacement(MaterialPageRoute(
      builder: (context) => Login(),
    )
    );
  }
}

