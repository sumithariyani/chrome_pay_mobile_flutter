// To parse this JSON data, do
//
//     final imageUploadModel = imageUploadModelFromJson(jsonString);

import 'dart:convert';

ImageUploadModel imageUploadModelFromJson(String str) => ImageUploadModel.fromJson(json.decode(str));
// {
//   final jsonData = json.decode(str);
//   return ImageUploadModel.fromJson(jsonData);
// }

String imageUploadModelToJson(ImageUploadModel data) => json.encode(data.toJson());
//   {
//   final dyn = data.toJson();
//   return json.encode(dyn);
// }

class ImageUploadModel {
  ImageUploadModel({
    this.status,
    this.data,
  });

  bool? status;
  String? data;


  factory ImageUploadModel.fromJson(Map<String, dynamic> json) => new ImageUploadModel(
    status: json["status"] == null ? null : json["status"],
    data: json["data"] == null ? null : json["data"],
  );

  Map<String, dynamic> toJson() => {
    "status": status == null ? null : status,
    "data": data == null ? null : data,
  };
}
