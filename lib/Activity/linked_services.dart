import 'package:chrome_pay_mobile_flutter/Activity/all-did.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../Models/LinkedServiceOtpModel.dart';
import '../Models/OrganisationModel.dart';
import '../Models/VerifyLinkedServiceOtpModel.dart';
import '../Services/Services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';


class LinkedServices extends StatefulWidget {

  String phone = "";
  LinkedServices(this.phone);

  @override
  _LinkedServicesState createState() => _LinkedServicesState();

}

 class _LinkedServicesState extends State<LinkedServices> {

   List<String> _orgList = [];
   List<String>? assetType;
   String? selectedAssetType;
   LinkedServiceOtpModel? _linkedServiceOtpModel;
   VerifyLinkedServiceOtpModel? _verifyLinkedServiceOtpModel;
   TextEditingController mobileNumber = TextEditingController();
   SharedPreferences? prefs;
   String? otp;

   TextEditingController _otp1 = TextEditingController();
   TextEditingController _otp2 = TextEditingController();
   TextEditingController _otp3 = TextEditingController();
   TextEditingController _otp4 = TextEditingController();
   TextEditingController _otp5 = TextEditingController();
   TextEditingController _otp6 = TextEditingController();

   Future<void> scan() async {
     prefs = await SharedPreferences.getInstance();
     _linkedServiceOtpModel = await Services.LinkedService(prefs!.getString("token").toString(), mobileNumber.text.toString());
     if (_linkedServiceOtpModel?.status != false) {
       Fluttertoast.showToast(msg: "${_linkedServiceOtpModel?.msg}",
           toastLength: Toast.LENGTH_SHORT,
           gravity: ToastGravity.CENTER);
       _verifyDialog();
     } else {
       Fluttertoast.showToast(msg: "${_linkedServiceOtpModel?.msg}",
           toastLength: Toast.LENGTH_SHORT,
           gravity: ToastGravity.CENTER);
     }

     @override
     void initState() {
       super.initState();
     }
   }
   Future<void> _verify() async {
     otp = _otp1.text+_otp2.text+_otp3.text+_otp4.text+_otp5.text+_otp6.text;
     prefs = await SharedPreferences.getInstance();
     _verifyLinkedServiceOtpModel = await Services.VerifyLinkedService(prefs!.getString("token").toString(),mobileNumber.text.toString(), otp!);
     if (_verifyLinkedServiceOtpModel?.status != false) {
       Fluttertoast.showToast(msg: "${_verifyLinkedServiceOtpModel?.msg}",
           toastLength: Toast.LENGTH_SHORT,
           gravity: ToastGravity.CENTER);
       Navigator.of(context).pushReplacement(
           MaterialPageRoute(builder: (context) => Active_Did() ));
     }
     else {
       Fluttertoast.showToast(msg: "${_verifyLinkedServiceOtpModel?.msg}",
           toastLength: Toast.LENGTH_SHORT,
           gravity: ToastGravity.CENTER);
     }
   }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              height: MediaQuery
                  .of(context)
                  .size
                  .height,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Container(
                  width: MediaQuery
                      .of(context)
                      .size
                      .width,
                  height: MediaQuery
                      .of(context)
                      .size
                      .height,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
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
                            margin: EdgeInsets.fromLTRB(15, 40, 0, 0),
                            child: Text('Linked Service',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18
                              ),),
                          )
                        ],
                      ),
                      Expanded(
                        child: Container(
                          width: MediaQuery
                              .of(context)
                              .size
                              .width,
                          // height: MediaQuery.of(context).size.height,
                          child:  Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Container(
                                        alignment: Alignment.center,
                                        padding: EdgeInsets.only(
                                            top: 20.0, bottom: 10.0),
                                        child: Image.asset(
                                          'images/popup-05.png',
                                          height: 180,),
                                      ),
                                      Center(
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment
                                              .start,
                                          mainAxisAlignment: MainAxisAlignment
                                              .center,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(top: 10.0, bottom: 10.0, left: 5.0),
                                              child: Text('DID Number',
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 16,
                                                fontFamily: "Opensans"),),
                                            ),
                                            Card(
                                              // margin: EdgeInsets.fromLTRB(20, 0, 20, 20),
                                              elevation: 10,
                                              color: Colors.white,
                                              shadowColor: Colors.black,
                                              child: Container(
                                                height: 50,
                                                margin: EdgeInsets.only(top: 5.0, left: 5.0),
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                    border: Border.all(
                                                        color: Colors.white),
                                                    borderRadius: BorderRadius.all(
                                                        Radius.circular(5.0)),
                                                ),
                                                child: TextFormField(
                                                  controller: mobileNumber,
                                                  maxLength: 10,
                                                  keyboardType: TextInputType
                                                      .phone,
                                                  decoration: InputDecoration(
                                                      border: InputBorder.none,
                                                      counterText: "",
                                                      hintText: "DID-Ref"
                                                  ),
                                                  style: TextStyle(fontSize: 18.0),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                        ),
                      ),
                      Container(
                        alignment: Alignment.bottomCenter,
                        margin: const EdgeInsets.fromLTRB(30, 20, 30, 10),
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(
                                Radius.circular(40.0)),
                            gradient: LinearGradient(colors: [
                              Color(0xff0B527E),
                              Color(0xff2CABBB),
                            ],
                                begin: Alignment.topLeft,
                                end: Alignment.bottomRight)
                        ),
                        child: ButtonTheme(
                          minWidth: 400,
                          height: 50,
                          child: MaterialButton(
                            highlightColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            onPressed: () {
                              scan();
                            },
                            textColor: Colors.white,
                            child: const Padding(
                              padding: EdgeInsets.all(10.0),
                              child: Text('Update',
                                style: const TextStyle(fontSize: 18,),),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )

    );
  }

   void _verifyDialog(){
     showDialog(context: context, builder: (context){
       return Container(
         child: Dialog(
           child: SingleChildScrollView(
             child: Container(
               height: 400,
               decoration: const BoxDecoration(
                 borderRadius: BorderRadius.all(
                     Radius.circular(40.0)),
               ),
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.start,
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   InkWell(
                     onTap: (){
                       Navigator.pop(context);
                     },
                     child: Container(
                       alignment: Alignment.topRight,
                       padding: EdgeInsets.all(10.0),
                       child: Image.asset('images/login_stuff_28.png',
                         height: 20,),
                     ),
                   ),
                   Container(
                     alignment: Alignment.center,
                     child: Text('Verification Code',
                       style: TextStyle(fontSize: 18,
                         fontWeight: FontWeight.bold,),),
                   ),
                   Container(
                     alignment: Alignment.center,
                     child: Text('Send to customer mobile no.',
                       style: TextStyle(fontWeight: FontWeight.bold),),
                   ),
                   Container(
                     margin: EdgeInsets.only(top: 30.0),
                     alignment: Alignment.center,
                     child: Text('Enter the 6 Digit OTP',
                       style: TextStyle(fontWeight: FontWeight.w500,
                           fontSize: 16),),
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
                   Container(
                     margin: EdgeInsets.only(top: 10),
                     alignment: Alignment.center,
                     child: Text('Resend code after 00 sec',
                       style: TextStyle(fontWeight: FontWeight.bold),),
                   ),
                   Spacer(),
                   Expanded(
                     child: Container(
                       alignment: Alignment.bottomCenter,
                       child: Column(
                         children: [
                           Container(
                             alignment: Alignment.center,
                             child: Text('Resend code after 00 sec',
                               style: TextStyle(fontWeight: FontWeight.bold),),
                           ),
                           Container(
                             margin: const EdgeInsets.fromLTRB(30, 10, 30, 10),
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
                                   _verify();
                                 },
                                 textColor: Colors.white,
                                 child: const Padding(
                                   padding: EdgeInsets.all(10.0),
                                   child: const Text('Verify DID', style: const TextStyle(fontSize: 18,),),
                                 ),
                               ),
                             ),
                           )
                         ],
                       ),
                     ),
                   )
                 ],
               ),
             ),
           ),
         ),
       );
     });
   }

 }