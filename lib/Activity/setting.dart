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
      body: Stack(
        children: [
          Container(
            alignment: Alignment.topRight,
            child: Image.asset('images/login_stuff_31.png',
              height: 200,
              width: 150),
          ),
          Container(
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
                          margin: const EdgeInsets.fromLTRB(10, 30, 0, 0),
                          child: Image.asset('images/login_stuff_03.png',
                            height: 20,
                          ),
                        ),
                      ),
                      Container(
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
                          onTap: (){
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => EditProfile()),
                            );
                          },
                          child: Card(
                            color: Colors.transparent,
                            margin: EdgeInsets.fromLTRB(20, 0, 20, 20),
                            elevation: 5,
                            shadowColor: Colors.black,
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.white
                              ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.symmetric(horizontal: 10.0),
                                      alignment: Alignment.center,
                                      child: Text('Edit Profile',
                                        style: TextStyle(fontWeight: FontWeight.w500),),
                                    ),
                                    Spacer(),
                                    Container(
                                        alignment: Alignment.centerRight,
                                        margin: EdgeInsets.symmetric(horizontal: 10.0),
                                        child: Image.asset('images/login_stuff_11.png',
                                          height: 30,)
                                    )
                                  ],
                                )
                            ),
                          ),
                        ),
                        InkWell(
                          onTap: () {
                            Navigator.push(context,
                              MaterialPageRoute(builder: (context) => ChangePassword()),
                            );
                          },
                          child: Card(
                            color: Colors.transparent,
                            margin: EdgeInsets.fromLTRB(20, 0, 20, 20),
                            elevation: 5,
                            shadowColor: Colors.black,
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                color: Colors.white
                              ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: EdgeInsets.symmetric(horizontal: 10.0),
                                      alignment: Alignment.center,
                                      child: Text('Change Password',
                                        style: TextStyle(fontWeight: FontWeight.w500),),
                                    ),
                                    Spacer(),
                                    Container(
                                        alignment: Alignment.centerRight,
                                        margin: EdgeInsets.symmetric(horizontal: 10.0),
                                        child: Image.asset('images/login_stuff_11.png',
                                          height: 30,)
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

                            LogoutMethod();

                          },
                          textColor: Colors.white,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Text('Log Out', style: TextStyle(fontSize: 18,),),
                          ),
                        ),
                      ),
                    ),
                  ],
                )

              ],
            ),
          )
        ],
      ),
    );
  }

}