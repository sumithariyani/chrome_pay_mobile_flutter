import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../Models/ForgotPassOtpModel.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../Services/Services.dart';
import 'newpasschange.dart';



class ForgotPassOtp extends StatefulWidget{
  ForgotPassOtp(this.email);
  String email;

  @override
  _ForgotPassOtpState createState() => _ForgotPassOtpState();

}

class _ForgotPassOtpState extends State<ForgotPassOtp>{

  ForgotPassOtpModel? _forgotPassOtpModel;
  String? otp;

  Future<void> forgotPassWord() async {
    otp = _otp1.text+_otp2.text+_otp3.text+_otp4.text+_otp5.text+_otp6.text;

    _forgotPassOtpModel = await Services.ForgotPassOtp(widget.email, otp!);
    if(_forgotPassOtpModel?.status!= false){
      Fluttertoast.showToast(msg: "${_forgotPassOtpModel?.msg}",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM);
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => NewPassChange(widget.email),));
    }else{
      Fluttertoast.showToast(msg: "${_forgotPassOtpModel?.msg}",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM);
    }
  }

  TextEditingController _otp1 = TextEditingController();
  TextEditingController _otp2 = TextEditingController();
  TextEditingController _otp3 = TextEditingController();
  TextEditingController _otp4 = TextEditingController();
  TextEditingController _otp5 = TextEditingController();
  TextEditingController _otp6 = TextEditingController();

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     body: Container(
       width: MediaQuery.of(context).size.width,
       height: MediaQuery.of(context).size.height,
       child: Stack(
         children: [
           Container(
               alignment: Alignment.bottomRight,
               child: Image.asset("images/login_stuff_30.png",
                 height: 200,
                 width: 200,
                 alignment: Alignment.centerRight,)
           ),
           ConstrainedBox(
             constraints: BoxConstraints(),
             child: Container(
               width: MediaQuery.of(context).size.width,
               height: MediaQuery.of(context).size.height,
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.start,
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Expanded(
                     child: Container(
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.start,
                         mainAxisAlignment: MainAxisAlignment.start,
                         children: [
                           Container(
                             margin: const EdgeInsets.fromLTRB(15, 40, 0, 0),
                             child: Row(
                               crossAxisAlignment: CrossAxisAlignment.start,
                               mainAxisAlignment: MainAxisAlignment.start,
                               children: [
                                 InkWell(
                                   onTap: () {
                                     Navigator.pop(context);
                                   },
                                   child: Container(
                                     child: Image.asset('images/login_stuff_03.png',
                                       height: 20,
                                     ),
                                   ),
                                 ),
                                 Container(
                                   margin: const EdgeInsets.fromLTRB(10.0, 0, 0, 0),
                                   child: Text('Verify Otp',
                                     style: TextStyle(
                                         fontSize: 18,
                                         fontWeight: FontWeight.bold
                                     ),
                                   ),
                                 )
                               ],
                             ),
                           ),
                           Container(
                             alignment: Alignment.center,
                             margin: EdgeInsets.only(left: 15.0, top: 15.0),
                             child: Image.asset("images/login_stuff_02.png",
                               height: 70,
                               width: 70,),
                           ),
                           Container(
                               alignment: Alignment.center,
                               margin: EdgeInsets.only(left: 15.0, top: 15.0),
                               child: Text("Please enter 6 digit OTP\nsent to${widget.email}",
                                 style: TextStyle(fontWeight: FontWeight.w600,
                                     color: Colors.black38),)
                           ),
                           Container(
                             alignment: Alignment.center,
                             child: Row(

                               crossAxisAlignment: CrossAxisAlignment.center,
                               mainAxisAlignment: MainAxisAlignment.center,
                               children: [
                                 Container(
                                   margin: EdgeInsets.only(top: 10.0, right: 2.5, left: 10.0),
                                   width: 40,
                                   height: 50,
                                   child: Card(
                                     color: Color(0xff17314C),
                                     shape: RoundedRectangleBorder(
                                         borderRadius: BorderRadius.only(
                                             bottomRight: Radius.circular(5),
                                             bottomLeft: Radius.circular(5),
                                             topLeft: Radius.circular(5),
                                             topRight: Radius.circular(5)),
                                         side: BorderSide(width:2, color: Colors.lightBlueAccent)),
                                     child: TextField(
                                         controller: _otp1,
                                         decoration: InputDecoration(
                                             border: InputBorder.none
                                         ),
                                         keyboardType: TextInputType.number,
                                         textAlign: TextAlign.center,
                                         style: TextStyle(color: Colors.white),
                                         onChanged: (value){
                                           if (value.isNotEmpty){
                                             FocusScope.of(context).nextFocus();
                                           }else if (value.isEmpty){
                                             FocusScope.of(context).previousFocus();
                                           }
                                         },
                                         inputFormatters: [
                                           new LengthLimitingTextInputFormatter(1)
                                         ]
                                     ),
                                   ),
                                 )
                                 ,
                                 Container(
                                   margin: EdgeInsets.only(top: 10.0, right: 2.5),
                                   width: 40,
                                   height: 50,
                                   child: Card(
                                     color: Color(0xff17314C),
                                     shape: RoundedRectangleBorder(
                                         borderRadius: BorderRadius.only(
                                             bottomRight: Radius.circular(5),
                                             bottomLeft: Radius.circular(5),
                                             topLeft: Radius.circular(5),
                                             topRight: Radius.circular(5)),
                                         side: BorderSide(width:2, color: Colors.lightBlueAccent)),
                                     child: TextField(
                                         controller: _otp2,
                                         decoration: InputDecoration(
                                             border: InputBorder.none
                                         ),
                                         keyboardType: TextInputType.number,
                                         textAlign: TextAlign.center,
                                         style: TextStyle(color: Colors.white),
                                         onChanged: (value){
                                           if (value.isNotEmpty){
                                             FocusScope.of(context).nextFocus();
                                           }else if (value.isEmpty){
                                             FocusScope.of(context).previousFocus();
                                           }
                                         },
                                         inputFormatters: [
                                           new LengthLimitingTextInputFormatter(1)
                                         ]
                                     ),
                                   ),
                                 )
                                 ,
                                 Container(
                                   margin: EdgeInsets.only(top: 10.0, right: 2.5),
                                   width: 40,
                                   height: 50,
                                   child: Card(
                                     color: Color(0xff17314C),
                                     shape: RoundedRectangleBorder(
                                         borderRadius: BorderRadius.only(
                                             bottomRight: Radius.circular(5),
                                             bottomLeft: Radius.circular(5),
                                             topLeft: Radius.circular(5),
                                             topRight: Radius.circular(5)),
                                         side: BorderSide(width:2, color: Colors.lightBlueAccent)),
                                     child: TextField(
                                         controller: _otp3,
                                         decoration: InputDecoration(
                                             border: InputBorder.none
                                         ),
                                         keyboardType: TextInputType.number,
                                         textAlign: TextAlign.center,
                                         style: TextStyle(color: Colors.white),
                                         onChanged: (value){
                                           if (value.isNotEmpty){
                                             FocusScope.of(context).nextFocus();
                                           }else if (value.isEmpty){
                                             FocusScope.of(context).previousFocus();
                                           }
                                         },
                                         inputFormatters: [
                                           new LengthLimitingTextInputFormatter(1)
                                         ]
                                     ),
                                   ),
                                 )
                                 ,
                                 Container(
                                   margin: EdgeInsets.only(top: 10.0, right: 2.5),
                                   width: 40,
                                   height: 50,
                                   child: Card(
                                     color: Color(0xff17314C),
                                     shape: RoundedRectangleBorder(
                                         borderRadius: BorderRadius.only(
                                             bottomRight: Radius.circular(5),
                                             bottomLeft: Radius.circular(5),
                                             topLeft: Radius.circular(5),
                                             topRight: Radius.circular(5)),
                                         side: BorderSide(width:2, color: Colors.lightBlueAccent)),
                                     child: TextField(
                                         controller: _otp4,
                                         decoration: InputDecoration(
                                             border: InputBorder.none
                                         ),
                                         keyboardType: TextInputType.number,
                                         textAlign: TextAlign.center,
                                         style: TextStyle(color: Colors.white),
                                         onChanged: (value){
                                           if (value.isNotEmpty){
                                             FocusScope.of(context).nextFocus();
                                           }else if (value.isEmpty){
                                             FocusScope.of(context).previousFocus();
                                           }
                                         },
                                         inputFormatters: [
                                           new LengthLimitingTextInputFormatter(1)
                                         ]
                                     ),
                                   ),
                                 )
                                 ,
                                 Container(
                                   margin: EdgeInsets.only(top: 10.0, right: 2.5),
                                   width: 40,
                                   height: 50,
                                   child: Card(
                                     color: Color(0xff17314C),
                                     shape: RoundedRectangleBorder(
                                         borderRadius: BorderRadius.only(
                                             bottomRight: Radius.circular(5),
                                             bottomLeft: Radius.circular(5),
                                             topLeft: Radius.circular(5),
                                             topRight: Radius.circular(5)),
                                         side: BorderSide(width:2, color: Colors.lightBlueAccent)),
                                     child: TextField(
                                         controller: _otp5,
                                         decoration: InputDecoration(
                                             border: InputBorder.none
                                         ),
                                         keyboardType: TextInputType.number,
                                         textAlign: TextAlign.center,
                                         style: TextStyle(color: Colors.white),
                                         onChanged: (value){
                                           if (value.isNotEmpty){
                                             FocusScope.of(context).nextFocus();
                                           }else if (value.isEmpty){
                                             FocusScope.of(context).previousFocus();
                                           }
                                         },
                                         inputFormatters: [
                                           new LengthLimitingTextInputFormatter(1)
                                         ]
                                     ),
                                   ),
                                 )
                                 ,
                                 Container(
                                   margin: EdgeInsets.only(top: 10.0, right: 2.5),
                                   width: 40,
                                   height: 50,
                                   child: Card(
                                     color: Color(0xff17314C),
                                     shape: RoundedRectangleBorder(
                                         borderRadius: BorderRadius.only(
                                             bottomRight: Radius.circular(5),
                                             bottomLeft: Radius.circular(5),
                                             topLeft: Radius.circular(5),
                                             topRight: Radius.circular(5)),
                                         side: BorderSide(width:2, color: Colors.lightBlueAccent)),
                                     child: TextField(
                                       controller: _otp6,
                                       decoration: InputDecoration(
                                           border: InputBorder.none
                                       ),
                                       keyboardType: TextInputType.number,
                                       textAlign: TextAlign.center,
                                       style: TextStyle(color: Colors.white,
                                           fontSize: 18),
                                       onChanged: (value){
                                         if (value.isNotEmpty){
                                           FocusScope.of(context).nextFocus();
                                         }else if (value.isEmpty){
                                           FocusScope.of(context).previousFocus();
                                         }
                                       },
                                       inputFormatters: [
                                         new LengthLimitingTextInputFormatter(1)
                                       ],
                                     ),
                                   ),
                                 ),
                               ],
                             ),
                           ),
                         ],
                       ),
                     ),
                   ),
                   Stack(
                     children: [
                       Container(
                         alignment: Alignment.bottomCenter,
                         margin: EdgeInsets.fromLTRB(30, 0, 30, 40),
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
                             onPressed: () {
                               forgotPassWord();
                             },
                             textColor: Colors.white,
                             child: Padding(
                               padding: const EdgeInsets.all(10.0),
                               child: Text('Verify', style: TextStyle(fontSize: 18,),),
                             ),
                           ),
                         ),
                       ),
                     ],
                   )
                 ],
               ),
             ),
           ),
         ],
       ),
     ),
   );
  }

}