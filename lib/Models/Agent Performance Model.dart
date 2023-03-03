// To parse this JSON data, do
//
//     final financialModel = financialModelFromJson(jsonString);

import 'dart:convert';

AgentPerformanceModel agentPerformanceModelFromJson(String str) => AgentPerformanceModel.fromJson(json.decode(str));

String agentPerformanceModelToJson(AgentPerformanceModel data) => json.encode(data.toJson());

class AgentPerformanceModel {

  AgentPerformanceModel({
    this.status,
    this.year,
    this.month,
    this.day,
});
  bool? status;
  Year? year;
  Month? month;
  Day? day;

  factory AgentPerformanceModel.fromJson(Map<String, dynamic> json) => AgentPerformanceModel(
    status: json["status"],
    year: json["Year"]==null ? null : Year.fromJson(json["Year"]),
    month:json["Month"]==null ? null : Month.fromJson(json["Month"]),
    day:json["Day"]==null ? null : Day.fromJson(json["Day"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "Year": year,
    "Month": month,
    "Day": day,
  };
}

class Month {
  Month({
    this.January,
    this.February,
    this.March,
    this.April,
    this.May,
    this.June,
    this.July,
    this.August,
    this.September,
    this.October,
    this.November,
    this.December,

});
  int? January;
  int? February;
  int? March;
  int? April;
  int? May;
  int? June;
  int? July;
  int? August;
  int? September;
  int? October;
  int? November;
  int? December;

  factory Month.fromJson(Map<String, dynamic> json) => Month(
    January: json["January"]==null  ? 0:json["January"],
    February: json["February"]==null  ? 0:json["February"],
    March: json["March"]==null  ? 0:json["March"],
    April: json["April"]==null  ? 0:json["April"],
    May: json["May"]==null  ? 0:json["May"],
    June: json["June"]==null  ? 0:json["June"],
    July: json["July"]==null  ? 0:json["July"],
    August: json["August"]==null  ? 0:json["August"],
    September: json["September"]==null  ? 0:json["September"],
    October: json["October"]==null  ? 0:json["October"],
    November: json["November"]==null  ? 0:json["November"],
    December: json["December"]==null  ? 0:json["December"],
  );

  Map<String, dynamic> toJson() => {
    "January": January,
    "February": February,
    "March": March,
    "April": April,
    "May": May,
    "June": June,
    "July": July,
    "August": August,
    "September": September,
    "October": October,
    "November": November,
    "December": December,

  };
}

class Day {
  Day({
    this.tuseday,
    this.wednesday,
    this.thrusday,
    this.friday,
    this.saturday,
    this.sataurday,
    this.sunday,
    this.monday,
  });

  int? tuseday;
  int? wednesday;
  int? thrusday;
  int? friday;
  int? saturday;
  int? sataurday;
  int? sunday;
  int? monday;

  factory Day.fromJson(Map<String, dynamic> json) => Day(
    tuseday: json["Tuseday"]==null ? 0:json["Tuseday"],
    wednesday: json["Wednesday"]==null ? 0:json["Wednesday"],
    thrusday: json["Thrusday"]==null ? 0:json["Thrusday"],
    friday: json["Friday"]==null ? 0:json["Friday"],
    saturday: json["Saturday"]==null ? 0:json["Saturday"] ,
    sataurday: json["Sataurday"]==null ? 0:json["Sataurday"] ,
    sunday: json["Sunday"]==null ? 0:json["Sunday"],
    monday: json["Monday"]==null ? 0:json["Monday"],
  );

  Map<String, dynamic> toJson() => {
    "Tuseday": tuseday,
    "Wednesday": wednesday,
    "Thrusday": thrusday,
    "Friday": friday,
    "Saturday": saturday,
    "Sataurday": sataurday,
    "Sunday": sunday,
    "Monday": monday,
  };
}
class Year {
  Year({
    this.year1,
    this.year2,
    this.year3,
    this.year4,
    this.year5,
    this.year6,
    this.year7,
    this.year8,
    this.year9,
});
  int? year1;
  int? year2;
  int? year3;
  int? year4;
  int? year5;
  int? year6;
  int? year7;
  int? year8;
  int? year9;

  factory Year.fromJson(Map<String, dynamic> json) => Year(
    year1: json["2018"]==null ? 0 : json["2018"],
    year2: json["2019"]==null ? 0 : json["2019"],
    year3: json["2020"]==null ? 0 : json["2020"],
    year4: json["2021"]==null ? 0 : json["2021"],
    year5: json["2022"]==null ? 0 : json["2022"],
    year6: json["2023"]==null ? 0 : json["2023"],
    year7: json["2024"]==null ? 0 : json["2024"],
    year8: json["2025"]==null ? 0 : json["2025"],
    year9: json["2026"]==null ? 0 : json["2026"],
  );

}
