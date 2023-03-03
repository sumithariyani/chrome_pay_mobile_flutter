import 'package:chrome_pay_mobile_flutter/Activity/edit%20profile.dart';
import 'package:chrome_pay_mobile_flutter/Activity/login.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'changepassword.dart';

class Setting extends StatefulWidget {
  @override
  _SettingState createState ()=> _SettingState();

}

class _SettingState extends State<Setting> {

  late SharedPreferences prefs;

  getAsync() async {
    try{
      prefs = await SharedPreferences.getInstance();
      setState(() {

      });
    }catch (e) {
      print(e);
    }
  }

  void LogoutMethod() async{
    prefs = await SharedPreferences.getInstance();
    // prefs?.remove('ID');
    // prefs?.remove('orgID');
    // prefs?.remove('token');
    // prefs?.remove('agentislogin');
    prefs.clear();
    Fluttertoast.showToast(
      msg: "Logout successfully",
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.CENTER);

    // Navigator.pop(context);
    // Navigator.push(context, MaterialPageRoute(builder: (context) => Login()),
    // );

    Navigator.of(context).pushAndRemoveUntil(
      MaterialPageRoute(
        builder: (BuildContext context) => Login(),
      ),
          (Route route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                          padding: EdgeInsets.all(5.0),
                          margin: const EdgeInsets.fromLTRB(10, 30, 0, 0),
                          child: Image.asset('images/login_stuff_03.png',
                            height: 20,
                          ),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(top: 5.0),
                        margin: const EdgeInsets.fromLTRB(10, 30, 0, 0),
                        child: Text('Settings',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(top: 30.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onTap: (){
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => EditProfile()),
                            );
                          },
                          child: Card(
                            color: Colors.transparent,
                            margin: EdgeInsets.fromLTRB(20, 0, 20, 30),
                            elevation: 10,
                            shadowColor: Colors.black,
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.white
                              ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(top: 5.0),
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.transparent
                                      ),
                                      child: Container(
                                        alignment: Alignment.center,
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
                                          child: Image.asset("images/new pages-06.png",
                                            height: 20,
                                          alignment: Alignment.center,),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.symmetric(horizontal: 10.0),
                                      alignment: Alignment.center,
                                      child: Text('Edit Profile',
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontFamily: "OpensansSemiBold"
                                        ),),
                                    ),
                                    Spacer(),
                                    Container(
                                        alignment: Alignment.centerRight,
                                        margin: EdgeInsets.symmetric(horizontal: 10.0),
                                        child: Icon(
                                          Icons.arrow_forward_ios)
                                    )
                                  ],
                                )
                            ),
                          ),
                        ),
                        InkWell(
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onTap: () {
                            Navigator.push(context,
                              MaterialPageRoute(builder: (context) => ChangePassword()),
                            );
                          },
                          child: Card(
                            color: Colors.transparent,
                            margin: EdgeInsets.fromLTRB(20, 0, 20, 20),
                            elevation: 10,
                            shadowColor: Colors.black,
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 60,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.white
                              ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(top: 5.0),
                                      width: 50,
                                      height: 50,
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          color: Colors.transparent
                                      ),
                                      child: Container(
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
                                          child: Image.asset("images/new pages-07.png",
                                            height: 30,),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.symmetric(horizontal: 10.0),
                                      alignment: Alignment.center,
                                      child: Text('Change Password',
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontFamily: "OpensansSemiBold"
                                        ),),
                                    ),
                                    Spacer(),
                                    Container(
                                        alignment: Alignment.centerRight,
                                        margin: EdgeInsets.symmetric(horizontal: 10.0),
                                        child: Icon(
                                            Icons.arrow_forward_ios)
                                    )
                                  ],
                                )
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                Stack(
                  children: [
                    Container(
                      alignment: Alignment.bottomCenter,
                      margin: EdgeInsets.fromLTRB(30, 0, 30, 20),
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                          gradient: LinearGradient(colors: [
                            Color(0xff0B527E),
                            Color(0xff2CABBB),
                          ],begin: Alignment.topLeft,end: Alignment.bottomRight)
                      ),
                      child: ButtonTheme(
                        minWidth: 400,
                        height: 60,
                        child: MaterialButton(
                          highlightColor: Colors.transparent,
                          splashColor: Colors.transparent,
                          onPressed: () {

                            LogoutMethod();

                          },
                          textColor: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(right: 5.0),
                                  child: Image.asset("images/new pages-08.png",
                                    height: 20,),
                                ),
                                Text('Log Out', style: TextStyle(fontSize: 18,
                                fontFamily: "OpensansSemiBold"),),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                )

              ],
            ),
          )
    );
  }

}