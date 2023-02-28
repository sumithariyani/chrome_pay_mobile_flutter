// To parse this JSON data, do
//
//     final agentCommissionModel = agentCommissionModelFromJson(jsonString);

import 'dart:convert';

AgentCommissionModel agentCommissionModelFromJson(String str) => AgentCommissionModel.fromJson(json.decode(str));

String agentCommissionModelToJson(AgentCommissionModel data) => json.encode(data.toJson());

class AgentCommissionModel {
  AgentCommissionModel({
    this.status,
    this.totlaRow,
    this.currenPage,
    this.filter,
  });

  bool? status;
  int? totlaRow;
  int? currenPage;
  List<Filter>? filter;

  factory AgentCommissionModel.fromJson(Map<String, dynamic> json) => AgentCommissionModel(
    status: json["status"] == null ? null : json["status"],
    totlaRow: json["totlaRow"] == null ? null : json["totlaRow"],
    currenPage: json["currenPage"] == null ? null : json["currenPage"],
    filter: json["filter"] == null ? null : List<Filter>.from(json["filter"].map((x) => Filter.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status == null ? null : status,
    "totlaRow": totlaRow == null ? null : totlaRow,
    "currenPage": currenPage == null ? null : currenPage,
    "filter": filter == null ? null : List<dynamic>.from(filter!.map((x) => x.toJson())),
  };
}

class Filter {
  Filter({
    this.id,
    this.custPhoto,
    this.agentId,
    this.custId,
    this.custName,
    this.commission,
    this.commissionId,
    this.createdAt,
    this.updatedAt,
    this.Date,
    this.Time,
    this.v,
  });

  String? id;
  String? custPhoto;
  String? agentId;
  String? custId;
  String? custName;
  int? commission;
  String? commissionId;
  String? createdAt;
  String? updatedAt;
  String? Date;
  String? Time;
  int? v;

  factory Filter.fromJson(Map<String, dynamic> json) => Filter(
    id: json["_id"] == null ? null : json["_id"],
    custPhoto: json["custPhoto"] == null ? null : json["custPhoto"],
    agentId: json["agentID"] == null ? null : json["agentID"],
    custId: json["custID"] == null ? null : json["custID"],
    custName: json["custName"] == null ? null : json["custName"],
    commission: json["commission"] == null ? null : json["commission"],
    commissionId: json["commissionID"] == null ? null : json["commissionID"],
    createdAt: json["createdAt"] == null ? null : json["createdAt"],
    updatedAt: json["updatedAt"] == null ? null : json["updatedAt"],
    Date: json["Date"] == null ? null : json["Date"],
    Time: json["Time"] == null ? null : json["Time"],
    v: json["__v"] == null ? null : json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id == null ? null : id,
    "custPhoto": custPhoto == null ? null : custPhoto,
    "agentID": agentId == null ? null : [agentId],
    "custID": custId == null ? null : custId,
    "custName": custName == null ? null : custName,
    "commission": commission == null ? null : commission,
    "commissionID": commissionId == null ? null : [commissionId],
    "createdAt": createdAt == null ? null : createdAt,
    "updatedAt": updatedAt == null ? null : updatedAt,
    "Date": Date == null ? null : Date,
    "Time": Time == null ? null : Time,
    "__v": v == null ? null : v,
  };
}

// enum AgentId { THE_638455_C05_F12_C279_FE18_E346 }
//
// final agentIdValues = EnumValues({
//   "638455c05f12c279fe18e346": AgentId.THE_638455_C05_F12_C279_FE18_E346
// });

// enum CommissionId { THE_638455_C05_F12_C279_FE18_E348 }
//
// final commissionIdValues = EnumValues({
//   "638455c05f12c279fe18e348": CommissionId.THE_638455_C05_F12_C279_FE18_E348
// });
//
// class EnumValues<T> {
//   Map<String, T> map;
//   Map<T, String> reverseMap;
//
//   EnumValues(this.map);
//
//   Map<T, String> get reverse {
//     if (reverseMap == null) {
//       reverseMap = map.map((k, v) => new MapEntry(v, k));
//     }
//     return reverseMap;
//   }
// }
