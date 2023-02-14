import 'dart:core';
import 'dart:math';
import 'package:charts_flutter_new/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Models/Agent Performance Model.dart';
import '../Services/Services.dart';


@override
class AgentPerformance extends StatefulWidget {
  @override
  _AgentPerformanceState createState() => _AgentPerformanceState();

}
class Sales {
  String? year;
  int? sales;
  Sales(this.year, this.sales);
}
class _Month {
  String? month;
  int? sales;
  _Month(this.month, this.sales);
}
class _Day {
  String? day;
  int? sales;
  _Day(this.day, this.sales);
}

class _AgentPerformanceState extends State<AgentPerformance> {

  late SharedPreferences prefs;
  List<String> filter = ['Year', 'Month', 'Day'];
  String? selectedFilter = 'Month';
  bool _isPageLoading = false;


  late List<charts.Series<Sales,String>> _chartsData=[];
  static List <charts.Series<_Month,String>> _monthData=[];
  late List<charts.Series<_Day,String>> _dayData=[];

   AgentPerformanceModel? _agentPerformanceModel;

  Future<void> getCustomer() async {
    prefs = await SharedPreferences.getInstance();
    _chartsData.clear();
    _monthData.clear();
    _dayData.clear();
    _agentPerformanceModel = await Services.AgentPer(prefs.getString('token').toString(),selectedFilter.toString());
    print("prefs!.getString(token).toString()${prefs!.getString("token").toString()}");
    if(_agentPerformanceModel!.status == true){

      if(_agentPerformanceModel!.year!=null){

        print("object");
        List<Sales>? _data = [
        Sales('2018', _agentPerformanceModel?.year?.year1),
        Sales('2019', _agentPerformanceModel?.year?.year2),
        Sales('2020', _agentPerformanceModel?.year?.year3),
        Sales('2021', _agentPerformanceModel?.year?.year4),
        Sales('2022', _agentPerformanceModel?.year?.year5),
        Sales('2023', _agentPerformanceModel?.year?.year6),
        Sales('2024', _agentPerformanceModel?.year?.year7),
        Sales('2025', _agentPerformanceModel?.year?.year8),
        Sales('2026', _agentPerformanceModel?.year?.year9),
      ];

       _chartsData = [
        charts.Series(
          id: "Years",
          data: _data,
          domainFn: (Sales sales,__) => sales.year.toString(),
          measureFn: (Sales sales,__) => int.parse(sales.sales.toString()),
        )
      ];
    }
      if(_agentPerformanceModel!.month!=null){

        List<_Month> _monthdata = [
          _Month('Jan', _agentPerformanceModel?.month?.January),
          _Month('Feb', _agentPerformanceModel?.month?.February),
          _Month('Mar', _agentPerformanceModel?.month?.March),
          _Month('Apr', _agentPerformanceModel?.month?.April),
          _Month('May', _agentPerformanceModel?.month?.May),
          _Month('Jun', _agentPerformanceModel?.month?.June),
          _Month('Jul', _agentPerformanceModel?.month?.July),
          _Month('Aug', _agentPerformanceModel?.month?.August),
          _Month('Sep', _agentPerformanceModel?.month?.September),
          _Month('Oct', _agentPerformanceModel?.month?.October),
          _Month('Nov', _agentPerformanceModel?.month?.November),
          _Month('Dec', _agentPerformanceModel?.month?.December),
      ];

       _monthData = [
        charts.Series(
          id: "Month",
          data: _monthdata,
          domainFn: (_Month month,__) => month.month.toString(),
          measureFn: (_Month month,__) => int.parse(month.sales.toString()),
        )
      ];
    }
      if(_agentPerformanceModel!.day!=null){

        List<_Day>? _data = [
          _Day('Mon', _agentPerformanceModel?.day?.monday),
          _Day('Tue', _agentPerformanceModel?.day?.tuseday),
          _Day('Wed', _agentPerformanceModel?.day?.wednesday),
          _Day('Thu', _agentPerformanceModel?.day?.thrusday),
          _Day('Fri', _agentPerformanceModel?.day?.friday),
          _Day('Sat', _agentPerformanceModel?.day?.saturday),
          _Day('Sun', _agentPerformanceModel?.day?.sunday),
          // _Day('Aug', _agentPerformanceModel?.month?.August.toString()),
          // _Day('Sep', _agentPerformanceModel?.month?.September.toString()),
          // _Day('Oct', _agentPerformanceModel?.month?.October.toString()),
          // _Day('Nov', _agentPerformanceModel?.month?.November.toString()),
          // _Day('Dec', _agentPerformanceModel?.month?.December.toString()),
      ];

       _dayData = [
        charts.Series(
          id: "Day",
          data: _data,
          domainFn: (_Day day,__) => day.day.toString(),
          measureFn: (_Day day,__) => int.parse(day.sales.toString()),
        ),
      ];
    }
    }
    setState(() {
    });
  }

  getAsync() async {
    try{
      prefs = await SharedPreferences.getInstance();
      setState(() {

      });
    }catch (e) {
      print("hugfffgfgf${e}");
    }
  }


  @override
  void initState() {
    getCustomer();
    _agentPerformanceModel;
    super.initState();
    getAsync();

  }

  Widget build(BuildContext context) {
    // getCustomer();
   return Scaffold(
     body: Container(
       width: MediaQuery.of(context).size.width,
       height: MediaQuery.of(context).size.height,
       child: Column(
         mainAxisAlignment: MainAxisAlignment.start,
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           Container(
             child: Row(
               crossAxisAlignment: CrossAxisAlignment.start,
               mainAxisAlignment: MainAxisAlignment.start,
               children: [
                 InkWell(
                   onTap: () {
                     Navigator.pop(context);
                   },
                   child: Container(
                     margin: const EdgeInsets.fromLTRB(15, 40, 0, 0),
                     child: Image.asset('images/login_stuff_03.png',
                       height: 20,
                     ),
                   ),
                 ),
                 Container(
                   margin: const EdgeInsets.fromLTRB(15, 40, 0, 0),
                   child: Text('Agent Performance',
                     style: TextStyle(
                         fontSize: 18,
                         fontWeight: FontWeight.bold
                     ),
                   ),
                 )
               ],
             ),
           ),
           Card(
             color: Colors.transparent,
             margin: EdgeInsets.fromLTRB(20, 30, 20, 20),
             elevation: 5,
             shadowColor: Colors.black,
             child: Container(
               width: MediaQuery.of(context).size.width,
               height: 200,
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(20.0),
                 image: const DecorationImage(image: AssetImage('images/all_dids_07.png'),
                   fit: BoxFit.cover,),
               ),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.start,
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Container(
                     child: Column(
                       mainAxisAlignment: MainAxisAlignment.start,
                       crossAxisAlignment: CrossAxisAlignment.start,
                       children: [
                         Container(
                           margin: EdgeInsets.only(top: 15.0),
                           child: Padding(
                             padding: const EdgeInsets.all(12.0),
                             child: Text(
                               "Sumit Hariyani" ,
                               style: TextStyle(
                                 color: Colors.white,
                                   fontWeight: FontWeight.w600,
                                   fontSize: 16),
                             ),
                           ),
                         ),
                         Container(
                           margin: EdgeInsets.only(top: 25.0),
                           child: Row(
                             children: [
                               Padding(
                                 padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                 child: Image.asset('images/agent_dashboard_stuff_04.png',
                                   height: 20,),
                               ),
                               Text(
                                   "Agent",
                                   style: TextStyle(
                                     fontWeight: FontWeight.w500,
                                   )
                               ),
                               Padding(
                                 padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                 child: Image.asset('images/home_page_icon_19.png',
                                   height: 20,),
                               ),
                               Text(
                                   "India",
                                   style: TextStyle(
                                     fontWeight: FontWeight.w500,
                                   )
                               ),
                             ],
                           ),
                         ),
                         Container(
                           margin: EdgeInsets.only(top: 10.0),
                           child: Row(
                             children: [
                               Padding(
                                 padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                 child: Image.asset('images/login_stuff_04.png',
                                   height: 20,),
                               ),
                               Text(
                                   "sumithariyani@gmail.com",
                                   style: TextStyle(
                                     fontWeight: FontWeight.w500,
                                   )
                               ),
                             ],
                           ),
                         ),
                         Container(
                           width: 70,
                           height: 50,
                           decoration: new BoxDecoration(
                               border: Border(
                                   left:
                                   BorderSide(color: Color(0XFFFF6D64), width: 2.0,style: BorderStyle.solid))),

                         )
                       ],
                     ),
                   ),
                   Spacer(),
                   Container(
                     margin: EdgeInsets.only(right: 10.0),
                     alignment: Alignment.center,
                     child: Container(
                       width: 100,
                       height: 100,
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(20.0),
                         image: DecorationImage(
                           image: AssetImage("images/all_dids_06.png"),
                           fit: BoxFit.fill,
                         ),
                       ),
                       alignment: Alignment.center,
                     )
                   ),
                 ],
               ),
             ),
           ),
           Expanded(
             child: Container(
               child: Column(
                 children: [
                 Container(
                   child: Row(
                     mainAxisAlignment: MainAxisAlignment.end,
                     children: [
                       Container(
                         width: 110,
                         height: 50,
                         margin: EdgeInsets.all(10),
                       alignment: Alignment.topRight,
                         decoration: BoxDecoration(
                             border: Border.all(color: Colors.grey),
                             borderRadius: BorderRadius.all(Radius.circular(5.0)),
                             color: const Color(0xc3dcfbee)
                         ),
                       child: Padding(
                         padding: const EdgeInsets.symmetric(horizontal: 8.0),
                         child: DropdownButtonFormField<String>(
                           decoration: InputDecoration(
                               border: InputBorder.none
                           ),
                           icon: Icon(Icons.keyboard_arrow_down),
                           value: selectedFilter,
                           items: filter.
                           map((item) => DropdownMenuItem<String>(
                               value: item,
                               child: Text(item, style: const TextStyle(fontSize: 18),)
                           ))
                               .toList(),
                           onChanged: (item) => setState(() {
                             selectedFilter = item;
                             getCustomer();
                           }),
                         ),
                       ),
               ),
                     ],
                   ),
                 ),
                     if(_monthData!.isNotEmpty) Container(
                       child: Expanded(child:
                           charts.BarChart(_monthData)
                       ),
                     ),

                   if(_chartsData!.isNotEmpty) Expanded(child:
                   charts.BarChart(_chartsData!)
                   ),

                   if(_dayData!.isNotEmpty) Expanded(child:
                   charts.BarChart(_dayData!)
                   ),
                 ],
               ),
             ),
           )
         ],
       ),
     ),
   );
  }
  _chart() {
    // if(_chartsData!=null){
    //      charts.BarChart(_chartsData!);
    // }
    // if(_monthData!=null){
    //     charts.BarChart(_monthData!);
    //
    // }
    // if(_dayData!=null){
    //     charts.BarChart(_dayData!);
    // }
    _isPageLoading = false;
  }
}

