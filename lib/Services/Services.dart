import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

import '../Models/All Did Model.dart';
import '../Models/Cust dash Model.dart';
import '../Models/Login Model.dart';

class Services {

  // static String BaseUrl = "http://192.168.1.158:3300/";
  static String BaseUrl = "http://ec2-user@ec2-13-233-63-235.ap-south-1.compute.amazonaws.com:3300/";

  static String Login = BaseUrl+"agent_login_new";
  static String AllDid = BaseUrl+"agentcustomerList/";
  static String CustomerDash = BaseUrl+"custdetail/";

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

  static Future<AllDidModel> CustomerList(String agent_id) async {
    final params = {
      "adminID": agent_id,
    };

    http.Response response = await http.post(Uri.parse(AllDid+agent_id), body: params);
    print("all Did "+response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      AllDidModel user = AllDidModel.fromJson(data);
      return user;
    }else{
      print(response.body);
      throw Exception('Failed');
    }
    var data = jsonDecode(response.body);
    AllDidModel user = AllDidModel.fromJson(data);
    return user;
  }

  static Future<CustDetailModel> GetCustDetail(String custID) async {
    final params = {
      "custID": custID,
    };

    http.Response response = await http.post(Uri.parse(CustomerDash+custID), body: params);
    print(response.body);

    if (response.statusCode == 200){
      var data = jsonDecode(response.body);
      CustDetailModel user = CustDetailModel.fromJson(data);
      return user;
    }else{
      print(response.body);
      throw Exception('Failed');
    }
  }
}