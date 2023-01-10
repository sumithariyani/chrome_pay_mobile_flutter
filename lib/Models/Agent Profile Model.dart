// To parse this JSON data, do
//
//     final agentProfileModel = agentProfileModelFromJson(jsonString);

import 'dart:convert';

AgentProfileModel agentProfileModelFromJson(String str) => AgentProfileModel.fromJson(json.decode(str));

String agentProfileModelToJson(AgentProfileModel data) => json.encode(data.toJson());

class AgentProfileModel {
  AgentProfileModel({
    this.status,
    this.filter,
  });

  bool? status;
  Filter? filter;

  factory AgentProfileModel.fromJson(Map<String, dynamic> json) => AgentProfileModel(
    status: json["status"] == null ? null : json["status"],
    filter: json["filter"] == null ? null : Filter.fromJson(json["filter"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status == null ? null : status,
    "filter": filter == null ? null : filter!.toJson(),
  };
}

class Filter {
  Filter({
    this.id,
    this.name,
    this.email,
    this.password,
    this.phone,
    this.country,
    this.address,
    this.city,
    this.postCode,
    this.transectionLimit,
  });

  String? id;
  String? name;
  String? email;
  String? password;
  int? phone;
  String? country;
  String? address;
  String? city;
  String? postCode;
  String? transectionLimit;

  factory Filter.fromJson(Map<String, dynamic> json) => Filter(
    id: json["_id"] == null ? null : json["_id"],
    name: json["name"] == null ? null : json["name"],
    email: json["email"] == null ? null : json["email"],
    password: json["password"] == null ? null : json["password"],
    phone: json["phone"] == null ? null : json["phone"],
    country: json["country"] == null ? null : json["country"],
    address: json["address"] == null ? null : json["address"],
    city: json["city"] == null ? null : json["city"],
    postCode: json["postCode"] == null ? null : json["postCode"],
    transectionLimit: json["transectionLimit"] == null ? null : json["transectionLimit"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id == null ? null : id,
    "name": name == null ? null : name,
    "email": email == null ? null : email,
    "password": password == null ? null : password,
    "phone": phone == null ? null : phone,
    "country": country == null ? null : country,
    "address": address == null ? null : address,
    "city": city == null ? null : city,
    "postCode": postCode == null ? null : postCode,
    "transectionLimit": transectionLimit == null ? null : transectionLimit,
  };
}
