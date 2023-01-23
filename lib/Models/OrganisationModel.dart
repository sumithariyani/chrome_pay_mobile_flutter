// To parse this JSON data, do
//
//     final organisationModel = organisationModelFromJson(jsonString);

import 'dart:convert';

OrganisationModel? organisationModelFromJson(String str) => OrganisationModel.fromJson(json.decode(str));

String organisationModelToJson(OrganisationModel? data) => json.encode(data!.toJson());

class OrganisationModel {
  OrganisationModel({
    this.status,
    this.org,
  });

  bool? status;
  List<Org?>? org;

  factory OrganisationModel.fromJson(Map<String, dynamic> json) => OrganisationModel(
    status: json["status"],
    org: json["Org"] == null ? [] : List<Org?>.from(json["Org"]!.map((x) => Org.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "Org": org == null ? [] : List<dynamic>.from(org!.map((x) => x!.toJson())),
  };
}

class Org {
  Org({
    this.id,
    this.name,
  });

  String? id;
  String? name;

  factory Org.fromJson(Map<String, dynamic> json) => Org(
    id: json["_id"],
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id,
    "name": name,
  };
}
