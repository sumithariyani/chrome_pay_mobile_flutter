// To parse this JSON data, do
//
//     final agencyBankingOtpModel = agencyBankingOtpModelFromJson(jsonString);

import 'dart:convert';

AgencyBankingOtpModel agencyBankingOtpModelFromJson(String str) {
  final jsonData = json.decode(str);
  return AgencyBankingOtpModel.fromJson(jsonData);
}

String agencyBankingOtpModelToJson(AgencyBankingOtpModel data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class AgencyBankingOtpModel {
  bool? status;
  String? msg;

  AgencyBankingOtpModel({
    this.status,
    this.msg,
  });

  factory AgencyBankingOtpModel.fromJson(Map<String, dynamic> json) => new AgencyBankingOtpModel(
    status: json["status"],
    msg: json["msg"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
  };
}
