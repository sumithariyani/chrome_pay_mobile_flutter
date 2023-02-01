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

  TextEditingController oldPassword = TextEditingController();
  TextEditingController newPassword = TextEditingController();
  TextEditingController confirmPassword = TextEditingController();

  late SharedPreferences prefs;
  ChangePaswordModel? _changePaswordModel;

  Future<void> Update() async {
    prefs = await SharedPreferences.getInstance();
    _changePaswordModel = await Services.ChangePassword(prefs.getString("ID").toString(), oldPassword.text,
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
                          margin: const EdgeInsets.fromLTRB(15, 40, 0, 0),
                          child: Image.asset('images/login_stuff_03.png',
                            height: 20,
                          ),
                        ),
                      ),
                      Container(
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
                        child: Card(
                          margin: const EdgeInsets.fromLTRB(10, 40, 10, 10),
                          elevation: 10.0,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(Radius.circular(10.0))
                          ),
                          color: Colors.white,
                          shadowColor: Colors.black,
                          child: SingleChildScrollView(
                            child: Container(
                              margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(top: 5.0),
                                    child: Text('Old Password',
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 15),),
                                  ),
                                  Container(
                                    height: 50,
                                    margin: EdgeInsets.only(top: 5.0),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey),
                                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                        color: const Color(0x0ff5f8fa)
                                    ),
                                    child: TextField(
                                      controller: oldPassword,
                                      keyboardType: TextInputType.name,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide.none,
                                              borderRadius: BorderRadius.circular(10.0)
                                          ),
                                          counterText: "",
                                          hintText: "Old Password"
                                      ),
                                      style: TextStyle(fontSize: 18.0),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 10.0),
                                    child: Text('New Password',
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 15),),
                                  ),
                                  Container(
                                    height: 50,
                                    margin: EdgeInsets.only(top: 5.0),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey),
                                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                        color: Color(0xff5f8fa)
                                    ),
                                    child: TextField(
                                      controller: newPassword,
                                      keyboardType: TextInputType.text,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide.none,
                                              borderRadius: BorderRadius.circular(10.0)
                                          ),
                                          counterText: "",
                                          hintText: "New Password"
                                      ),
                                      style: TextStyle(fontSize: 18.0),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 10.0),
                                    child: Text('Confirm Password',
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontSize: 15),),
                                  ),
                                  Container(
                                    height: 50,
                                    margin: EdgeInsets.only(top: 5.0),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey),
                                        borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                        color: Color(0xff5f8fa)
                                    ),
                                    child: TextField(
                                      controller: confirmPassword,
                                      keyboardType: TextInputType.emailAddress,
                                      decoration: InputDecoration(
                                          border: OutlineInputBorder(
                                              borderSide: BorderSide.none,
                                              borderRadius: BorderRadius.circular(10.0)
                                          ),
                                          counterText: "",
                                          hintText: "ConfirmPassword"
                                      ),
                                      style: TextStyle(fontSize: 18.0),
                                    ),
                                  ),
                                ],
                              ),
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
                          Color(0xff2CABBB),
                          Color(0xff0B527E),
                        ],begin: Alignment.topCenter,end: Alignment.bottomCenter)
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
                          child: const Text('Update', style: const TextStyle(fontSize: 18,),),
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

}