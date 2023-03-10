import 'package:chrome_pay_mobile_flutter/Activity/customer%20profile.dart';
import 'package:chrome_pay_mobile_flutter/Models/Login%20Model.dart';
import 'package:chrome_pay_mobile_flutter/Services/Services.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Customer/customer_dash.dart';
import 'agent.dart';
import 'forgotpassword.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginFormState();
}

class _LoginFormState extends State <Login> {

  SharedPreferences? prefs;

  bool _isHidden = true;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();
  bool _isPageLoading = false;
  late LoginModel loginModel;
  Future<void> LoginMethod(String Email, String Password)  async {
    loginModel = await Services.LoginCredentials(Email, Password);

    SharedPreferences custPrefs = await SharedPreferences.getInstance();
    setState(() {
      _isPageLoading = true;
    });
    if (loginModel.status!=false){
      prefs?.setString('loginStatus', loginModel.Login_status.toString());
      setState(() {

        if (loginModel.Login_status!.matchAsPrefix("agent") != null){
          prefs?.setString('ID', loginModel.ID.toString());
          prefs?.setString('orgID', loginModel.orgID.toString());
          prefs?.setString('token', loginModel.token.toString());
          prefs?.setBool("agentislogin", true);
          prefs?.setString("name", loginModel.name.toString());
          prefs?.setString("image", loginModel.image.toString());
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => Agent(),));
        }
        if (loginModel.Login_status!.matchAsPrefix("customer") != null){
          prefs?.setString('custID', loginModel.ID.toString());
          prefs?.setString('cust_token', loginModel.token.toString());
          prefs?.setBool('custislogin', true);
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (context) => CustomerDash(),));
        }
        if(loginModel.status!=true){
          prefs?.setBool('islogin', false);
          // custPrefs.setBool('custislogin', false);
          Fluttertoast.showToast(msg: "${loginModel.msg}",
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM);
        }
      });
    }
    setState(() {
      _isPageLoading = false;
    });
  }
  getAsync() async {
  try{
  prefs = await SharedPreferences.getInstance();
  setState(() {

  });
  }catch (e) {
  print(e);
  }
  }

  @override
  void initState() {
    super.initState();
    getAsync();
  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
          resizeToAvoidBottomInset: false,
          body: Stack(
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(flex:10,
                          child: Container(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.fromLTRB(10, 40, 0, 0),
                                  child: Image.asset("images/login_stuff_02.png",
                                    height: 70,
                                    width: 70,),
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
                                  child: const Text("Welcome Back! ",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                      fontSize: 30,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ) ,
                                ),
                                Container(
                                  margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                  child: const Text("Enter your credentials to continue ",
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey
                                    ),
                                  ) ,
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  margin: EdgeInsets.fromLTRB(10, 50, 10, 0),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        alignment: Alignment.center,
                                        child: TextField(
                                          controller: email,
                                          keyboardType: TextInputType.text,
                                          decoration: InputDecoration(
                                              counterText: "",
                                              prefixIcon:Container(
                                                margin: EdgeInsets.symmetric(horizontal: 10),
                                                child: Image.asset("images/login_stuff_04.png",
                                                  height: 5,
                                                  width: 5,),
                                              ),
                                              hintText: 'Email'
                                          ),
                                          style: TextStyle(fontSize: 20.0),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.center,
                                        margin: EdgeInsets.only(top: 10),
                                        child: TextField(
                                          textAlignVertical: TextAlignVertical.center,
                                          controller: password,
                                          obscureText: _isHidden,
                                          keyboardType: TextInputType.text,
                                          decoration: InputDecoration(
                                            prefixIcon: Container(
                                              margin: EdgeInsets.all(10),
                                              child: Image.asset("images/login_stuff_05.png",
                                                height: 5,
                                                width: 5,),
                                            ),
                                            hintText: 'Password',
                                            isCollapsed: true,
                                            suffix: InkWell(
                                              onTap: _togglePasswordView,
                                              child: Icon(
                                                _isHidden
                                                    ? Icons.visibility
                                                    : Icons.visibility_off,
                                              ),
                                            ),
                                          ),
                                          style: TextStyle(fontSize: 20.0),
                                        ),
                                      ),
                                      Container(
                                        alignment: Alignment.centerRight,
                                        margin: EdgeInsets.fromLTRB(0, 20, 0, 0),
                                        child: InkWell(
                                          onTap: (){
                                            Navigator.of(context).push(
                                                MaterialPageRoute(builder: (context) => ForgotPassword(),));
                                          },
                                          child: const Text("Forgot Password? ",
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.bold,
                                                color: Color(0xff7C7EF8)
                                            ),
                                          ),
                                        ) ,
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),),
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
                              child: _isPageLoading ? Center(
                                child: CircularProgressIndicator(),
                              ): ButtonTheme(
                                minWidth: 400,
                                height: 50,
                                child: MaterialButton(
                                  highlightColor: Colors.transparent,
                                  splashColor: Colors.transparent,
                                  onPressed: () {
                                    if(email.text.isEmpty){
                                      Fluttertoast.showToast(
                                          msg: "Enter Email",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.BOTTOM);
                                    }else if(password.text.isEmpty){
                                      Fluttertoast.showToast(
                                          msg: "Enter Password",
                                          toastLength: Toast.LENGTH_SHORT,
                                          gravity: ToastGravity.BOTTOM);
                                    }else{
                                      LoginMethod(email.text.trim(), password.text.trim());
                                    }
                                  },
                                  textColor: Colors.white,
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: Text('Login', style: TextStyle(fontSize: 18,),),
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
              ]
          )
      );
  }

  void _togglePasswordView(){
    setState((){
      _isHidden = !_isHidden;
    });
  }

  void navigaterUser(){
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => Agent(),));
  }
}