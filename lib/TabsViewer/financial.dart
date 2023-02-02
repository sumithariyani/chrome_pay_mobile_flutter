import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Models/Financial Model.dart';
import '../Services/Services.dart';

class FinancialActivites extends StatefulWidget{
  String id = "";
  FinancialActivites(this.id);

  @override
  _FinancialActivitesState createState() => _FinancialActivitesState();
}

class _FinancialActivitesState extends State<FinancialActivites>{

  FinancialModel? _financialModel;
  SharedPreferences? prefs;

  Future<void> getCustomer() async {
    prefs = await SharedPreferences.getInstance();

    _financialModel = await Services.Finance(prefs!.getString("token").toString(), widget.id);

    if(_financialModel!.status!){
      print("personal"+widget.id);
    }
    setState(() {
    });
  }

  @override
  void initState() {
    getCustomer();
    super.initState();
    _financialModel;
  }
  @override
  Widget build(BuildContext context) {
  return Scaffold(
    body: Container(
      padding: const EdgeInsets.all(10.0),
      child: PieChart(
        PieChartData(
          sections: [
            PieChartSectionData(
              title: "Reciving Amount\n${_financialModel?.obj1?.recivingAmountPer}",
              value: _financialModel?.obj1?.recivingAmountPer,
              color: Colors.red,
              titleStyle: TextStyle(color: Colors.black,
                  fontSize: 12),
              radius: 80),
            PieChartSectionData(
                title: "Bills Amount\n${_financialModel?.obj1?.billsAmountPer}",
                value: _financialModel?.obj1?.billsAmountPer,
                color: Colors.orangeAccent,
                titleStyle: TextStyle(color: Colors.black,
                    fontSize: 12),
                radius: 80),
            PieChartSectionData(
                title: "Recharge Amount\n${_financialModel?.obj1?.rechargeAmountPer}",
                value: _financialModel?.obj1?.rechargeAmountPer,
                color: Colors.greenAccent,
                titleStyle: TextStyle(color: Colors.black,
                    fontSize: 12),
                radius: 80),
            PieChartSectionData(
                title: "Loan Amount\n${_financialModel?.obj1?.loanAmountPer}",
                value: _financialModel?.obj1?.loanAmountPer,
                color: Colors.yellow,
                titleStyle: TextStyle(color: Colors.black,
                fontSize: 12),
                radius: 80),],
          centerSpaceRadius: 90,
          sectionsSpace: 0,
        )
      ),
    ),
  );
  }
}

