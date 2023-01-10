// To parse this JSON data, do
//
//     final custDetailModel = custDetailModelFromJson(jsonString);

import 'dart:convert';

CustDetailModel custDetailModelFromJson(String str) => CustDetailModel.fromJson(json.decode(str));

String custDetailModelToJson(CustDetailModel data) => json.encode(data.toJson());

class CustDetailModel {
  CustDetailModel({
    this.status,
    this.obj,
  });

  bool? status;
  Obj? obj;

  factory CustDetailModel.fromJson(Map<String, dynamic> json) => CustDetailModel(
    status: json["status"] == null ? null : json["status"],
    obj: json["obj"] == null ? null : Obj.fromJson(json["obj"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status == null ? null : status,
    "obj": obj == null ? null : obj!.toJson(),
  };
}

class Obj {
  Obj({
    this.id,
    this.iDphoto,
    this.fullname,
    this.dateOfBirth,
    this.biometric,
    this.fingerPrint,
    this.facialIdentification,
    this.phone,
    this.city,
    this.age,
    this.email,
    this.gender,
    this.nationality,
    this.hash,
    this.owner,
    this.privateKey,
    this.walletAddress,
    this.professoin,
    this.address,
    this.organisation,
    this.createdBy,
    this.latitude,
    this.longitude,
    this.digitalId,
    this.digitalrefId,
    this.residance,
    this.locaDocument,
    this.landRegistration,
    this.totalTransection,
    this.sendindAmount,
    this.receiveAmount,
    this.proPercentage,
    this.totalAmount,
    this.landSize,
    this.nextFoKinName,
    this.nextFoKniPhone,
    this.location,
  });

  String? id;
  String? fullname;
  String? iDphoto;
  String? dateOfBirth;
  int? biometric;
  int? fingerPrint;
  int? facialIdentification;
  int? phone;
  String? city;
  int? age;
  String? email;
  String? gender;
  String? nationality;
  String? hash;
  String? owner;
  String? privateKey;
  String? walletAddress;
  String? professoin;
  String? address;
  List<String>? organisation;
  List<String>? createdBy;
  String? latitude;
  String? longitude;
  String? digitalId;
  String? digitalrefId;
  String? residance;
  String? locaDocument;
  String? landRegistration;
  int? totalTransection;
  int? sendindAmount;
  int? receiveAmount;
  int? proPercentage;
  int? totalAmount;
  String? landSize;
  String? nextFoKinName;
  int? nextFoKniPhone;
  int? location;

  factory Obj.fromJson(Map<String, dynamic> json) => Obj(
    id: json["_id"] == null ? null : json["_id"],
    iDphoto: json["IDphoto"] == null ? null : json["IDphoto"],
    fullname: json["fullname"] == null ? null : json["fullname"],
    dateOfBirth: json["dateOfBirth"] == null ? null : json["dateOfBirth"],
    biometric: json["biometric"] == null ? null : json["biometric"],
    fingerPrint: json["fingerPrint"] == null ? null : json["fingerPrint"],
    facialIdentification: json["facialIdentification"] == null ? null : json["facialIdentification"],
    phone: json["phone"] == null ? null : json["phone"],
    city: json["city"] == null ? null : json["city"],
    age: json["age"] == null ? null : json["age"],
    email: json["email"] == null ? null : json["email"],
    gender: json["gender"] == null ? null : json["gender"],
    nationality: json["nationality"] == null ? null : json["nationality"],
    hash: json["hash"] == null ? null : json["hash"],
    owner: json["owner"] == null ? null : json["owner"],
    privateKey: json["privateKey"] == null ? null : json["privateKey"],
    walletAddress: json["walletAddress"] == null ? null : json["walletAddress"],
    professoin: json["professoin"] == null ? null : json["professoin"],
    address: json["address"] == null ? null : json["address"],
    organisation: json["organisation"] == null ? null : List<String>.from(json["organisation"].map((x) => x)),
    createdBy: json["createdBY"] == null ? null : List<String>.from(json["createdBY"].map((x) => x)),
    latitude: json["Latitude"] == null ? null : json["Latitude"],
    longitude: json["Longitude"] == null ? null : json["Longitude"],
    digitalId: json["digitalID"] == null ? null : json["digitalID"],
    digitalrefId: json["digitalrefID"] == null ? null : json["digitalrefID"],
    residance: json["residance"] == null ? null : json["residance"],
    locaDocument: json["locaDocument"] == null ? null : json["locaDocument"],
    landRegistration: json["landRegistration"] == null ? null : json["landRegistration"],
    totalTransection: json["totalTransection"] == null ? null : json["totalTransection"],
    sendindAmount: json["sendindAmount"] == null ? null : json["sendindAmount"],
    receiveAmount: json["receiveAmount"] == null ? null : json["receiveAmount"],
    proPercentage: json["proPercentage"] == null ? null : json["proPercentage"],
    totalAmount: json["totalAmount"] == null ? null : json["totalAmount"],
    landSize: json["landSize"] == null ? null : json["landSize"],
    nextFoKinName: json["nextFOKinName"] == null ? null : json["nextFOKinName"],
    nextFoKniPhone: json["nextFOKniPhone"] == null ? null : json["nextFOKniPhone"],
    location: json["Location"] == null ? null : json["Location"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id == null ? null : id,
    "IDphoto": iDphoto == null ? null : iDphoto,
    "fullname": fullname == null ? null : fullname,
    "dateOfBirth": dateOfBirth == null ? null : dateOfBirth,
    "biometric": biometric == null ? null : biometric,
    "fingerPrint": fingerPrint == null ? null : fingerPrint,
    "facialIdentification": facialIdentification == null ? null : facialIdentification,
    "phone": phone == null ? null : phone,
    "city": city == null ? null : city,
    "age": age == null ? null : age,
    "email": email == null ? null : email,
    "gender": gender == null ? null : gender,
    "nationality": nationality == null ? null : nationality,
    "hash": hash == null ? null : hash,
    "owner": owner == null ? null : owner,
    "privateKey": privateKey == null ? null : privateKey,
    "walletAddress": walletAddress == null ? null : walletAddress,
    "professoin": professoin == null ? null : professoin,
    "address": address == null ? null : address,
    "organisation": organisation == null ? null : List<dynamic>.from(organisation!.map((x) => x)),
    "createdBY": createdBy == null ? null : List<dynamic>.from(createdBy!.map((x) => x)),
    "Latitude": latitude == null ? null : latitude,
    "Longitude": longitude == null ? null : longitude,
    "digitalID": digitalId == null ? null : digitalId,
    "digitalrefID": digitalrefId == null ? null : digitalrefId,
    "residance": residance == null ? null : residance,
    "locaDocument": locaDocument == null ? null : locaDocument,
    "landRegistration": landRegistration == null ? null : landRegistration,
    "totalTransection": totalTransection == null ? null : totalTransection,
    "sendindAmount": sendindAmount == null ? null : sendindAmount,
    "receiveAmount": receiveAmount == null ? null : receiveAmount,
    "proPercentage": proPercentage == null ? null : proPercentage,
    "totalAmount": totalAmount == null ? null : totalAmount,
    "landSize": landSize == null ? null : landSize,
    "nextFOKinName": nextFoKinName == null ? null : nextFoKinName,
    "nextFOKniPhone": nextFoKniPhone == null ? null : nextFoKniPhone,
    "Location": location == null ? null : location,
  };
}
