import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

import '../Models/Login Model.dart';

class Services {

  static String BaseUrl = "http://192.168.1.158:3300/";

  static String Login = BaseUrl+"agent_login_new";

  // ignore: non_constant_identifier_names
  static Future<LoginModel> LoginCredentials(String EMAIL, String PASSWORD) async{
    final params = {
      "username": EMAIL,
      "password": PASSWORD,
    };
    print(params.toString());
    http.Response response = await http.post(Uri.parse(Login), body: params);
    print(response.body);

    if (response.statusCode == 200){

      if (response.body.contains("false")){
        Fluttertoast.showToast(msg: "Invalid Credentials",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM);
      }
      else if (response.body.contains("agent")) {
        Fluttertoast.showToast(msg: "This is Agent",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM);
      }
      else if (response.body.contains("customer")) {
        Fluttertoast.showToast(msg: "This is Customer",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.BOTTOM);
      }else {
        print(response.body);
        throw Exception('Failed');
      }
    }
    var data = jsonDecode(response.body);
    LoginModel user = LoginModel.fromJson(data);
    return user;
    // return LoginModel();
  }
}