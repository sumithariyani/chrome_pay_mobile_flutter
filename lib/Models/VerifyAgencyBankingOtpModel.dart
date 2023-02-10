// To parse this JSON data, do
//
//     final verifyAgencyBankingOtpModel = verifyAgencyBankingOtpModelFromJson(jsonString);

import 'dart:convert';

VerifyAgencyBankingOtpModel verifyAgencyBankingOtpModelFromJson(String str) {
  final jsonData = json.decode(str);
  return VerifyAgencyBankingOtpModel.fromJson(jsonData);
}

String verifyAgencyBankingOtpModelToJson(VerifyAgencyBankingOtpModel data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class VerifyAgencyBankingOtpModel {
  bool? status;
  String? msg;

  VerifyAgencyBankingOtpModel({
    this.status,
    this.msg,
  });

  factory VerifyAgencyBankingOtpModel.fromJson(Map<String, dynamic> json) => new VerifyAgencyBankingOtpModel(
    status: json["status"],
    msg: json["msg"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
  };
}
