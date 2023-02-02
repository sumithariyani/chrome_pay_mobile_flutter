import 'dart:async';
import 'dart:convert';
import 'package:chrome_pay_mobile_flutter/Models/Agent%20Commisssion%20%20Model.dart';
import 'package:chrome_pay_mobile_flutter/Models/Agent%20Profile%20Model.dart';
import 'package:chrome_pay_mobile_flutter/Models/Agent%20Update%20Model.dart';
import 'package:chrome_pay_mobile_flutter/Models/Awating%20Did%20Model.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:chrome_pay_mobile_flutter/Models/Financial%20Model.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';


import '../Models/Agent Performance Model.dart';
import '../Models/All Did Model.dart';
import '../Models/ChangePasswordModel.dart';
import '../Models/Cust dash Model.dart';
import '../Models/CustomerViewOtpModel.dart';
import '../Models/Document Scanner Model.dart';
import '../Models/Image Upload Model.dart';
import '../Models/Login Model.dart';
import '../Models/OrganisationModel.dart';
import '../Models/Verify Cust Model.dart';
import '../Models/VerifyCustViewOtpModel.dart';
import '../Models/customer Register Model.dart';

class Services {

  // static String BaseUrl = "http://192.168.1.158:3300/";
  static String BaseUrl = "http://192.168.1.158:5000/";
  // static String BaseUrl = "http://ec2-user@ec2-13-233-63-235.ap-south-1.compute.amazonaws.com:3300/";

  static String Login = BaseUrl+"v1/auth/Login";
  static String AllDid = BaseUrl+"v1/views/DID/view-customer";
  static String AwatingDid = BaseUrl+"v1/view/DID/awaitingList";
  static String AgentCommisssion = BaseUrl+"v1/Commission/DID/commissionlist";
  static String CustomerDash = BaseUrl+"custdetail/";
  static String FinancialActivities = BaseUrl+"calculate_final_activities/";
  static String AgentProfile = BaseUrl+"agentProfile/";
  static String UpdateProfile = BaseUrl+"agentProfileUpdate/";
  static String AgentPerformance = BaseUrl+"get_agent_cut_month/";
  static String CustomerRegistration = BaseUrl+"createCustomerByOrg1/";
  static String DocumentScanner = BaseUrl+"createCustomerByOrg2";
  static String VerifyCustOtp = BaseUrl+"new_verify_customer";
  static String OrganisationList = BaseUrl+"orgList";
  static String ImageUploader = BaseUrl+"globalImageUploader";
  static String CustomerViewOtp = BaseUrl+"send_cust_otp_data_view";
  static String VerifyCustViewOtp = BaseUrl+"verify_cust_view_OTP";
  static String ChangePass = BaseUrl+"agentchangePassword/";

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
        Fluttertoast.showToast(msg: "",
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

  static Future<AllDidModel> CustomerList(String token, int page) async {
    // final params = {
    //   "adminIDToken": token,
    //   "page": page.toString(),
    // };

    print("token${token}");
    http.Response response = await http.post(Uri.parse(AllDid), headers:
        {HttpHeaders.contentTypeHeader: "application/json", HttpHeaders.authorizationHeader: "Bearer $token"});
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

  static Future<AwatingDidModel> PendingList(String token, int page) async {
    final params = {
      // "token": token,
      "page": page.toString()
    };
    print(params);
    http.Response response = await http.post(Uri.parse(AwatingDid), headers: {
      HttpHeaders.contentTypeHeader: "application/json", HttpHeaders.authorizationHeader: "Bearer $token"});
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

    http.Response response = await http.post(Uri.parse(AgentCommisssion), headers: {
      HttpHeaders.contentTypeHeader: "application/json", HttpHeaders.authorizationHeader: "Bearer $token"});

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

  static Future<Object> CustRegister(String id, String orgId, String image, String name,
      String number, String dob, String gender, String email, String nationality, String profession, String kinName, String kinPhone, String age, String city) async {
    var uri = CustomerRegistration+id+"/"+orgId;
    var request = new http.MultipartRequest("POST", Uri.parse(uri));
    // var multipart = await http.MultipartFile.fromPath("IDphoto",image.path);
    request.fields["fullname"] = name;
    request.fields["dateOfBirth"] = dob;
    request.fields["phone"] = number;
    request.fields["email"] = email;
    request.fields["gender"] = gender;
    request.fields["nationality"] = nationality;
    request.fields["professoin"] = profession;
    request.fields["nextFOKniPhone"] = kinPhone;
    request.fields["nextFOKinName"] = kinName;
    request.fields["age"] = age;
    request.fields["city"] = city;
    request.fields["IDphoto"] = image;
    // request.files.add(multipart);

    // print('request ${multipart}');
    print('request ${request.fields}');


    var response = await request.send();
    var response2 = await http.Response.fromStream(response);

    print(response2.body);
    if (response2.statusCode == 201){
      var data = json.decode(response2.body);
      print(data);
      CustomerRegisterModel user = CustomerRegisterModel.fromJson(data);
      return user;
    }else{
      print(response2);
      throw Error();
    }
  }

  static Future<DocumentScannerModel> DocumentScan(String residace, String local, String land, String landSize,
      String assetType, String assetID, String phone, String email, int age, String city) async {

    var uri = DocumentScanner;
    var request = new http.MultipartRequest("POST", Uri.parse(uri));
    // var residenceMulti = await http.MultipartFile.fromPath("residace", residace.path);
    // var localMulti = await http.MultipartFile.fromPath("residace", local.path);
    // var landMulti = await http.MultipartFile.fromPath("residace", land.path);

    // request.files.add(residenceMulti);
    // request.files.add(localMulti);
    // request.files.add(landMulti);
    request.fields['residace'] = residace;
    request.fields['local'] = local;
    request.fields['land'] = land;
    request.fields['landSize'] = landSize;
    request.fields['assetType'] = assetType;
    request.fields['assetID'] = assetID;
    request.fields['phone'] = phone;
    request.fields['age'] = age.toString();
    request.fields['city'] = city;
    request.fields['email'] = email;

    var response = await request.send();
    var response2 = await http.Response.fromStream(response);

    print(response2.body);
    if (response2.statusCode == 200){
      var data = json.decode(response2.body);
      print(data);
      DocumentScannerModel user = DocumentScannerModel.fromJson(data);
      return user;
    }else{
      print(response2.body);
      throw Error();
    }

  }

  static Future<VerifyCustModel> VerifyCust(String otp, String phone) async {
    final params = {
      "OTP": otp,
      "phoneNo": phone,
    };
    print(params);
    http.Response response = await http.post(Uri.parse(VerifyCustOtp), body: params);
    print("VerifyCust "+response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      VerifyCustModel user = VerifyCustModel.fromJson(data);
      return user;
    }else{
      print(response.body);
      throw Exception('Failed');
    }
  }

  static Future<FinancialModel> Finance(String custID) async {
    final params = {
      "custID": custID,
    };

    http.Response response = await http.post(Uri.parse(FinancialActivities+custID), body: params);
    print("cust_dash " + response.body);

    if (response.statusCode == 200){
      var data = jsonDecode(response.body);
      FinancialModel user = FinancialModel.fromJson(data);
      return user;
    }else{
      print(response.body);
      throw Exception('Failed');
    }
  }

  static Future<AgentPerformanceModel> AgentPer(String filter) async {
    final params = {
      "filter": filter
    };
    print("params${params}");

    http.Response response = await http.post(Uri.parse(AgentPerformance+"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJuYW1lIjoiVmlyZW5kcmEgc2hpbGthciIsImFnZW50SUQiOiI2Mzg0NTVjMDVmMTJjMjc5ZmUxOGUzNDYiLCJvcmdJRCI6IjYzODQ1MWQyNWYxMmMyNzlmZTE4ZTJkMSIsInVzZXJuYW1lIjoidmlyZW5kcmFAZ21haWwuY29tIiwiaWF0IjoxNjc0MTM2NDcyfQ.1bmP7uCKxJ57H5elRnnuK0n6qigTiS-Tn4Ac_-sa0xc"), body: params);

    print("agentperformancegraph " + response.body);

    if (response.statusCode == 200){
      var data = jsonDecode(response.body);
      AgentPerformanceModel user = AgentPerformanceModel.fromJson(data);
      return user;
    }else{
      print(response.body);
      throw Exception('Failed');
    }
  }

  static Future<OrganisationModel> OrgList() async {

    http.Response response = await http.get(Uri.parse(OrganisationList));
    print("OrganisationList " + response.body);

    if (response.statusCode == 200){
      var data = jsonDecode(response.body);
      OrganisationModel user = OrganisationModel.fromJson(data);
      return user;
    }else{
      print(response.body);
      throw Exception('Failed');
    }
  }

  static Future<ImageUploadModel> ProfileImage(File image,) async {

    var uri = ImageUploader;

    var request = new http.MultipartRequest("POST", Uri.parse(uri));
    print(uri);
    var idPhoto = await http.MultipartFile.fromPath("IDphoto",image.path);
    // var residenceMulti = await http.MultipartFile.fromPath("residace", residace.path);
    // var localMulti = await http.MultipartFile.fromPath("local", local.path);
    // var landMulti = await http.MultipartFile.fromPath("land", land.path);

    request.files.add(idPhoto);
    // request.files.add(residenceMulti);
    // request.files.add(localMulti);
    // request.files.add(landMulti);

    var response = await request.send();
    var response2 = await http.Response.fromStream(response);

    print(response.toString());
    print(response2.body);

    if (response2.statusCode == 200){
      var data = json.decode(response2.body);
      print("ImageUploadersss "+data.toString());
      print(response);
      ImageUploadModel user = ImageUploadModel.fromJson(data);
      return user;

    }else{
      print("gfhgkfgh ${response2.body}");
      throw Error();
    }
  }

  static Future<ImageUploadModel> ResidenceImage(File residace,) async {

    var uri = ImageUploader;

    var request = new http.MultipartRequest("POST", Uri.parse(uri));
    print(uri);
    var residenceMulti = await http.MultipartFile.fromPath("residace", residace.path);
    // var localMulti = await http.MultipartFile.fromPath("local", local.path);
    // var landMulti = await http.MultipartFile.fromPath("land", land.path);

    request.files.add(residenceMulti);
    // request.files.add(residenceMulti);
    // request.files.add(localMulti);
    // request.files.add(landMulti);

    var response = await request.send();
    var response2 = await http.Response.fromStream(response);

    print(response.toString());
    print("residance "+response2.body);

    if (response2.statusCode == 200){
      var data = json.decode(response2.body);
      print("residanceUploadersss "+data.toString());
      print(response);
      ImageUploadModel user = ImageUploadModel.fromJson(data);
      return user;

    }else{
      print("residance ${response2.body}");
      throw Error();
    }
  }

  static Future<ImageUploadModel> DocumentImage(File document,) async {

    var uri = ImageUploader;

    var request = new http.MultipartRequest("POST", Uri.parse(uri));
    print(uri);
    var localMulti = await http.MultipartFile.fromPath("local", document.path);
    // var landMulti = await http.MultipartFile.fromPath("land", land.path);

    request.files.add(localMulti);
    // request.files.add(landMulti);

    var response = await request.send();
    var response2 = await http.Response.fromStream(response);

    print(response.toString());
    print("document "+response2.body);

    if (response2.statusCode == 200){
      var data = json.decode(response2.body);
      print("documentUploadersss "+data.toString());
      print(response);
      ImageUploadModel user = ImageUploadModel.fromJson(data);
      return user;

    }else{
      print("document ${response2.body}");
      throw Error();
    }
  }

  static Future<ImageUploadModel> RegistrationImage(File registraion,) async {

    var uri = ImageUploader;

    var request = new http.MultipartRequest("POST", Uri.parse(uri));
    print(uri);

    var landMulti = await http.MultipartFile.fromPath("land", registraion.path);

    request.files.add(landMulti);

    var response = await request.send();
    var response2 = await http.Response.fromStream(response);

    print(response.toString());
    print("registraion "+response2.body);

    if (response2.statusCode == 200){
      var data = json.decode(response2.body);
      print("registraioneUploadersss "+data.toString());
      print(response);
      ImageUploadModel user = ImageUploadModel.fromJson(data);
      return user;

    }else{
      print("registraion ${response2.body}");
      throw Error();
    }
  }

  static Future<CustomerViewOtpModel> CustViewOtp(String phone) async {
    final params = {
      "phoneNo": phone
    };

    http.Response response = await http.post(Uri.parse(CustomerViewOtp),body: params);
    print("CustomerViewOtp " + response.body);

    if (response.statusCode == 200){
      var data = jsonDecode(response.body);
      CustomerViewOtpModel user = CustomerViewOtpModel.fromJson(data);
      return user;
    }else{
      print(response.body);
      throw Exception('Failed');
    }
  }

  static Future<VerifyCustViewOtpModel> VerifyCustomerViewOtp(String phone, String otp) async {
    final params = {
      "phoneNo": phone,
      "OTP": otp
    };

    http.Response response = await http.post(Uri.parse(VerifyCustViewOtp),body: params);
    print("VerifyCustViewOtp " + response.body);

    if (response.statusCode == 200){
      var data = jsonDecode(response.body);
      VerifyCustViewOtpModel user = VerifyCustViewOtpModel.fromJson(data);
      return user;
    }else{
      print(response.body);
      throw Exception('Failed');
    }
  }

  static Future<ChangePaswordModel> ChangePassword(String Id, String oldPass, String newPass,String confirmPass) async {
    final params = {
      "agentID": Id,
      "oldPassword": oldPass,
      "newPassword": newPass,
      "confirmPassword": confirmPass,
    };
    print("Id ${Id}");
    http.Response response = await http.post(Uri.parse(ChangePass+Id),body: params);
    print("VerifyCustViewOtp " + response.body);

    if (response.statusCode == 200){
      var data = jsonDecode(response.body);
      ChangePaswordModel user = ChangePaswordModel.fromJson(data);
      return user;
    }else{
      print(response.body);
      throw Exception('Failed');
    }
  }
}