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

      Navigator.of(context).push(MaterialPageRoute(builder: (context) => AgencyBanking2("${_verifyAgencyBankingOtpModel?.data?.iDphoto}","${_verifyAgencyBankingOtpModel?.data?.fullname}"),));

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
      body:Container(
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
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: Colors.transparent),
                              child: Container(
                                width: 80,
                                height: 80,
                                margin: EdgeInsets.only(left: 8.0),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    gradient: LinearGradient(colors: [
                                      Color(0xff0B527E),
                                      Color(0xff2CABBB),
                                    ],begin: Alignment.bottomLeft, end: Alignment.topRight)
                                ),
                                child: CircleAvatar(
                                  backgroundColor: Colors.transparent,
                                  child: Image.asset("images/icon-03-03.png",
                                    height: 50,),
                                ),
                              ),
                            ),
                            Container(
                              alignment: Alignment.centerLeft,
                              margin: EdgeInsets.only(top: 10.0, bottom: 10.0, left: 5.0),
                              child: Text('DID-Ref & Mobile No.',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 16,
                                    fontFamily: "OpensansSemiBold"),),
                            ),
                            Center(
                              child: Card(
                                elevation: 10,
                                color: Colors.white,
                                shadowColor: Colors.black,
                                child: Container(
                                  height: 50,
                                  margin: EdgeInsets.only(top: 5.0, left: 5.0),
                                  alignment: Alignment.center,
                                  child: TextFormField(
                                    controller: mobileNumber,
                                    maxLength: 10,
                                    keyboardType: TextInputType
                                        .phone,
                                    decoration: InputDecoration(
                                        border: InputBorder.none,
                                        counterText: "",
                                        hintText: "DID-Ref & Mobile number"
                                    ),
                                    style: TextStyle(fontSize: 18.0),
                                  ),
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
                        Color(0xff0B527E),
                        Color(0xff2CABBB),
                      ],
                          begin: Alignment.bottomLeft,
                          end: Alignment.topRight)
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
  _agencyBakingDialog() {
    showDialog(context: context,
        barrierDismissible: false,
        barrierColor: Colors.transparent,
        builder: (BuildContext dialogContext){
          return StatefulBuilder(builder: (dialogContext, setState){
            return Dialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
              elevation: 0.0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 300,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(
                      Radius.circular(40.0)),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          gradient: LinearGradient(colors: [
                            Color(0xff0B527E),
                            Color(0xff2CABBB),
                          ],begin: Alignment.topLeft, end: Alignment.topRight),
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0)
                          )
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 10.0, top: 10),
                              child: Text('Select one of them',
                                style: TextStyle(fontSize: 18,
                                    color: Colors.white,
                                    fontFamily: 'OpensansSemiBold'),
                              ),
                            ),
                            Expanded(
                              child: InkWell(
                                highlightColor: Colors.transparent,
                                splashColor: Colors.transparent,
                                onTap: () {
                                  setState(() {
                                    // Navigator.of(context).pop();
                                  });
                                },
                                child: Container(
                                  alignment: Alignment.topRight,
                                  padding: EdgeInsets.all(10.0),
                                  child: Image.asset('images/popup-06.png',
                                    width: 20,
                                    height: 20,),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),

                    Spacer(),
                    Column(
                      children: [
                        Card(
                          margin: EdgeInsets.fromLTRB(20, 0, 20, 20),
                          elevation: 10,
                          color: Colors.transparent,
                          shadowColor: Colors.black,
                          child: InkWell(
                            highlightColor: Colors.transparent,
                            splashColor: Colors.transparent,
                            onTap: (){
                              // Navigator.of(context).pushReplacement(
                              //     MaterialPageRoute(builder:
                              //         (context)=>  RegisterCustomer("","")
                              //     )
                              // );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                  color: Colors.white
                              ),
                              width: MediaQuery.of(context).size.width,
                              height: 50,
                              child: Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 8.0, top: 8.0, bottom: 8.0),
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        gradient: LinearGradient(colors: [
                                          Color(0xff0B527E),
                                          Color(0xff2CABBB),
                                        ],begin: Alignment.bottomLeft, end: Alignment.topRight)
                                    ),
                                    child: CircleAvatar(
                                      backgroundColor: Colors.transparent,
                                      child: Image.asset("images/icon-03-03.png",
                                        height: 20,),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 10.0),
                                    child: Text("DID-Ref & mobile no.",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontFamily: 'OpensansRegular'),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Spacer(),
                  ],
                ),
              ),
            );
          });
        });
  }

}

class AgencyDialog extends StatefulWidget {
  @override
  _AgencyDialogState createState() => _AgencyDialogState();

}

class _AgencyDialogState extends State<AgencyBanking> {

  TextEditingController mobileNumber = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey,
      body: Dialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        elevation: 0.0,
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: 300,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(
                Radius.circular(40.0)),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                    gradient: LinearGradient(colors: [
                      Color(0xff0B527E),
                      Color(0xff2CABBB),
                    ],begin: Alignment.topLeft, end: Alignment.topRight),
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0)
                    )
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.only(left: 10.0, top: 10),
                        child: Text('Select one of them',
                          style: TextStyle(fontSize: 18,
                              color: Colors.white,
                              fontFamily: 'OpensansSemiBold'),
                        ),
                      ),
                      Expanded(
                        child: InkWell(
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onTap: () {
                            setState(() {
                              // Navigator.of(context).pop();
                            });
                          },
                          child: Container(
                            alignment: Alignment.topRight,
                            padding: EdgeInsets.all(10.0),
                            child: Image.asset('images/popup-06.png',
                              width: 20,
                              height: 20,),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),

              Spacer(),
              Column(
                children: [
                  Card(
                    margin: EdgeInsets.fromLTRB(20, 0, 20, 20),
                    elevation: 10,
                    color: Colors.transparent,
                    shadowColor: Colors.black,
                    child: InkWell(
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onTap: (){
                        // Navigator.of(context).pushReplacement(
                        //     MaterialPageRoute(builder:
                        //         (context)=>  RegisterCustomer("","")
                        //     )
                        // );
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(10.0)),
                            color: Colors.white
                        ),
                        width: MediaQuery.of(context).size.width,
                        height: 50,
                        child: Row(
                          children: [
                            Container(
                              margin: EdgeInsets.only(left: 8.0, top: 8.0, bottom: 8.0),
                              decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  gradient: LinearGradient(colors: [
                                    Color(0xff0B527E),
                                    Color(0xff2CABBB),
                                  ],begin: Alignment.bottomLeft, end: Alignment.topRight)
                              ),
                              child: CircleAvatar(
                                backgroundColor: Colors.transparent,
                                child: Image.asset("images/icon-03-03.png",
                                  height: 20,),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 10.0),
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
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Spacer(),
            ],
          ),
        ),
      ),
    );
  }
}

