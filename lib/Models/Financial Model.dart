// To parse this JSON data, do
//
//     final financialModel = financialModelFromJson(jsonString);

import 'dart:convert';

FinancialModel financialModelFromJson(String str) => FinancialModel.fromJson(json.decode(str));

String financialModelToJson(FinancialModel data) => json.encode(data.toJson());

class FinancialModel {
  FinancialModel({
    this.status,
    this.obj1,
  });

  bool? status;
  Obj1? obj1;

  factory FinancialModel.fromJson(Map<String, dynamic> json) => FinancialModel(
    status: json["status"],
    obj1: Obj1.fromJson(json["obj1"]),
  );

  Map<String, dynamic> toJson() => {
    "status": status,
    "obj1": obj1,
  };
}

class Obj1 {
  Obj1({
    this.recivingAmountPer,
    this.billsAmountPer,
    this.rechargeAmountPer,
    this.loanAmountPer,
  });

  double? recivingAmountPer;
  double? billsAmountPer;
  double? rechargeAmountPer;
  double? loanAmountPer;

  factory Obj1.fromJson(Map<String, dynamic> json) => Obj1(
    recivingAmountPer: json["reciving_amount_per"],
    billsAmountPer: json["bills_amount_per"],
    rechargeAmountPer: json["recharge_amount_per"],
    loanAmountPer: json["Loan_amount_per"],
  );

  Map<String, dynamic> toJson() => {
    "reciving_amount_per": recivingAmountPer,
    "bills_amount_per": billsAmountPer,
    "recharge_amount_per": rechargeAmountPer,
    "Loan_amount_per": loanAmountPer,
  };
}
