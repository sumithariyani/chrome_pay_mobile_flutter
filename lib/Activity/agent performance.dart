import 'dart:core';
import 'dart:math';
import 'package:fl_chart/fl_chart.dart';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Services/Services.dart';


@override
class AgentPerformance extends StatefulWidget {
  @override
  _AgentPerformanceState createState() => _AgentPerformanceState();

}
class _AgentPerformanceState extends State<AgentPerformance> {

  SharedPreferences? prefs;

  var showingTooltipIndicators;


  getAsync() async {
    try{
      prefs = await SharedPreferences.getInstance();
      setState(() {

      });
    }catch (e) {
      print(e);
    }
  }


  @override
  void initState() {
    super.initState();
    getAsync();
  }
  Widget build(BuildContext context) {
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
                 Container(
                   margin: const EdgeInsets.fromLTRB(10, 30, 0, 0),
                   child: Image.asset('images/login_stuff_03.png',
                     height: 20,
                   ),
                 ),
                 Container(
                   margin: const EdgeInsets.fromLTRB(10, 30, 0, 0),
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
               child: BarChart(
                 BarChartData(
                     barGroups: [
                       BarChartGroupData(x: 0, barRods:
                       [BarChartRodData(toY: 30,width: 15)],showingTooltipIndicators: [0]),
                       BarChartGroupData(x: 1, barRods:
                       [BarChartRodData(toY: 25,width: 15)],showingTooltipIndicators: [1]),
                       BarChartGroupData(x: 2, barRods:
                       [BarChartRodData(toY: 25,width: 15)],showingTooltipIndicators: [2]),
                       BarChartGroupData(x: 3, barRods:
                       [BarChartRodData(toY: 25,width: 15)],showingTooltipIndicators: [3]),
                       BarChartGroupData(x: 4, barRods:
                       [BarChartRodData(toY: 25,width: 15)],showingTooltipIndicators: [4]),
                       BarChartGroupData(x: 5, barRods:
                       [BarChartRodData(toY: 25,width: 15)],showingTooltipIndicators: [5]),
                       BarChartGroupData(x: 6, barRods:
                       [BarChartRodData(toY: 25,width: 15)],showingTooltipIndicators: [6]),
                       BarChartGroupData(x: 7, barRods:
                       [BarChartRodData(toY: 25,width: 15)],showingTooltipIndicators: [7]),
                       BarChartGroupData(x: 8, barRods:
                       [BarChartRodData(toY: 25,width: 15)],showingTooltipIndicators: [8]),
                       BarChartGroupData(x: 9, barRods:
                       [BarChartRodData(toY: 25,width: 15)],showingTooltipIndicators: [9]),
                       BarChartGroupData(x: 10, barRods:
                       [BarChartRodData(toY: 25,width: 15)],showingTooltipIndicators: [10]),
                     ]
                 ),
               ),
             ),
           )

         ],
       ),
     ),
   );
  }
}