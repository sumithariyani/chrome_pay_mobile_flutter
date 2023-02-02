// To parse this JSON data, do
//
//     final forgotPassOtpModel = forgotPassOtpModelFromJson(jsonString);

import 'dart:convert';

ForgotPassOtpModel forgotPassOtpModelFromJson(String str) => ForgotPassOtpModel.fromJson(json.decode(str));

String forgotPassOtpModelToJson(ForgotPassOtpModel data) => json.encode(data.toJson());

class ForgotPassOtpModel {
  ForgotPassOtpModel({
    this.status,
    this.msg,
  });

  bool? status;
  String? msg;

  factory ForgotPassOtpModel.fromJson(Map<String, dynamic> json) => ForgotPassOtpModel(
    status: json["status"],
    msg: json["msg"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
  };
}
