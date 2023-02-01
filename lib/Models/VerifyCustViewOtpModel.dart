// To parse this JSON data, do
//
//     final verifyCustViewOtpModel = verifyCustViewOtpModelFromJson(jsonString);

import 'dart:convert';

VerifyCustViewOtpModel verifyCustViewOtpModelFromJson(String str) => VerifyCustViewOtpModel.fromJson(json.decode(str));

String verifyCustViewOtpModelToJson(VerifyCustViewOtpModel data) => json.encode(data.toJson());

class VerifyCustViewOtpModel {
  VerifyCustViewOtpModel({
    this.status,
    this.msg,
  });

  bool? status;
  String? msg;

  factory VerifyCustViewOtpModel.fromJson(Map<String, dynamic> json) => VerifyCustViewOtpModel(
    status: json["status"],
    msg: json["msg"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
  };
}
