// To parse this JSON data, do
//
//     final customerViewOtpModel = customerViewOtpModelFromJson(jsonString);

import 'dart:convert';

CustomerViewOtpModel customerViewOtpModelFromJson(String str) => CustomerViewOtpModel.fromJson(json.decode(str));

String customerViewOtpModelToJson(CustomerViewOtpModel data) => json.encode(data.toJson());

class CustomerViewOtpModel {
  CustomerViewOtpModel({
    this.status,
    this.msg,
  });

  bool? status;
  String? msg;

  factory CustomerViewOtpModel.fromJson(Map<String, dynamic> json) => CustomerViewOtpModel(
    status: json["status"],
    msg: json["msg"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
  };
}
