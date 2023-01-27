import 'dart:async';
import 'dart:io';
import 'dart:typed_data';

import 'package:image_picker/image_picker.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:chrome_pay_mobile_flutter/Activity/agent.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Activity/login.dart';
import 'Customer/customer_dash.dart';

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

// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }
//
// class _MyAppState extends State<MyApp> {
//   File? file;
//   ImagePicker image = ImagePicker();
//   // getImage() async {
//   //   var img = await image.pickImage(source: ImageSource.gallery);
//   //
//   //   setState(() {
//   //     file = File(img?.path ??'');
//   //   });
//   // }
//
//   getImagecam() async {
//     var img = await image.pickImage(source: ImageSource.camera);
//
//     setState(() {
//       file = File(img!.path);
//       print("file ${file}");
//
//     });
//   }
//
//   Future<Uint8List> _generatePdf(PdfPageFormat format, file) async {
//     final pdf = pw.Document(version: PdfVersion.pdf_1_5, compress: true);
//     final font = await PdfGoogleFonts.nunitoExtraLight();
//
//     final showimage = pw.MemoryImage(file.readAsBytesSync());
//     print("showimage${showimage}");
//     pdf.addPage(
//       pw.Page(
//         pageFormat: format,
//         build: (context) {
//           return pw.Center(
//             child: pw.Image(showimage, fit: pw.BoxFit.contain),
//           );
//         },
//       ),
//     );
//
//     return pdf.save();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text(" WEB FUN pdf maker"),
//           actions: [
//             // IconButton(
//             //   onPressed: getImage,
//             //   icon: Icon(Icons.image),
//             // ),
//             IconButton(
//               onPressed: getImagecam,
//               icon: Icon(Icons.camera),
//             ),
//           ],
//         ),
//         body: file == null
//             ? Container()
//             : PdfPreview(
//           build: (format) => _generatePdf(format, file),
//         ),
//       ),
//     );
//   }
// }