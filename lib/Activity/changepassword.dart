import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../Models/ChangePasswordModel.dart';
import '../Services/Services.dart';


class ChangePassword extends StatefulWidget {
  @override
  _ChangePasswordState createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword>{

  bool _isHidden = true;
  bool _isHiddenNew = true;
  bool _isHiddenConfirm = true;
  TextEditingController oldPassword = TextEditingController();
  TextEditingController newPassword = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  late SharedPreferences prefs;
  ChangePaswordModel? _changePaswordModel;

  Future<void> Update() async {
    prefs = await SharedPreferences.getInstance();
    _changePaswordModel = await Services.ChangePassword(prefs.getString("token").toString(), oldPassword.text,
        newPassword.text, confirmPassword.text);

    if(_changePaswordModel?.status==true){
      print('ho0');
      Fluttertoast.showToast(msg: "${_changePaswordModel?.msg}",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM);

    }else{
      Fluttertoast.showToast(msg: "${_changePaswordModel?.msg}",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.BOTTOM);
    }
    setState(() {
    });
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
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
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
                        margin: const EdgeInsets.fromLTRB(15, 40, 0, 0),
                        child: const Text('Change Password',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold
                          ),),
                      ),
                    ],
                  ),
                  Expanded(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.fromLTRB(10, 40, 10, 10),
                        child: SingleChildScrollView(
                          child: Container(
                            margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: 5.0, left: 5.0, bottom: 5.0),
                                  child: Text('Old Password',
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 15),),
                                ),
                                Card(
                                  elevation: 5,
                                  color: Colors.white,
                                  shadowColor: Colors.black,
                                  child: Container(
                                    height: 50,
                                    margin: EdgeInsets.only(top: 5.0, left: 10.0),
                                    alignment: Alignment.center,
                                    child: TextFormField(
                                      controller: oldPassword,
                                      maxLength: 10,
                                      obscureText: _isHidden,
                                      keyboardType: TextInputType
                                          .phone,
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          counterText: "",
                                          hintText: "Old Password",
                                        suffix: InkWell(
                                          onTap: _togglePasswordView,
                                          child: Container(
                                            margin: EdgeInsets.only(right: 5.0),
                                            child: _isHidden
                                            ? Image.asset("images/change password-02.png",
                                            height: 20,):
                                                Image.asset("images/change password-03.png",
                                                height: 20,)
                                          ),
                                        )
                                      ),
                                      style: TextStyle(fontSize: 18.0),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 20.0, left: 5.0, bottom: 5.0),
                                  child: Text('New Password',
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 15),),
                                ),
                                Card(
                                  elevation: 5,
                                  color: Colors.white,
                                  shadowColor: Colors.black,
                                  child: Container(
                                    height: 50,
                                    margin: EdgeInsets.only(top: 5.0, left: 10.0),
                                    alignment: Alignment.center,
                                    child: TextFormField(
                                      controller: newPassword,
                                      maxLength: 10,
                                      obscureText: _isHiddenNew,
                                      keyboardType: TextInputType
                                          .phone,
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          counterText: "",
                                          hintText: "New Password",
                                          suffix: InkWell(
                                            onTap: _togglePasswordViewNew,
                                            child: Container(
                                                margin: EdgeInsets.only(right: 5.0),
                                                child: _isHiddenNew
                                                    ? Image.asset("images/change password-02.png",
                                                  height: 20,):
                                                Image.asset("images/change password-03.png",
                                                  height: 20,)
                                            ),
                                          )
                                      ),
                                      style: TextStyle(fontSize: 18.0),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 20.0, left: 5.0, bottom: 5.0),
                                  child: Text('Confirm Password',
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontSize: 15),),
                                ),
                                Card(
                                  elevation: 5,
                                  color: Colors.white,
                                  shadowColor: Colors.black,
                                  child: Container(
                                    height: 50,
                                    margin: EdgeInsets.only(top: 5.0, left: 10.0),
                                    alignment: Alignment.center,
                                    child: TextFormField(
                                      controller: confirmPassword,
                                      maxLength: 10,
                                      obscureText: _isHiddenConfirm,
                                      keyboardType: TextInputType
                                          .phone,
                                      decoration: InputDecoration(
                                          border: InputBorder.none,
                                          counterText: "",
                                          hintText: "Confirm Password",
                                          suffix: InkWell(
                                            onTap: _togglePasswordViewConfirm,
                                            child: Container(
                                                margin: EdgeInsets.only(right: 5.0),
                                                child: _isHiddenConfirm
                                                    ? Image.asset("images/change password-02.png",
                                                  height: 20,):
                                                Image.asset("images/change password-03.png",
                                                  height: 20,)
                                            ),
                                          )
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
                        borderRadius: BorderRadius.all(Radius.circular(40.0)),
                        gradient: LinearGradient(colors: [
                          Color(0xff0B527E),
                          Color(0xff2CABBB),
                        ],begin: Alignment.topLeft,end: Alignment.bottomRight)
                    ),
                    child: ButtonTheme(
                      minWidth: 400,
                      height: 50,
                      child: MaterialButton(
                        onPressed: () {
                          Update();
                          // Update(fullName.text, email.text, mobileNumber.text, coutry.text,
                          //     citty.text, address.text, postalcode.text);
                        },
                        textColor: Colors.white,
                        child: const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: const Text('Update', style: const TextStyle(fontSize: 18,
                          fontFamily: "OpensansSemiBold"),),
                        ),
                      ),
                    ),
                  )
                ],
              ),
            )
    );
  }

  void _togglePasswordView(){
    setState((){
      _isHidden = !_isHidden;
    });
  }
  void _togglePasswordViewNew(){
    setState((){
      _isHiddenNew = !_isHiddenNew;
    });
  }

  void _togglePasswordViewConfirm(){
    setState((){
      _isHiddenConfirm = !_isHiddenConfirm;
    });
  }

}