import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Models/AgencyBankingOtpModel.dart';
import '../Models/VerifyAgencyBankingOtpModel.dart';
import '../Services/Services.dart';
import 'agencybanking(2).dart';

class AgencyBanking extends StatefulWidget {
  @override
  _AgencyBankingState createState () => _AgencyBankingState();

}

class _AgencyBankingState extends State<AgencyBanking> {

  AgencyBankingOtpModel? _agencyBankingOtpModel;
  VerifyAgencyBankingOtpModel? _verifyAgencyBankingOtpModel;
  SharedPreferences? prefs;
  String? otp;

  Future<void> sendOtp() async {
    prefs = await SharedPreferences.getInstance();

    _agencyBankingOtpModel = await Services.AgencyOtp(prefs!.getString("token").toString(), mobileNumber.text);
    if(_agencyBankingOtpModel?.status!= false){
      Fluttertoast.showToast(msg: "${_agencyBankingOtpModel?.msg}",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM);
      _verifyDialog();
      // Navigator.of(context).push(MaterialPageRoute(builder: (context) => NewPassChange(widget.email),));
    }else{
      Fluttertoast.showToast(msg: "${_agencyBankingOtpModel?.msg}",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM);
    }
  }

  Future<void> verifyOtp() async {
    prefs = await SharedPreferences.getInstance();

    otp = _otp1.text+_otp2.text+_otp3.text+_otp4.text+_otp5.text+_otp6.text;

    _verifyAgencyBankingOtpModel = await Services.VerifyAgencyOtp(prefs!.getString("token").toString(), mobileNumber.text, otp!);
    if(_verifyAgencyBankingOtpModel?.status!= false){
      Fluttertoast.showToast(msg: "${_verifyAgencyBankingOtpModel?.msg}",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM);

      Navigator.of(context).push(MaterialPageRoute(builder: (context) => AgencyBanking2(),));

    }else{
      Fluttertoast.showToast(msg: "${_verifyAgencyBankingOtpModel?.msg}",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM);
    }
  }

  TextEditingController mobileNumber = TextEditingController();
  TextEditingController _otp1 = TextEditingController();
  TextEditingController _otp2 = TextEditingController();
  TextEditingController _otp3 = TextEditingController();
  TextEditingController _otp4 = TextEditingController();
  TextEditingController _otp5 = TextEditingController();
  TextEditingController _otp6 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
          children: [
            Container(
              alignment: Alignment.topRight,
              child: Image.asset('images/login_stuff_31.png',
                height: 200,
                width: 150,),
            ),
            Container(
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
                        child: Text('Agency Banking',
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
                      child: Card(
                        margin: EdgeInsets.fromLTRB(10, 40, 10, 10),
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(
                                10.0))
                        ),
                        color: Colors.white,
                        shadowColor: Colors.black,
                        child: Container(
                              margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    padding: EdgeInsets.only(
                                        top: 20.0, bottom: 10.0),
                                    child: Image.asset(
                                      'images/icon_12.png',
                                      height: 70,),
                                  ),
                                  Center(
                                    child: Container(
                                          height: 50,
                                          margin: EdgeInsets.only(top: 5.0),
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                              border: Border.all(
                                                  color: Colors.grey),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(5.0)),
                                              color: Color(0xff5f8fa)
                                          ),
                                          child: TextFormField(
                                            controller: mobileNumber,
                                            maxLength: 10,
                                            keyboardType: TextInputType
                                                .phone,
                                            decoration: InputDecoration(
                                                border: OutlineInputBorder(
                                                    borderSide: BorderSide
                                                        .none,
                                                    borderRadius: BorderRadius
                                                        .circular(10.0)
                                                ),
                                                counterText: "",
                                                hintText: "DID-Ref & Mobile number"
                                            ),
                                            style: TextStyle(fontSize: 18.0),
                                          ),
                                        ),
                                  ),
                                ],
                              ),
                            ),
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
                          Color(0xff2CABBB),
                          Color(0xff0B527E),
                        ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter)
                    ),
                    child: ButtonTheme(
                      minWidth: 400,
                      height: 50,
                      child: MaterialButton(
                        onPressed: () {
                          sendOtp();
                        },
                        textColor: Colors.white,
                        child: const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: Text('Next',
                            style: const TextStyle(fontSize: 18,),),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
          ]
      ),
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
                        ),
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
                  Spacer(),
                  Expanded(
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        children: [
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
                                  verifyOtp();
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