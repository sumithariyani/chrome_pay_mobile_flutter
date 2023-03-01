// To parse this JSON data, do
//
//     final verifyAgencyBankingOtpModel = verifyAgencyBankingOtpModelFromJson(jsonString);

import 'dart:convert';

VerifyAgencyBankingOtpModel verifyAgencyBankingOtpModelFromJson(String str) {
  final jsonData = json.decode(str);
  return VerifyAgencyBankingOtpModel.fromJson(jsonData);
}

String verifyAgencyBankingOtpModelToJson(VerifyAgencyBankingOtpModel data) {
  final dyn = data.toJson();
  return json.encode(dyn);
}

class VerifyAgencyBankingOtpModel {
  bool? status;
  String? msg;
  Data? data;

  VerifyAgencyBankingOtpModel({
    this.status,
    this.msg,
    this.data,
  });

  factory VerifyAgencyBankingOtpModel.fromJson(Map<String, dynamic> json) => new VerifyAgencyBankingOtpModel(
    status: json["status"] == null ? null : json["status"],
    msg: json["msg"] == null ? null : json["msg"],
    data: json["data"] == null ? null : Data.fromJson(json["data"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status == null ? null : status,
    "msg": msg == null ? null : msg,
    "data": data == null ? null : data!.toJson(),
  };
}

class Data {
  String? id;
  String? iDphoto;
  String? fullname;
  int? phone;
  String? email;
  String? digitalrefId;
  int? custViewOtp;

  Data({
    this.id,
    this.iDphoto,
    this.fullname,
    this.phone,
    this.email,
    this.digitalrefId,
    this.custViewOtp,
  });

  factory Data.fromJson(Map<String, dynamic> json) => new Data(
    id: json["_id"] == null ? null : json["_id"],
    iDphoto: json["IDphoto"] == null ? null : json["IDphoto"],
    fullname: json["fullname"] == null ? null : json["fullname"],
    phone: json["phone"] == null ? null : json["phone"],
    email: json["email"] == null ? null : json["eamil"],
    digitalrefId: json["digitalrefID"] == null ? null : json["digitalrefID"],
    custViewOtp: json["cust_view_OTP"] == null ? null : json["cust_view_OTP"],
  );

  Map<String, dynamic> toJson() => {
    "_id": id == null ? null : id,
    "IDphoto": iDphoto == null ? null : iDphoto,
    "fullname": fullname == null ? null : fullname,
    "phone": phone == null ? null : phone,
    "email": email == null ? null : email,
    "digitalrefID": digitalrefId == null ? null : digitalrefId,
    "cust_view_OTP": custViewOtp == null ? null : custViewOtp,
  };
}
