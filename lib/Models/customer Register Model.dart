// To parse this JSON data, do
//
//     final customerRegisterModel = customerRegisterModelFromJson(jsonString);

import 'dart:convert';

CustomerRegisterModel customerRegisterModelFromJson(String str) => CustomerRegisterModel.fromJson(json.decode(str));

String customerRegisterModelToJson(CustomerRegisterModel data) => json.encode(data.toJson());

class CustomerRegisterModel {
  CustomerRegisterModel({
    this.status,
    this.msg,
    this.data,
  });

  bool? status;
  String? msg;
  Data? data;

  factory CustomerRegisterModel.fromJson(Map<String, dynamic> json) => CustomerRegisterModel(
    status: json["status"],
    msg: json["msg"],
    data: Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
    "data": data,
  };
}

class Data {
  Data({
    this.iDphoto,
    this.fullname,
    this.dateOfBirth,
    this.phone,
    this.email,
    this.gender,
    this.nationality,
    this.professoin,
    this.address,
    this.latitude,
    this.longitude,
    this.biometric,
    this.fingerPrint,
    this.status,
    this.organisation,
    this.blocked,
    this.isDeleted,
    this.createdBy,
    this.deletedBy,
    this.suspendBy,
    this.nextFoKinName,
    this.nextFoKniPhone,
    this.residance,
    this.locaDocument,
    this.landRegistration,
    this.otp,
    this.imageDescriptions,
    this.digitalrefId,
    this.digitalId,
    this.assetType,
    this.assetId,
    this.location,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.v,
  });

  String? iDphoto;
  String? fullname;
  String? dateOfBirth;
  int? phone;
  String? email;
  String? gender;
  String? nationality;
  String? professoin;
  String? address;
  String? latitude;
  String? longitude;
  bool? biometric;
  bool? fingerPrint;
  String? status;
  List<String>? organisation;
  int? blocked;
  int? isDeleted;
  List<String>? createdBy;
  List<dynamic>? deletedBy;
  List<dynamic>? suspendBy;
  String? nextFoKinName;
  int? nextFoKniPhone;
  String? residance;
  String? locaDocument;
  String? landRegistration;
  dynamic? otp;
  List<dynamic>? imageDescriptions;
  String? digitalrefId;
  dynamic? digitalId;
  String? assetType;
  String? assetId;
  int? location;
  String? id;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    iDphoto: json["IDphoto"],
    fullname: json["fullname"],
    dateOfBirth: json["dateOfBirth"],
    phone: json["phone"],
    email: json["email"],
    gender: json["gender"],
    nationality: json["nationality"],
    professoin: json["professoin"],
    address: json["address"],
    latitude: json["Latitude"],
    longitude: json["Longitude"],
    biometric: json["biometric"],
    fingerPrint: json["fingerPrint"],
    status: json["status"],
    organisation: json["organisation"] == null ? [] : List<String>.from(json["organisation"].map((x) => x)),
    blocked: json["blocked"],
    isDeleted: json["isDeleted"],
    createdBy: json["createdBY"] == null ? [] : List<String>.from(json["createdBY"].map((x) => x)),
    deletedBy: json["DeletedBy"] == null ? [] : List<dynamic>.from(json["DeletedBy"].map((x) => x)),
    suspendBy: json["suspendBy"] == null ? [] : List<dynamic>.from(json["suspendBy"].map((x) => x)),
    nextFoKinName: json["nextFOKinName"],
    nextFoKniPhone: json["nextFOKniPhone"],
    residance: json["residance"],
    locaDocument: json["locaDocument"],
    landRegistration: json["landRegistration"],
    otp: json["otp"],
    imageDescriptions: json["imageDescriptions"] == null ? [] : List<dynamic>.from(json["imageDescriptions"].map((x) => x)),
    digitalrefId: json["digitalrefID"],
    digitalId: json["digitalID"],
    assetType: json["assetType"],
    assetId: json["assetID"],
    location: json["Location"],
    id: json["_id"],
    createdAt: DateTime.parse(json["createdAt"]),
    updatedAt: DateTime.parse(json["updatedAt"]),
    v: json["__v"],
  );

  Map<String, dynamic> toJson() => {
    "IDphoto": iDphoto,
    "fullname": fullname,
    "dateOfBirth": dateOfBirth,
    "phone": phone,
    "email": email,
    "gender": gender,
    "nationality": nationality,
    "professoin": professoin,
    "address": address,
    "Latitude": latitude,
    "Longitude": longitude,
    "biometric": biometric,
    "fingerPrint": fingerPrint,
    "status": status,
    "organisation": organisation == null ? [] : List<dynamic>.from(organisation!.map((x) => x)),
    "blocked": blocked,
    "isDeleted": isDeleted,
    "createdBY": createdBy == null ? [] : List<dynamic>.from(createdBy!.map((x) => x)),
    "DeletedBy": deletedBy == null ? [] : List<dynamic>.from(deletedBy!.map((x) => x)),
    "suspendBy": suspendBy == null ? [] : List<dynamic>.from(suspendBy!.map((x) => x)),
    "nextFOKinName": nextFoKinName,
    "nextFOKniPhone": nextFoKniPhone,
    "residance": residance,
    "locaDocument": locaDocument,
    "landRegistration": landRegistration,
    "otp": otp,
    "imageDescriptions": imageDescriptions == null ? [] : List<dynamic>.from(imageDescriptions!.map((x) => x)),
    "digitalrefID": digitalrefId,
    "digitalID": digitalId,
    "assetType": assetType,
    "assetID": assetId,
    "Location": location,
    "_id": id,
    "createdAt": createdAt?.toIso8601String(),
    "updatedAt": updatedAt?.toIso8601String(),
    "__v": v,
  };
}
