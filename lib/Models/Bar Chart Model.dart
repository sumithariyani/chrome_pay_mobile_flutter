import 'package:charts_flutter/flutter.dart' as charts;

// To parse this JSON data, do
//
//     final barChartModel = barChartModelFromJson(jsonString);

import 'dart:convert';

BarChartModel? barChartModelFromJson(String str) => BarChartModel.fromJson(json.decode(str));

String barChartModelToJson(BarChartModel? data) => json.encode(data!.toJson());

class BarChartModel {
  BarChartModel({
    this.status,
    this.year,
    this.month,
    this.day,
  });

  bool? status;
  Map<String, int?>? year;
  Map<String, int?>? month;
  Map<String, int?>? day;

  factory BarChartModel.fromJson(Map<String, dynamic> json) => BarChartModel(
    status: json["status"],
    year: json["Year"],
    month: json["Month"],
    day: json["Day"],
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "Year": year,
    "Month": month,
    "Day": day,
  };
}
