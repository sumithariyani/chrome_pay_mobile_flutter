// To parse this JSON data, do
//
//     final newChangePassModel = newChangePassModelFromJson(jsonString);

import 'dart:convert';

NewChangePassModel newChangePassModelFromJson(String str) => NewChangePassModel.fromJson(json.decode(str));

String newChangePassModelToJson(NewChangePassModel data) => json.encode(data.toJson());

class NewChangePassModel {
  NewChangePassModel({
    this.status,
    this.msg,
  });

  bool? status;
  String? msg;

  factory NewChangePassModel.fromJson(Map<String, dynamic> json) => NewChangePassModel(
    status: json["status"],
    msg: json["msg"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
  };
}
