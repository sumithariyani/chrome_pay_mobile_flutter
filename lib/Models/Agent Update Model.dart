// To parse this JSON data, do
//
//     final agentUpdateModel = agentUpdateModelFromJson(jsonString);

import 'dart:convert';

AgentUpdateModel agentUpdateModelFromJson(String str) => AgentUpdateModel.fromJson(json.decode(str));

String agentUpdateModelToJson(AgentUpdateModel data) => json.encode(data.toJson());

class AgentUpdateModel {
  AgentUpdateModel({
    this.status,
    this.msg,
  });

  bool? status;
  String? msg;

  factory AgentUpdateModel.fromJson(Map<String, dynamic> json) => AgentUpdateModel(
    status: json["status"] == null ? null : json["status"],
    msg: json["msg"] == null ? null : json["msg"],
  );

  Map<String, dynamic> toJson() => {
    "status": status == null ? null : status,
    "msg": msg == null ? null : msg,
  };
}
