// To parse this JSON data, do
//
//     final linkedServiceOtpModel = linkedServiceOtpModelFromJson(jsonString);

import 'dart:convert';

LinkedServiceOtpModel linkedServiceOtpModelFromJson(String str) {
  final jsonData = json.decode(str);
  return LinkedServiceOtpModel.fromJson(jsonData);
}

String linkedServiceOtpModelToJson(LinkedServiceOtpModel data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class LinkedServiceOtpModel {
  bool? status;
  String? msg;

  LinkedServiceOtpModel({
    this.status,
    this.msg,
  });

  factory LinkedServiceOtpModel.fromJson(Map<String, dynamic> json) => new LinkedServiceOtpModel(
    status: json["status"],
    msg: json["msg"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
  };
}
