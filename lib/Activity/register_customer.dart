import 'dart:convert';
import 'dart:io';

import 'package:camera/camera.dart';
import 'package:chrome_pay_mobile_flutter/Facescan/locator.dart';
import 'package:chrome_pay_mobile_flutter/Facescan/pages/sign-in.dart';
import 'package:chrome_pay_mobile_flutter/Facescan/services/camera.service.dart';
import 'package:chrome_pay_mobile_flutter/Facescan/services/face_detector_service.dart';
import 'package:chrome_pay_mobile_flutter/Facescan/services/ml_service.dart';
import 'package:chrome_pay_mobile_flutter/Models/Image%20Upload%20Model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shared_preferences/shared_preferences.dart';


import '../Services/Services.dart';
import 'address.dart';

class RegisterCustomer extends StatefulWidget{
  RegisterCustomer(this.imagepath, this.name);
  String imagepath;
  String name;
  @override
  _RegisterCustomerState createState() => _RegisterCustomerState();

}

class _RegisterCustomerState extends State <RegisterCustomer>{
  MLService _mlService = locator<MLService>();
  FaceDetectorService _mlKitService = locator<FaceDetectorService>();
  CameraService _cameraService = locator<CameraService>();
  bool loading = false;
  File? selectedImage;
  String base64Image = "";
  var stream;
  var length;
  var imageUrl;
  ImageUploadModel? _imageUploadModel;
  SharedPreferences? prefs;

  Future<void> uploadImage() async{
    prefs = await SharedPreferences.getInstance();
    print("function");
    try {
      if (widget.imagepath != "") {
        print("condition");
        _imageUploadModel = await Services.ProfileImage(prefs!.getString("token").toString(), File(widget.imagepath));
        if(_imageUploadModel?.status!=false){
          print("imageUrl ${_imageUploadModel?.data}");
          imageUrl = _imageUploadModel?.data;
        }
      }
    }catch(e){
      print(e);
    }
  }

  @override
  void initState() {
    uploadImage();
    fullName.text = "${widget.name}";
    // _initializeServices();
    super.initState();
  }
  _initializeServices() async {
    setState(() => loading = true);
    await _cameraService.initialize(CameraLensDirection.front);
    await _mlService.initialize();
    _mlKitService.initialize();
    setState(() => loading = false);
  }


  Future<void> pickImage() async {
    try{
      var _image;

      _image = await ImagePicker().
      pickImage(source: ImageSource.camera);
      setState((){
        if(_image != null){
          setState(() {
            selectedImage = File(_image.path);
            uploadImage();
            // base64Image = base64Encode(selectedImage!.readAsBytesSync());
            // print('base64Image ${base64Image}');
          });
        }else{
          print('No image capture');
        }
      });
      
    }catch(e){
      print(e);
    }
  }
  TextEditingController fullName = TextEditingController();
  TextEditingController mobileNumber = TextEditingController();
  TextEditingController day = TextEditingController();
  TextEditingController month = TextEditingController();
  TextEditingController year = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController city = TextEditingController();
  TextEditingController profession = TextEditingController();
  TextEditingController nameKin = TextEditingController();
  TextEditingController numberKin = TextEditingController();


  List<String> countryCodes = ['+972', '+251', '+91', '+1'];
  String? selectedCode = '+972';
  List<String> nationality = ['Ethiopian', 'Israeli', 'Indian', 'American'];
  String? selectedNationality = 'Ethiopian';
  int _radioSelected = 0;
  String _radioVal = "";
  String? _phone;
  String _dob = "";
  DateTime? datePicked;

  @override
  Widget build(BuildContext context) {
   return  Scaffold(
       body: Stack(
         children: <Widget>[
           Container(
             alignment: Alignment.topRight,
             child: Image.asset('images/login_stuff_31.png',
               height: 200,
               width: 150,
             ),
           ),
           Container(
             alignment: Alignment.topRight,
             margin: const EdgeInsets.fromLTRB(15, 40, 10, 0),
             child: const Text('1/3',
               style: const TextStyle(
                   fontSize: 18,
                   fontWeight: FontWeight.bold
               ),),
           ),
           Container(
             width: MediaQuery.of(context).size.width,
             height: MediaQuery.of(context).size.height,
             child: Column(
               mainAxisAlignment: MainAxisAlignment.start,
               crossAxisAlignment: CrossAxisAlignment.start,
               children: <Widget>[
                 Row(
                   crossAxisAlignment: CrossAxisAlignment.start,
                   mainAxisAlignment: MainAxisAlignment.start,
                   children: <Widget>[
                     InkWell(
                       onTap: () {
                         Navigator.pop(context);
                       },
                       child: Container(
                         padding: EdgeInsets.all(5.0),
                         margin: const EdgeInsets.fromLTRB(15, 40, 0, 0),
                         child: Image.asset('images/login_stuff_03.png',
                           height: 20,
                         ),
                       ),
                     ),
                     Container(
                       padding: EdgeInsets.only(top: 5.0),
                       margin: const EdgeInsets.fromLTRB(15, 40, 0, 0),
                       child: const Text('Register Customer',
                       style: TextStyle(
                         fontSize: 18,
                         fontWeight: FontWeight.bold
                       ),),
                     ),
                   ],
                 ),
                 Expanded(
                   child: SizedBox(
                     width: MediaQuery.of(context).size.width,
                     height: MediaQuery.of(context).size.height,
                     child: Card(
                       margin: const EdgeInsets.fromLTRB(10, 40, 10, 10),
                       elevation: 10,
                       shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.all(Radius.circular(10.0))
                       ),
                       color: Colors.white,
                       shadowColor: Colors.black,
                       child: SingleChildScrollView(
                         // reverse: false,
                         child: ConstrainedBox(
                           constraints: BoxConstraints(),
                           child: Container(
                             child: Padding(
                               padding: const EdgeInsets.all(8.0),
                               child: Column(
                                 mainAxisAlignment: MainAxisAlignment.start,
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: <Widget>[
                                   Container(
                                     height: 70,
                                          alignment: Alignment.center,
                                          margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                                          child: CircleAvatar(
                                            radius: 60,
                                            backgroundColor: Colors.transparent,
                                            child: InkWell(
                                              onTap: (){
                                                // if(loading==false) {
                                                  Navigator.push(
                                                    context,
                                                    MaterialPageRoute(
                                                      builder: (
                                                          BuildContext context) =>
                                                          SignIn(),
                                                    ),
                                                  );
                                                // }else{
                                                //   Fluttertoast.showToast(msg: "please wait and try again",
                                                //       toastLength: Toast.LENGTH_SHORT,
                                                //       gravity: ToastGravity.CENTER);
                                                // }
                                                // pickImage();
                                              },
                                                child: ClipOval(
                                                  child: widget.imagepath!=""
                                                  ?Image.file(
                                                    File(widget.imagepath),
                                                    height: 100,
                                                    width: 100,
                                                  ):
                                                  Image.asset(
                                                    'images/login_new_10.png',
                                                    height: 70,
                                                    width: 70,
                                                  ),
                                                )
                                            ),
                                          ),

                                        ),
                                   Container(
                                       alignment: Alignment.center,
                                       margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                                       child: const Text('Facial Scan',
                                       style: TextStyle(
                                         fontSize: 14,
                                       ),)
                                     ),
                                   Container(
                                     margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
                                       child: Column(
                                         children: <Widget>[
                                           Container(
                                             child: TextField(
                                               controller: fullName,
                                               keyboardType: TextInputType.text,
                                               decoration: InputDecoration(
                                                 counterText: "",
                                                 prefixIcon: Container(
                                                   padding: EdgeInsets.all(5.0),
                                                   margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                                                   child: Image.asset('images/login_stuff_17.png',
                                                   height: 2.0,
                                                   width: 2.0,),
                                                 ),
                                                 hintText: 'Full Name',
                                               ),
                                               style: const TextStyle(fontSize: 18.0),
                                             ),
                                           ),
                                           Container(
                                             decoration: BoxDecoration(
                                                 border: Border(
                                                     bottom: BorderSide(
                                                         color: Colors.grey
                                                     )
                                                 )
                                             ),
                                             margin: const EdgeInsets.only(top: 10.0),
                                             child: Row(
                                               children: <Widget>[
                                                 Container(
                                                   margin: const EdgeInsets.fromLTRB(10, 10, 10, 5),
                                                   child: Image.asset('images/login_stuff_18.png',
                                                   height: 20,
                                                   width: 20,),
                                                 ),
                                                 Container(
                                                   width: 60,
                                                     child: DropdownButtonFormField<String>(
                                                       decoration: const InputDecoration(
                                                         border: InputBorder.none
                                                       ),
                                                       value: selectedCode,
                                                       items: countryCodes.
                                                       map((item) => DropdownMenuItem<String>(
                                                         value: item,
                                                           child: Text(item, style: const TextStyle(fontSize: 15),)
                                                       ))
                                                           .toList(),
                                                       onChanged: (item) => setState(() => selectedCode = item),
                                                     ),
                                                   ),
                                                 Expanded(
                                                   child: Container(
                                                     margin: EdgeInsets.symmetric(horizontal: 8.0),
                                                     child: TextField(
                                                       controller: mobileNumber,
                                                       keyboardType: TextInputType.phone,
                                                       maxLength: 10,
                                                       decoration: const InputDecoration(
                                                         counterText: "",
                                                         hintText: 'Mobile Number',
                                                         border: InputBorder.none
                                                       ),
                                                       style: const TextStyle(fontSize: 18.0),
                                                     ),
                                                   ),
                                                 )
                                               ],
                                             ),
                                           ),
                                           Container(
                                             alignment: Alignment.centerLeft,
                                             margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                                             child: const Text('Date of birth :',
                                               style: TextStyle(
                                                   fontSize: 18,
                                                   fontWeight: FontWeight.bold
                                               ),),
                                           ),
                                           Row(
                                             children: <Widget>[
                                               Container(
                                                 alignment: Alignment.center,
                                                 height: 30,
                                                 width: 50,
                                                 margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                                                 child: TextField(
                                                   onTap: () async{
                                                     datePicked = await showDatePicker(
                                                         context: context,
                                                         initialDate: DateTime.now(),
                                                         firstDate: DateTime(1950),
                                                         lastDate: DateTime.now());
                                                     if(datePicked != null){
                                                       day.text = '${datePicked?.day}';
                                                       month.text = '${datePicked?.month}';
                                                       year.text = '${datePicked?.year}';
                                                       print('Date Selecte : ${datePicked?.day}-${datePicked?.month}-${datePicked?.year}');
                                                     }
                                                   },
                                                   controller: day,
                                                   textAlign: TextAlign.center,
                                                     readOnly: true,
                                                     keyboardType: TextInputType.number,
                                                   decoration: InputDecoration(
                                                     contentPadding: EdgeInsets.zero,
                                                     border: OutlineInputBorder(
                                                       borderSide: BorderSide(
                                                         color: Colors.black,
                                                         width: 5.0)
                                                     ),
                                                     hintText: 'DD',
                                                   ),
                                                   style: TextStyle(fontSize: 12.0
                                                   ),
                                                     inputFormatters: [
                                                       new LengthLimitingTextInputFormatter(2)
                                                     ]

                                                 ),
                                               ),
                                               Container(
                                                 height: 30,
                                                 width: 50,
                                                 decoration: BoxDecoration(),
                                                 margin: const EdgeInsets.fromLTRB(10,10,10,0),
                                                 child: TextField(
                                                   controller: month,
                                                     readOnly: true,
                                                     textAlign: TextAlign.center,
                                                   keyboardType: TextInputType.number,
                                                   decoration: InputDecoration(
                                                     contentPadding: EdgeInsets.zero,
                                                     border: OutlineInputBorder(
                                                         borderSide: BorderSide(
                                                             color: Colors.black,
                                                             width: 5.0)
                                                     ),
                                                     counterText: "",
                                                     hintText: 'MM',
                                                   ),
                                                   style: TextStyle(fontSize: 12.0,),
                                                     inputFormatters: [
                                                       new LengthLimitingTextInputFormatter(2)
                                                     ]

                                                 ),
                                               ),
                                               Container(
                                                 alignment: Alignment.center,
                                                 height: 30,
                                                 width: 60,
                                                 margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                                                 child: TextField(
                                                   controller: year,
                                                   textAlign: TextAlign.center,
                                                   readOnly: true,
                                                   keyboardType: TextInputType.number,
                                                   decoration: InputDecoration(
                                                     contentPadding: EdgeInsets.zero,
                                                     border: OutlineInputBorder(
                                                         borderSide: BorderSide(
                                                             color: Colors.black,
                                                             width: 5.0)
                                                     ),
                                                     counterText: "",
                                                     hintText: 'YYYY',
                                                   ),
                                                   style: TextStyle(fontSize: 12.0),
                                                     inputFormatters: [
                                                       new LengthLimitingTextInputFormatter(4)
                                                     ]

                                                 ),
                                               )
                                             ],
                                           ),

                                           Container(
                                             margin: const EdgeInsets.fromLTRB(5, 15, 0, 0),
                                             child: Row(
                                               crossAxisAlignment: CrossAxisAlignment.center,
                                               children: <Widget>[
                                                 Container(
                                                   alignment: Alignment.centerLeft,
                                                   child: const Text('Gender :',
                                                     style: TextStyle(
                                                         fontSize: 18,
                                                         fontWeight: FontWeight.bold
                                                     ),),
                                                 ),
                                                 Radio(
                                                   activeColor: Colors.greenAccent,
                                                     value: 1,
                                                     groupValue: _radioSelected,
                                                     onChanged: (value) {
                                                       setState((){
                                                         _radioSelected = value as int;
                                                         _radioVal = 'male';
                                                         print(_radioVal);
                                                       });
                                                     },),
                                                 Text('Male'),
                                                 Radio(
                                                     activeColor: Colors.greenAccent,
                                                     value: 2,
                                                     groupValue: _radioSelected,
                                                     onChanged: (value) {
                                                       setState((){
                                                         _radioVal = 'female';
                                                         print(_radioVal);
                                                         _radioSelected = value as int;
                                                       });
                                                     }),
                                                 Text('Female')
                                               ],
                                             ),
                                           ),
                                           Container(
                                             alignment: Alignment.centerLeft,
                                             margin: const EdgeInsets.fromLTRB(5, 15, 0, 0),
                                             child: const Text('Other Information',
                                               style: TextStyle(
                                                   fontSize: 18,
                                                   fontWeight: FontWeight.bold
                                               ),),
                                           ),
                                           Container(
                                             margin: EdgeInsets.only(top: 10.0),
                                             child: TextField(
                                               controller: email,
                                               keyboardType: TextInputType.text,
                                               decoration: InputDecoration(
                                                 counterText: "",
                                                 prefixIcon: Container(
                                                   padding: EdgeInsets.all(5.0),
                                                   margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                                                   child: Image.asset('images/login_stuff_04.png',
                                                     height: 2.0,
                                                     width: 2.0,),
                                                 ),
                                                 hintText: 'Email',
                                               ),
                                               style: const TextStyle(fontSize: 18.0),
                                             ),
                                           ),
                                           Container(
                                             margin: EdgeInsets.only(top: 10.0),
                                             child: TextField(
                                               controller: city,
                                               keyboardType: TextInputType.text,
                                               decoration: InputDecoration(
                                                 counterText: "",
                                                 prefixIcon: Container(
                                                   padding: EdgeInsets.all(5.0),
                                                   margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                                                   child: Image.asset('images/login_stuff_20.png',
                                                     height: 2.0,
                                                     width: 2.0,),
                                                 ),
                                                 hintText: 'City',
                                               ),
                                               style: const TextStyle(fontSize: 18.0),
                                             ),
                                           ),
                                           Container(
                                             decoration: BoxDecoration(
                                               border: Border(
                                                 bottom: BorderSide(
                                                   color: Colors.grey
                                                 )
                                               )
                                             ),
                                             width: MediaQuery.of(context).size.width,
                                             margin: const EdgeInsets.only(top: 10.0),
                                             child: Row(
                                               children: <Widget>[
                                                 Container(
                                                   margin: const EdgeInsets.fromLTRB(10, 10, 10, 5),
                                                   child: Image.asset('images/login_stuff_20.png',
                                                     height: 20,
                                                     width: 20,),
                                                 ),
                                                 Expanded(
                                                   child: Container(
                                                     alignment: Alignment.center,
                                                     child: DropdownButtonFormField<String>(
                                                       decoration: InputDecoration(
                                                         border: InputBorder.none
                                                       ),
                                                       icon: Icon(Icons.keyboard_arrow_down),
                                                       value: selectedNationality,
                                                       items: nationality.
                                                       map((item) => DropdownMenuItem<String>(
                                                           value: item,
                                                           child: Text(item, style: const TextStyle(fontSize: 18),)
                                                       ))
                                                           .toList(),
                                                       onChanged: (item) => setState(() => selectedNationality = item),
                                                     ),
                                                   ),
                                                 ),
                                               ],
                                             ),
                                           ),
                                           Container(
                                             child: TextField(
                                               controller: profession,
                                               keyboardType: TextInputType.text,
                                               decoration: InputDecoration(
                                                 counterText: "",
                                                 prefixIcon: Container(
                                                   padding: EdgeInsets.all(5.0),
                                                   margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                                                   child: Image.asset('images/login_stuff_21.png',
                                                     height: 2.0,
                                                     width: 2.0,),
                                                 ),
                                                 hintText: 'Profession',
                                               ),
                                               style: const TextStyle(fontSize: 18.0),
                                             ),
                                           ),
                                           Container(
                                             child: TextField(
                                               controller: nameKin,
                                               keyboardType: TextInputType.text,
                                               decoration: InputDecoration(
                                                 counterText: "",
                                                 prefixIcon: Container(
                                                   padding: EdgeInsets.all(5.0),
                                                   margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                                                   child: Image.asset('images/login_stuff_17.png',
                                                     height: 2.0,
                                                     width: 2.0,),
                                                 ),
                                                 hintText: 'Name of Kin (Name)',
                                               ),
                                               style: const TextStyle(fontSize: 18.0),
                                             ),
                                           ),
                                           Container(
                                             child: TextField(
                                               controller: numberKin,
                                               maxLength: 10,
                                               keyboardType: TextInputType.number,
                                               decoration: InputDecoration(
                                                 counterText: "",
                                                 prefixIcon: Container(
                                                   padding: EdgeInsets.all(8.0),
                                                   margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                                                   child: Image.asset('images/login_stuff_23.png',
                                                     height: 2.0,
                                                     width: 2.0,),
                                                 ),
                                                 hintText: 'Number of Kin (Phone no.)',
                                               ),
                                               style: const TextStyle(fontSize: 18.0),
                                             ),
                                           )
                                         ],

                                       ),
                                   )
                                 ],
                               ),
                             ),
                           ),
                         ),
                       ),
                     )
                   ),
                 ),
                 Container(
                   alignment: Alignment.bottomCenter,
                   margin: const EdgeInsets.fromLTRB(30, 20, 30, 10),
                   decoration: const BoxDecoration(
                       borderRadius: BorderRadius.all(Radius.circular(40.0)),
                       gradient: LinearGradient(colors: [
                         Color(0xff2CABBB),
                         Color(0xff0B527E),
                       ],begin: Alignment.topCenter,end: Alignment.bottomCenter)
                   ),
                   child: ButtonTheme(
                     minWidth: 400,
                     height: 50,
                     child: MaterialButton(
                       highlightColor: Colors.transparent,
                       splashColor: Colors.transparent,
                       onPressed: () {
                         navigaterUser(context);
                       },
                       textColor: Colors.white,
                       child: const Padding(
                         padding: EdgeInsets.all(10.0),
                         child: const Text('Next', style: const TextStyle(fontSize: 18,),),
                       ),
                     ),
                   ),
                 )

               ],
             ),
           )
         ],
       )
     );

  }

  void navigaterUser(BuildContext context) {

    _phone = selectedCode!.substring(1)! + mobileNumber.text;
    print(_phone);
    _dob = ' ${datePicked?.day}-${datePicked?.month}-${datePicked?.year}';
    print(_dob);
    if (widget.imagepath.isEmpty) {
      Fluttertoast.showToast(
          msg: "Please upload profile photo",
          gravity: ToastGravity.CENTER);
    } else if (fullName.text.isEmpty) {
      Fluttertoast.showToast(
          msg: "Please enter full name",
          gravity: ToastGravity.CENTER);
    } else if (mobileNumber.text.isEmpty) {
      Fluttertoast.showToast(
          msg: "Please enter phone number",
          gravity: ToastGravity.CENTER);
    } else if (day.text.isEmpty || month.text.isEmpty || year.text.isEmpty) {
      print("objectvhvhjvjhvhvv");
      Fluttertoast.showToast(
          msg: "Please enter date of birth",
          gravity: ToastGravity.CENTER);
    } else if (_radioVal.isEmpty) {
      print("objectsdxhgfxddsdh");
      Fluttertoast.showToast(
          msg: "Please select Gender",
          gravity: ToastGravity.CENTER);
    } else if (email.text.isEmpty) {
      Fluttertoast.showToast(
          msg: "Please enter email",
          gravity: ToastGravity.CENTER);
    } else if (city.text.isEmpty) {
      Fluttertoast.showToast(
          msg: "Please enter city",
          gravity: ToastGravity.CENTER);
    } else if (profession.text.isEmpty) {
      Fluttertoast.showToast(
          msg: "Please enter your profession",
          gravity: ToastGravity.CENTER);
    } else if (nameKin.text.isEmpty) {
      Fluttertoast.showToast(
          msg: "Please enter name of kin",
          gravity: ToastGravity.CENTER);
    } else if (numberKin.text.isEmpty) {
      Fluttertoast.showToast(
          msg: "Please enter number of kin",
          gravity: ToastGravity.CENTER);
    } else {
      Navigator.of(context).push(MaterialPageRoute(
        builder: (context) =>
            MapSample(
                imageUrl,
                fullName.text,
                _phone.toString(),
                _dob.toString(),
                _radioVal.toString(),
                email.text.replaceAll(" ", ""),
                city.text,
                selectedNationality.toString(),
                profession.text,
                nameKin.text,
                numberKin.text),));
    }
  }
}