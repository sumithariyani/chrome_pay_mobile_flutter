// To parse this JSON data, do
//
//     final doccumentScannerModel = doccumentScannerModelFromJson(jsonString);

import 'dart:convert';

DocumentScannerModel documentScannerModelFromJson(String str) => DocumentScannerModel.fromJson(json.decode(str));

String documentScannerModelToJson(DocumentScannerModel data) => json.encode(data.toJson());

class DocumentScannerModel {
  DocumentScannerModel({
    this.status,
    this.msg,
  });

  bool? status;
  String? msg;

  factory DocumentScannerModel.fromJson(Map<String, dynamic> json) => DocumentScannerModel(
    status: json["status"],
    msg: json["msg"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "msg": msg,
  };
}
