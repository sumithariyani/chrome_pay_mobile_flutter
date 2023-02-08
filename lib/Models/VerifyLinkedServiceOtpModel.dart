// To parse this JSON data, do
//
//     final verifyLinkedServiceOtpModel = verifyLinkedServiceOtpModelFromJson(jsonString);

import 'dart:convert';

VerifyLinkedServiceOtpModel verifyLinkedServiceOtpModelFromJson(String str) {
  final jsonData = json.decode(str);
  return VerifyLinkedServiceOtpModel.fromJson(jsonData);
}

String verifyLinkedServiceOtpModelToJson(VerifyLinkedServiceOtpModel data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class VerifyLinkedServiceOtpModel {
  bool? status;
  String? msg;

  VerifyLinkedServiceOtpModel({
    this.status,
    this.msg,
  });

  factory VerifyLinkedServiceOtpModel.fromJson(Map<String, dynamic> json) => new VerifyLinkedServiceOtpModel(
    status: json["status"],
    msg: json["msg"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
  };
}
