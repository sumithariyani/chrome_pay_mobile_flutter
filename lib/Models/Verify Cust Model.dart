// To parse this JSON data, do
//
//     final verifyCustModel = verifyCustModelFromJson(jsonString);

import 'dart:convert';

VerifyCustModel verifyCustModelFromJson(String str) => VerifyCustModel.fromJson(json.decode(str));

String verifyCustModelToJson(VerifyCustModel data) => json.encode(data.toJson());

class VerifyCustModel {
  VerifyCustModel({
    this.status,
    this.msg,
  });

  bool? status;
  String? msg;

  factory VerifyCustModel.fromJson(Map<String, dynamic> json) => VerifyCustModel(
    status: json["status"],
    msg: json["msg"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
  };
}
