// To parse this JSON data, do
//
//     final allDidModel = allDidModelFromJson(jsonString);

import 'dart:convert';

AllDidModel allDidModelFromJson(String str) => AllDidModel.fromJson(json.decode(str));

String allDidModelToJson(AllDidModel data) => json.encode(data.toJson());

class AllDidModel {
  AllDidModel({
    this.statussss,
    this.totlaRow,
    this.currenPage,
    this.filter,
  });

  bool? statussss;
  int? totlaRow;
  dynamic? currenPage;
  List<Filter>? filter;

  factory AllDidModel.fromJson(Map<String, dynamic> json) => AllDidModel(
    statussss: json["statussss"] == null ? null : json["statussss"],
    totlaRow: json["totlaRow"] == null ? null : json["totlaRow"],
    currenPage: json["currenPage"],
    filter: json["filter"] == null ? null : List<Filter>.from(json["filter"].map((x) => Filter.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "statussss": statussss == null ? null : statussss,
    "totlaRow": totlaRow == null ? null : totlaRow,
    "currenPage": currenPage,
    "filter": filter == null ? null : List<dynamic>.from(filter!.map((x) => x.toJson())),
  };
}

class Filter {
  Filter({
    this.id,
    this.iDphoto,
    this.fullname,
    this.dateOfBirth,
    this.phone,
    this.email,
    this.gender,
    this.nationality,
    this.address,
    this.latitude,
    this.longitude,
    this.biometric,
    this.fingerPrint,
    this.city,
    this.age,
    this.status,
    this.hash,
    this.owner,
    this.privateKey,
    this.walletAddress,
    this.organisation,
    this.blocked,
    this.isDeleted,
    this.createdBy,
    this.deletedBy,
    this.suspendBy,
    this.nextFoKinName,
    this.nextFoKniPhone,
    this.landSize,
    this.residance,
    this.locaDocument,
    this.landRegistration,
    this.otp,
    this.facialIdentification,
    this.faceDiscription,
    this.digitalId,
    this.digitalrefId,
    this.location,
    this.assetType,
    this.assetId,
    this.password,
    this.wrongOtp,
    this.wrongPass,
    this.createdAt,
    this.updatedAt,
    this.v,
    this.professoin,
    this.loginOtp,
  });

  String? id;
  String? iDphoto;
  String? fullname;
  String? dateOfBirth;
  int? phone;
  String? email;
  String? gender;
  String? nationality;
  String? address;
  String? latitude;
  String? longitude;
  int? biometric;
  int? fingerPrint;
  String? city;
  int? age;
  String? status;
  String? hash;
  String? owner;
  String? privateKey;
  String? walletAddress;
  List<String>? organisation;
  int? blocked;
  int? isDeleted;
  List<String>? createdBy;
  List<dynamic>? deletedBy;
  List<dynamic>? suspendBy;
  String? nextFoKinName;
  int? nextFoKniPhone;
  String? landSize;
  String? residance;
  String? locaDocument;
  String? landRegistration;
  dynamic? otp;
  int? facialIdentification;
  List<dynamic>? faceDiscription;
  String? digitalId;
  String? digitalrefId;
  int? location;
  String? assetType;
  String? assetId;
  String? password;
  int? wrongOtp;
  int? wrongPass;
  DateTime? createdAt;
  DateTime? updatedAt;
  int? v;
  String? professoin;
  int? loginOtp;

  factory Filter.fromJson(Map<String, dynamic> json) => Filter(
    id: json["_id"] == null ? null : json["_id"],
    iDphoto: json["IDphoto"] == null ? null : json["IDphoto"],
    fullname: json["fullname"] == null ? null : json["fullname"],
    dateOfBirth: json["dateOfBirth"] == null ? null : json["dateOfBirth"],
    phone: json["phone"] == null ? null : json["phone"],
    email: json["email"] == null ? null : json["email"],
    gender: json["gender"] == null ? null : json["gender"],
    nationality: json["nationality"] == null ? null : json["nationality"],
    address: json["address"] == null ? null : json["address"],
    latitude: json["Latitude"] == null ? null : json["Latitude"],
    longitude: json["Longitude"] == null ? null : json["Longitude"],
    biometric: json["biometric"] == null ? null : json["biometric"],
    fingerPrint: json["fingerPrint"] == null ? null : json["fingerPrint"],
    city: json["city"] == null ? null : json["city"],
    age: json["age"] == null ? null : json["age"],
    status: json["status"] == null ? null : json["status"],
    hash: json["hash"] == null ? null : json["hash"],
    owner: json["owner"] == null ? null : json["owner"],
    privateKey: json["privateKey"] == null ? null : json["privateKey"],
    walletAddress: json["walletAddress"] == null ? null : json["walletAddress"],
    organisation: json["organisation"] == null ? null : List<String>.from(json["organisation"].map((x) => x)),
    blocked: json["blocked"] == null ? null : json["blocked"],
    isDeleted: json["isDeleted"] == null ? null : json["isDeleted"],
    createdBy: json["createdBY"] == null ? null : List<String>.from(json["createdBY"].map((x) => x)),
    deletedBy: json["DeletedBy"] == null ? null : List<dynamic>.from(json["DeletedBy"].map((x) => x)),
    suspendBy: json["suspendBy"] == null ? null : List<dynamic>.from(json["suspendBy"].map((x) => x)),
    nextFoKinName: json["nextFOKinName"] == null ? null : json["nextFOKinName"],
    nextFoKniPhone: json["nextFOKniPhone"] == null ? null : json["nextFOKniPhone"],
    landSize: json["landSize"] == null ? null : json["landSize"],
    residance: json["residance"] == null ? null : json["residance"],
    locaDocument: json["locaDocument"] == null ? null : json["locaDocument"],
    landRegistration: json["landRegistration"] == null ? null : json["landRegistration"],
    otp: json["otp"],
    facialIdentification: json["facialIdentification"] == null ? null : json["facialIdentification"],
    faceDiscription: json["faceDiscription"] == null ? null : List<dynamic>.from(json["faceDiscription"].map((x) => x)),
    digitalId: json["digitalID"] == null ? null : json["digitalID"],
    digitalrefId: json["digitalrefID"] == null ? null : json["digitalrefID"],
    location: json["Location"] == null ? null : json["Location"],
    assetType: json["assetType"] == null ? null : json["assetType"],
    assetId: json["assetID"] == null ? null : json["assetID"],
    password: json["password"] == null ? null : json["password"],
    wrongOtp: json["wrongOTP"] == null ? null : json["wrongOTP"],
    wrongPass: json["wrong_pass"] == null ? null : json["wrong_pass"],
    createdAt: json["createdAt"] == null ? null : DateTime.parse(json["createdAt"]),
    updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    v: json["__v"] == null ? null : json["__v"],
    professoin: json["professoin"] == null ? null : json["professoin"],
    loginOtp: json["login_otp"] == null ? null : json["login_otp"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id == null ? null : id,
    "IDphoto": iDphoto == null ? null : iDphoto,
    "fullname": fullname == null ? null : fullname,
    "dateOfBirth": dateOfBirth == null ? null : dateOfBirth,
    "phone": phone == null ? null : phone,
    "email": email == null ? null : email,
    "gender": gender == null ? null : gender,
    "nationality": nationality == null ? null : nationality,
    "address": address == null ? null : address,
    "Latitude": latitude == null ? null : latitude,
    "Longitude": longitude == null ? null : longitude,
    "biometric": biometric == null ? null : biometric,
    "fingerPrint": fingerPrint == null ? null : fingerPrint,
    "city": city == null ? null : city,
    "age": age == null ? null : age,
    "status": status == null ? null : status,
    "hash": hash == null ? null : hash,
    "owner": owner == null ? null : owner,
    "privateKey": privateKey == null ? null : privateKey,
    "walletAddress": walletAddress == null ? null : walletAddress,
    "organisation": organisation == null ? null : List<dynamic>.from(organisation!.map((x) => x)),
    "blocked": blocked == null ? null : blocked,
    "isDeleted": isDeleted == null ? null : isDeleted,
    "createdBY": createdBy == null ? null : List<dynamic>.from(createdBy!.map((x) => x)),
    "DeletedBy": deletedBy == null ? null : List<dynamic>.from(deletedBy!.map((x) => x)),
    "suspendBy": suspendBy == null ? null : List<dynamic>.from(suspendBy!.map((x) => x)),
    "nextFOKinName": nextFoKinName == null ? null : nextFoKinName,
    "nextFOKniPhone": nextFoKniPhone == null ? null : nextFoKniPhone,
    "landSize": landSize == null ? null : landSize,
    "residance": residance == null ? null : residance,
    "locaDocument": locaDocument == null ? null : locaDocument,
    "landRegistration": landRegistration == null ? null : landRegistration,
    "otp": otp,
    "facialIdentification": facialIdentification == null ? null : facialIdentification,
    "faceDiscription": faceDiscription == null ? null : List<dynamic>.from(faceDiscription!.map((x) => x)),
    "digitalID": digitalId == null ? null : digitalId,
    "digitalrefID": digitalrefId == null ? null : digitalrefId,
    "Location": location == null ? null : location,
    "assetType": assetType == null ? null : assetType,
    "assetID": assetId == null ? null : assetId,
    "password": password == null ? null : password,
    "wrongOTP": wrongOtp == null ? null : wrongOtp,
    "wrong_pass": wrongPass == null ? null : wrongPass,
    "createdAt": createdAt == null ? null : createdAt?.toIso8601String(),
    "updatedAt": updatedAt == null ? null : updatedAt?.toIso8601String(),
    "__v": v == null ? null : v,
    "professoin": professoin == null ? null : professoin,
    "login_otp": loginOtp == null ? null : loginOtp,
  };
}
