// To parse this JSON data, do
//
//     final doccumentScannerModel = doccumentScannerModelFromJson(jsonString);

import 'dart:convert';

DocumentScannerModel documentScannerModelFromJson(String str) => DocumentScannerModel.fromJson(json.decode(str));

String documentScannerModelToJson(DocumentScannerModel data) => json.encode(data.toJson());

class DocumentScannerModel {
  DocumentScannerModel({
    this.status,
    this.service,
    this.msg,
  });

  bool? status;
  String? service;
  String? msg;

  factory DocumentScannerModel.fromJson(Map<String, dynamic> json) => DocumentScannerModel(
    status: json["status"],
    service: json["service"],
    msg: json["msg"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "service": service,
    "msg": msg,
  };
}
