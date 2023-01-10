import 'dart:async';
import 'dart:convert';
import 'package:chrome_pay_mobile_flutter/Models/Agent%20Commisssion%20%20Model.dart';
import 'package:chrome_pay_mobile_flutter/Models/Agent%20Profile%20Model.dart';
import 'package:chrome_pay_mobile_flutter/Models/Agent%20Update%20Model.dart';
import 'package:chrome_pay_mobile_flutter/Models/Awating%20Did%20Model.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';

import '../Models/All Did Model.dart';
import '../Models/Bar Chart Model.dart';
import '../Models/Cust dash Model.dart';
import '../Models/Login Model.dart';

class Services {

  static String BaseUrl = "http://192.168.1.158:3300/";
  // static String BaseUrl = "http://ec2-user@ec2-13-233-63-235.ap-south-1.compute.amazonaws.com:3300/";

  static String Login = BaseUrl+"agent_login_new";
  static String AllDid = BaseUrl+"agentcustomerList/";
  static String CustomerDash = BaseUrl+"custdetail/";
  static String AwatingDid = BaseUrl+"AgentAwaiting/";
  static String AgentCommisssion = BaseUrl+"commissionlist/";
  static String AgentProfile = BaseUrl+"agentProfile/";
  static String UpdateProfile = BaseUrl+"agentProfileUpdate/";
  static String AgentPerformance = BaseUrl+"get_agent_cut_month/";

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

    print("agent_id "+agent_id);
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
    print("cust_dash " + response.body);

    if (response.statusCode == 200){
      var data = jsonDecode(response.body);
      CustDetailModel user = CustDetailModel.fromJson(data);
      return user;
    }else{
      print(response.body);
      throw Exception('Failed');
    }
  }

  static Future<AwatingDidModel> PendingList(String token) async {
    final params = {
      "token": token,
    };
    print(params);
    http.Response response = await http.post(Uri.parse(AwatingDid+token), body: params);
    print("awating Did "+response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      AwatingDidModel user = AwatingDidModel.fromJson(data);
      return user;
    }else{
      print(response.body);
      throw Exception('Failed');
    }
  }

  static Future<AgentCommissionModel> CommissionList(String token, int page, String fromDate, String toDate) async {
    final params = {
      // "token": token,
      "page": page.toString(),
      "fromDate": fromDate,
      "toDate": toDate
    };
    print(params);
    http.Response response = await http.post(Uri.parse(AgentCommisssion+token), body: params);
    print("AgentCommisssion "+response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      AgentCommissionModel user = AgentCommissionModel.fromJson(data);
      return user;
    }else{
      print(response.body);
      throw Exception('Failed');
    }
  }
  static Future<AgentProfileModel> UpdateAgentProfile(String id) async {
   Map<String, String> requestHeaders = {
     "agentID": id
   };

    http.Response response = await http.get(Uri.parse(AgentProfile+id), headers: requestHeaders);
    print("AgentProfile "+response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      AgentProfileModel user = AgentProfileModel.fromJson(data);
      return user;
    }else{
      print(response.body);
      throw Exception('Failed');
    }
  }

  static Future<AgentUpdateModel> AgentUpdate(String id, String name, String email, String phone, String country, String address, String city, String postCode) async {
    final params = {
      "agentID": id,
      "name": name,
      "email": email,
      "phone": phone,
      "country": country,
      "address": address,
      "city": city,
      "postCode": postCode,
    };
    print("params $params");
    http.Response response = await http.post(Uri.parse(UpdateProfile+id), body: params);
    print("UpdateProfile "+response.body);

    if (response.statusCode == 200) {

      if (response.body.contains("true")){
        Fluttertoast.showToast(msg: "Update Successfully",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER);
      }
    }else{
      print(response.body);
      throw Exception('Failed');
    }
    var data = jsonDecode(response.body);
    AgentUpdateModel user = AgentUpdateModel.fromJson(data);
    return user;
  }

  static Future<BarChartModel> AgentGraph(String token,) async {
    Map<String, String> requestHeaders = {
      "token": token
    };

    http.Response response = await http.get(Uri.parse(AgentPerformance+token), headers: requestHeaders);
    print("AgentPerformance "+response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      BarChartModel user = BarChartModel.fromJson(data);
      return user;
    }else{
      print(response.body);
      throw Exception('Failed');
    }
  }

}