
 import 'dart:convert';

LoginModel loginModelFromJson(String str) => LoginModel.fromJson(json.decode(str));

String loginModelToFromJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    this.status,
    this.Login_status,
    this.msg,
    this.token,
    this.ID,
    this.orgID,
    this.custID,
});

  bool? status;
  String? Login_status;
  String? msg;
  String? token;
  String? ID;
  String? orgID;
  String? custID;

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
    status: json["status"] == null ? null : json["status"],
    Login_status: json["Login_status"] == null ? null : json["Login_status"],
    msg: json["msg"] == null ? null : json["msg"],
    token: json["token"] == null ? null : json["token"],
    ID: json["ID"] == null ? null : json["ID"],
    orgID: json["orgID"] == null ? null : json["orgID"],
    custID: json["custID"] == null ? null : json["custID"],
  );

  Map<String, dynamic> toJson() => {
    "status": status == null ? null : status,
    "Login_status": Login_status == null ? null : Login_status,
    "msg": msg == null ? null : msg,
    "token": token == null ? null : token,
    "ID": ID == null ? null : ID,
    "orgID": orgID == null ? null : orgID,
    "custID": custID == null ? null : custID,
  };
}