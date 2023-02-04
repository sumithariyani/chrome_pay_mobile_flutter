import 'package:flutter/material.dart';

import '../Models/ForgotPasswordModel.dart';
import '../Services/Services.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'forgotpassotp.dart';


class ForgotPassword extends StatefulWidget {
  @override
  _ForgotPasswordState createState() => _ForgotPasswordState();

}

class _ForgotPasswordState extends State<ForgotPassword> {

  ForgotPasswordModel? _forgotPasswordModel;
  TextEditingController email = TextEditingController();

  Future<void> forgotPassWord() async {
    // _forgotPasswordModel = await Services.ForgotPass(email.text);
    // if(_forgotPasswordModel?.status!= false){
    //   Fluttertoast.showToast(msg: "${_forgotPasswordModel?.msg}",
    //       toastLength: Toast.LENGTH_SHORT,
    //       gravity: ToastGravity.BOTTOM);
    //   Navigator.of(context).push(MaterialPageRoute(builder: (context) => ForgotPassOtp(email.text),));
    // }else{
    //   Fluttertoast.showToast(msg: "${_forgotPasswordModel?.msg}",
    //       toastLength: Toast.LENGTH_SHORT,
    //       gravity: ToastGravity.BOTTOM);
    // }
  }
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
                                  child: Text('Verify Your Email',
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
                            margin: EdgeInsets.only(left: 15.0, top: 15.0),
                            child: Image.asset("images/login_stuff_02.png",
                              height: 70,
                              width: 70,),
                          ),
                          Container(
                              margin: EdgeInsets.only(left: 15.0, top: 15.0),
                              child: Text("Enter Your Registered Email",
                                style: TextStyle(fontWeight: FontWeight.w600,
                                    color: Colors.black38),)
                          ),
                          Center(
                            child: Container(
                              margin: EdgeInsets.only(top: 30.0, left: 20.0, right: 20.0),
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
                              child: Text('Continue', style: TextStyle(fontSize: 18,),),
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