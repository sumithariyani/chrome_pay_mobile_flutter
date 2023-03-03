import 'dart:async';
import 'dart:convert';
import 'package:chrome_pay_mobile_flutter/Models/Agent%20Commisssion%20%20Model.dart';
import 'package:chrome_pay_mobile_flutter/Models/Agent%20Profile%20Model.dart';
import 'package:chrome_pay_mobile_flutter/Models/Agent%20Update%20Model.dart';
import 'package:chrome_pay_mobile_flutter/Models/Awating%20Did%20Model.dart';
import 'package:chrome_pay_mobile_flutter/Models/Financial%20Model.dart';
import 'package:http/http.dart' as http;
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:io';
import '../Models/AgencyBankingOtpModel.dart';
import '../Models/Agent Performance Model.dart';
import '../Models/All Did Model.dart';
import '../Models/ChangePasswordModel.dart';
import '../Models/Cust dash Model.dart';
import '../Models/CustomerViewOtpModel.dart';
import '../Models/Document Scanner Model.dart';
import '../Models/ForgotPassOtpModel.dart';
import '../Models/ForgotPasswordModel.dart';
import '../Models/Image Upload Model.dart';
import '../Models/LinkedServiceOtpModel.dart';
import '../Models/Login Model.dart';
import '../Models/NewChangePassModel.dart';
import '../Models/Verify Cust Model.dart';
import '../Models/VerifyAgencyBankingOtpModel.dart';
import '../Models/VerifyCustViewOtpModel.dart';
import '../Models/VerifyLinkedServiceOtpModel.dart';
import '../Models/customer Register Model.dart';

class Services {

  // static String BaseUrl = "http://192.168.1.158:3300/";
  // static String BaseUrl = "http://ec2-user@ec2-13-233-63-235.ap-south-1.compute.amazonaws.com:3300/";
  // static String BaseUrl = "http://192.168.1.158:5000/";
  static String BaseUrl = "http://43.205.35.164:5000/";

  static String Login = BaseUrl+"v1/auth/Login";
  static String ForgotPassword = BaseUrl+"v1/auth/ForgotPassword";
  static String ForgotPasswordOtp = BaseUrl+"v1/auth/ForgetPassVerifyOtp";
  static String NewChangePassword = BaseUrl+"v1/auth/ForgotchangePass";
  static String AllDid = BaseUrl+"v1/views/DID/view-customer";
  static String AwatingDid = BaseUrl+"v1/view/DID/awaitingList";
  static String AgentCommisssion = BaseUrl+"v1/Commission/DID/commissionlist";
  static String AgentPerformance = BaseUrl+"v1/Agnet/agnetPerformance";
  static String AgecyBankingOtp = BaseUrl+"v1/AgencyBanking/send-otp";
  static String VerifyAgecyBankingOtp = BaseUrl+"v1/AgencyBanking/verify-otp";
  static String AgentProfile = BaseUrl+"v1/settings/agentProfile";
  static String UpdateProfile = BaseUrl+"v1/settings/agentProfileUpdate";
  static String ChangePass = BaseUrl+"v1/settings/agentchangePassword";
  static String CustomerViewOtp = BaseUrl+"v1/Detail/DID/send_cust_otp_data_view";
  static String VerifyCustViewOtp = BaseUrl+"v1/Detail/DID/verify_cust_view_OTP";
  static String CustomerDash = BaseUrl+"v1/Detail/DID/cust-Detail/";
  static String FinancialActivities = BaseUrl+"v1/Detail/DID/customer-financial-activity/";
  static String CustomerRegistration = BaseUrl+"v1/DID/registerDID1";
  static String DocumentScanner = BaseUrl+"v1/DID/registerDID2";
  static String VerifyCustOtp = BaseUrl+"v1/DID/verifyOTP";
  static String LinkedServicesOtp = BaseUrl+"v1/DID/Linked-send-otp";
  static String VerifyLinkedServicesOtp = BaseUrl+"v1/DID/Linked-service";
  static String ImageUploader = BaseUrl+"v1/DID/ImageUploader";


  static Future<LoginModel> LoginCredentials(String EMAIL, String PASSWORD) async{
    final params = {
      "username": EMAIL,
      "password": PASSWORD,
    };
    print(params.toString());
    http.Response response = await http.post(Uri.parse(Login), body: params);
    print(response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      LoginModel user = LoginModel.fromJson(data);
      return user;
    }else {
        print(response.body);
        throw Exception('Failed');
      }
  }

  static Future<ForgotPasswordModel> ForgotPass(String email) async{
    final params = {
      "email": email,
    };

    http.Response response = await http.post(Uri.parse(ForgotPassword), body: params);
    print("ForgotPassword "+ response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      ForgotPasswordModel user = ForgotPasswordModel.fromJson(data);
      return user;
    }else{
      print(response.body);
      throw Exception('Failed');
    }
  }

  static Future<ForgotPassOtpModel> ForgotPassOtp(String email, String otp) async{
    final params = {
      "email": email,
      "otp": otp,
    };

    http.Response response = await http.post(Uri.parse(ForgotPasswordOtp), body: params);
    print("ForgotPasswordOtp "+ response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      ForgotPassOtpModel user = ForgotPassOtpModel.fromJson(data);
      return user;
    }else{
      print(response.body);
      throw Exception('Failed');
    }
  }

  static Future<NewChangePassModel> NewChangePass(String email, String newPass, String confirmPass) async{
    final params = {
      "email": email,
      "newPassword": newPass,
      "confirmPassword": confirmPass,
    };

    http.Response response = await http.post(Uri.parse(NewChangePassword), body: params);
    print("NewChangePassword "+ response.body);

    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      NewChangePassModel user = NewChangePassModel.fromJson(data);
      return user;
    }else{
      print(response.body);
      throw Exception('Failed');
    }
  }

  static Future<AllDidModel> CustomerList(String token, int page) async {
    final params = {
      "page": page.toString(),
    };

    Map<String, String> requestHeaders = {
      'Authorization': "Bearer $token",
      'Content-Type': 'application/json'
    };

    print(token);
    http.Response response = await http.post(Uri.parse(AllDid), headers: requestHeaders, body: jsonEncode(params));
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

  static Future<AwatingDidModel> PendingList(String token, int page) async {
    final params = {
      "page": page.toString()
    };

    Map<String, String> requestHeaders = {
      'Authorization': "Bearer $token",
      'Content-Type': 'application/json'
    };
    print("params>>>>> ${params}");
    http.Response response = await http.post(Uri.parse(AwatingDid), headers: requestHeaders, body: jsonEncode(params));
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
      "page": page.toString(),
      "fromDate": fromDate,
      "toDate": toDate
    };

    Map<String, String> requestHeaders = {
      'Authorization': "Bearer $token",
      'Content-Type': 'application/json'
    };

    print(params);
    http.Response response = await http.post(Uri.parse(AgentCommisssion), headers: requestHeaders, body: jsonEncode(params));
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

  static Future<AgentPerformanceModel> AgentPer(String token,String filter) async {
    final params = {
      "filter": filter
    };

    print("params${params}");

    Map<String, String> requestHeaders = {
      'Authorization': "Bearer $token",
      'Content-Type': 'application/json'
    };
    http.Response response = await http.post(Uri.parse(AgentPerformance), headers: requestHeaders, body: jsonEncode(params));

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

  static Future<AgencyBankingOtpModel> AgencyOtp(String token,String ID) async {
    final params = {
      "ID": ID
    };

    print("params${params}");

    Map<String, String> requestHeaders = {
      'Authorization': "Bearer $token",
      'Content-Type': 'application/json'
    };
    http.Response response = await http.post(Uri.parse(AgecyBankingOtp), headers: requestHeaders, body: jsonEncode(params));

    print("agentperformancegraph " + response.body);

    if (response.statusCode == 200){
      var data = jsonDecode(response.body);
      AgencyBankingOtpModel user = AgencyBankingOtpModel.fromJson(data);
      return user;
    }else{
      print(response.body);
      throw Exception('Failed');
    }
  }

  static Future<VerifyAgencyBankingOtpModel> VerifyAgencyOtp(String token,String ID, String otp) async {
    final params = {
      "ID": ID,
      "OTP": otp
    };

    print("params${params}");

    Map<String, String> requestHeaders = {
      'Authorization': "Bearer $token",
      'Content-Type': 'application/json'
    };
    http.Response response = await http.post(Uri.parse(VerifyAgecyBankingOtp), headers: requestHeaders, body: jsonEncode(params));

    print("agentperformancegraph " + response.body);

    if (response.statusCode == 200){
      var data = jsonDecode(response.body);
      VerifyAgencyBankingOtpModel user = VerifyAgencyBankingOtpModel.fromJson(data);
      return user;
    }else{
      print(response.body);
      throw Exception('Failed');
    }
  }

  static Future<AgentProfileModel> UpdateAgentProfile(String token) async {
    Map<String, String> requestHeaders = {
      'Authorization': "Bearer $token",
      'Content-Type': 'application/json'
    };

    http.Response response = await http.get(Uri.parse(AgentProfile), headers: requestHeaders);
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

  static Future<AgentUpdateModel> AgentUpdate(String token, String name, String email, String phone, String country, String address, String city, String postCode) async {
    final params = {
      "name": name,
      "email": email,
      "phone": phone,
      "country": country,
      "address": address,
      "city": city,
      "postCode": postCode,
    };
    Map<String, String> requestHeaders = {
      'Authorization': "Bearer $token",
      'Content-Type': 'application/json'
    };
    print("params $params");
    http.Response response = await http.post(Uri.parse(UpdateProfile), headers: requestHeaders, body: jsonEncode(params));
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

  static Future<ChangePaswordModel> ChangePassword(String token, String oldPass, String newPass,String confirmPass) async {
    final params = {
      "oldPassword": oldPass,
      "newPassword": newPass,
      "confirmPassword": confirmPass,
    };
    Map<String, String> requestHeaders = {
      'Authorization': "Bearer $token",
      'Content-Type': 'application/json'
    };
    http.Response response = await http.post(Uri.parse(ChangePass), headers: requestHeaders, body: jsonEncode(params));
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

  static Future<CustomerViewOtpModel> CustViewOtp(String token, String phone) async {
    final params = {
      "phoneNo": phone
    };
    Map<String, String> requestHeaders = {
      'Authorization': "Bearer $token",
      'Content-Type': 'application/json'
    };

    http.Response response = await http.post(Uri.parse(CustomerViewOtp), headers: requestHeaders, body: jsonEncode(params));
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

  static Future<VerifyCustViewOtpModel> VerifyCustomerViewOtp(String token, String phone, String otp) async {
    final params = {
      "phoneNo": phone,
      "OTP": otp
    };
    Map<String, String> requestHeaders = {
      'Authorization': "Bearer $token",
      'Content-Type': 'application/json'
    };
    http.Response response = await http.post(Uri.parse(VerifyCustViewOtp), headers: requestHeaders, body: jsonEncode(params));
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

  static Future<CustDetailModel> GetCustDetail(String token, String custID) async {
    final params = {
      "custID": custID,
    };
    Map<String, String> requestHeaders = {
      'Authorization': "Bearer $token",
      'Content-Type': 'application/json'
    };
    
    http.Response response = await http.post(Uri.parse(CustomerDash+custID), headers: requestHeaders, body: jsonEncode(params));
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

  static Future<FinancialModel> Finance(String token, String custID) async {
    final params = {
      "custID": custID,
    };
    Map<String, String> requestHeaders = {
      'Authorization': "Bearer $token",
      'Content-Type': 'application/json'
    };
    http.Response response = await http.post(Uri.parse(FinancialActivities+custID), headers: requestHeaders, body: jsonEncode(params));
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

  static Future<Object> CustRegister(String token, String image, String name,
      String number, String dob, String gender, String email, String nationality, String profession, String kinName, String kinPhone, String city) async {
    var uri = CustomerRegistration;
    Map<String, String> requestHeaders = {
      'Authorization': "Bearer $token",
      'Content-Type': 'application/json'
    };
    var request = new http.MultipartRequest("POST", Uri.parse(uri));
    // var multipart = await http.MultipartFile.fromPath("IDphoto",image.path);
    request.headers.addAll(requestHeaders);
    request.fields["fullname"] = name;
    request.fields["dateOfBirth"] = dob;
    request.fields["phone"] = number;
    request.fields["email"] = email;
    request.fields["gender"] = gender;
    request.fields["nationality"] = nationality;
    request.fields["professoin"] = profession;
    request.fields["nextFOKniPhone"] = kinPhone;
    request.fields["nextFOKinName"] = kinName;
    request.fields["city"] = city;
    request.fields["IDphoto"] = image;
    // request.files.add(multipart);

    // print('request ${multipart}');


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

  static Future<DocumentScannerModel> DocumentScan(String token, String residace, String local, String land, String landSize,
      String assetType, String assetID, String phone, String email, String city) async {

    var uri = DocumentScanner;
    Map<String, String> requestHeaders = {
      'Authorization': "Bearer $token",
      'Content-Type': 'application/json'
    };
    var request = new http.MultipartRequest("POST", Uri.parse(uri));
    // var residenceMulti = await http.MultipartFile.fromPath("residace", residace.path);
    // var localMulti = await http.MultipartFile.fromPath("residace", local.path);
    // var landMulti = await http.MultipartFile.fromPath("residace", land.path);

    // request.files.add(residenceMulti);
    // request.files.add(localMulti);
    // request.files.add(landMulti);
    request.headers.addAll(requestHeaders);
    request.fields['residace'] = residace;
    request.fields['local'] = local;
    request.fields['land'] = land;
    request.fields['landSize'] = landSize;
    request.fields['assetType'] = assetType;
    request.fields['assetID'] = assetID;
    request.fields['phone'] = phone;
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

  static Future<VerifyCustModel> VerifyCust(String token, String otp, String phone) async {
    final params = {
      "OTP": otp,
      "phoneNo": phone,
    };
    Map<String, String> requestHeaders = {
      'Authorization': "Bearer $token",
      'Content-Type': 'application/json'
    };
    print(params);
    http.Response response = await http.post(Uri.parse(VerifyCustOtp), headers: requestHeaders, body: jsonEncode(params));
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

  static Future<LinkedServiceOtpModel> LinkedService(String token, String DIDref) async {

    final params = {
      "DIDref": DIDref,
    };
    Map<String, String> requestHeaders = {
      'Authorization': "Bearer $token",
      'Content-Type': 'application/json'
    };
    http.Response response = await http.post(Uri.parse(LinkedServicesOtp), headers: requestHeaders, body: jsonEncode(params));
    print("LinkedServicesOtp " + response.body);

    if (response.statusCode == 200){
      var data = jsonDecode(response.body);
      LinkedServiceOtpModel user = LinkedServiceOtpModel.fromJson(data);
      return user;
    }else{
      print(response.body);
      throw Exception('Failed');
    }
  }

  static Future<VerifyLinkedServiceOtpModel> VerifyLinkedService(String token, String DIDref, String otp) async {

    final params = {
      "DIDref": DIDref,
      "otp": otp,
    };
    print(params);
    Map<String, String> requestHeaders = {
      'Authorization': "Bearer $token",
      'Content-Type': 'application/json'
    };
    http.Response response = await http.post(Uri.parse(VerifyLinkedServicesOtp), headers: requestHeaders, body: jsonEncode(params));
    print("LinkedServicesOtp " + response.body);

    if (response.statusCode == 200){
      var data = jsonDecode(response.body);
      VerifyLinkedServiceOtpModel user = VerifyLinkedServiceOtpModel.fromJson(data);
      return user;
    }else{
      print(response.body);
      throw Exception('Failed');
    }
  }

  static Future<ImageUploadModel> ProfileImage(String token, File image,) async {

    var uri = ImageUploader;
    Map<String, String> requestHeaders = {
      'Authorization': "Bearer $token",
      'Content-Type': 'application/json'
    };

    var request = new http.MultipartRequest("POST", Uri.parse(uri));
    print(uri);
    var idPhoto = await http.MultipartFile.fromPath("IDphoto",image.path);

    request.headers.addAll(requestHeaders);
    request.files.add(idPhoto);

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

  static Future<ImageUploadModel> ResidenceImage(String token, File residace,) async {

    var uri = ImageUploader;

    Map<String, String> requestHeaders = {
      'Authorization': "Bearer $token",
      'Content-Type': 'application/json'
    };

    var request = new http.MultipartRequest("POST", Uri.parse(uri));
    print(uri);
    var residenceMulti = await http.MultipartFile.fromPath("residace", residace.path);
    // var localMulti = await http.MultipartFile.fromPath("local", local.path);
    // var landMulti = await http.MultipartFile.fromPath("land", land.path);

    request.headers.addAll(requestHeaders);
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

  static Future<ImageUploadModel> DocumentImage(String token, File document,) async {

    var uri = ImageUploader;
    Map<String, String> requestHeaders = {
      'Authorization': "Bearer $token",
      'Content-Type': 'application/json'
    };
    var request = new http.MultipartRequest("POST", Uri.parse(uri));
    print(uri);
    var localMulti = await http.MultipartFile.fromPath("local", document.path);
    // var landMulti = await http.MultipartFile.fromPath("land", land.path);

    request.headers.addAll(requestHeaders);
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

  static Future<ImageUploadModel> RegistrationImage(String token, File registraion,) async {

    var uri = ImageUploader;
    Map<String, String> requestHeaders = {
      'Authorization': "Bearer $token",
      'Content-Type': 'application/json'
    };
    var request = new http.MultipartRequest("POST", Uri.parse(uri));
    print(uri);

    var landMulti = await http.MultipartFile.fromPath("land", registraion.path);

    request.headers.addAll(requestHeaders);
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

}