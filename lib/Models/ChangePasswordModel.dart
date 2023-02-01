// To parse this JSON data, do
//
//     final changePaswordModel = changePaswordModelFromJson(jsonString);

import 'dart:convert';

ChangePaswordModel changePaswordModelFromJson(String str) => ChangePaswordModel.fromJson(json.decode(str));

String changePaswordModelToJson(ChangePaswordModel data) => json.encode(data.toJson());

class ChangePaswordModel {
  ChangePaswordModel({
    this.status,
    this.msg,
  });

  bool? status;
  String? msg;

  factory ChangePaswordModel.fromJson(Map<String, dynamic> json) => ChangePaswordModel(
    status: json["status"],
    msg: json["msg"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
  };
}
