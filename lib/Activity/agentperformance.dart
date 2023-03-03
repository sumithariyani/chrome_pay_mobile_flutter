import 'dart:core';
import 'dart:math';
// import 'package:charts_flutter_new/flutter.dart' as charts;
import 'package:fl_chart/fl_chart.dart';
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
  int? year;
  int? sales;
  Sales(this.year, this.sales);
}
class _Month {
  int? month;
  int? sales;
  _Month(this.month, this.sales);
}
class _Day {
  String? day;
  int? sales;
  _Day(this.day, this.sales);
}

class _AgentPerformanceState extends State<AgentPerformance> {
  List<Color> gradientColors = [
    Colors.cyan,
    Colors.blue,
  ];

  late SharedPreferences prefs;
  List<String> filter = ['Year', 'Month', 'Day'];
  String? selectedFilter = 'Month';
  bool _isPageLoading = false;

  // static List<charts.Series<Sales,int>> _chartsData=[];
  // static List <charts.Series<_Month,int>> _monthData=[];
  // late List<charts.Series<_Day,String>> _dayData=[];
  var data;
   AgentPerformanceModel? _agentPerformanceModel;
   bool isload1=false;
   bool isload2=false;
   bool isload3=false;
  Future<void> getCustomer() async {
    _isPageLoading = true;
    prefs = await SharedPreferences.getInstance();
    // _chartsData.clear();
    // _monthData.clear();
    // _dayData.clear();
    _agentPerformanceModel = await Services.AgentPer(prefs.getString('token').toString(),selectedFilter.toString());
    print("prefs!.getString(token).toString() ${prefs!.getString("token").toString()}");
    if(_agentPerformanceModel!.status == true){
      _isPageLoading = false;
      if(_agentPerformanceModel!.year!=null){

        print("object");
        List<Sales>? _data = [
        Sales(2018, _agentPerformanceModel?.year?.year1),
        Sales(2019, _agentPerformanceModel?.year?.year2),
        Sales(2020, _agentPerformanceModel?.year?.year3),
        Sales(2021, _agentPerformanceModel?.year?.year4),
        Sales(2022, _agentPerformanceModel?.year?.year5),
        Sales(2023, _agentPerformanceModel?.year?.year6),
        Sales(2024, _agentPerformanceModel?.year?.year7),
        Sales(2025, _agentPerformanceModel?.year?.year8),
        Sales(2026, _agentPerformanceModel?.year?.year9),
      ];

        isload1=true;
      //  _chartsData = [
      //   charts.Series(
      //     id: "Years",
      //     data: _data,
      //     domainFn: (Sales sales,__) => int.parse(sales.year.toString()),
      //     measureFn: (Sales sales,__) => int.parse(sales.sales.toString()),
      //   )
      // ];
    }
      if(_agentPerformanceModel!.month!=null){
        data = [
          double.parse("${_agentPerformanceModel?.month?.January}"),
          double.parse("${_agentPerformanceModel?.month?.February}"),
          double.parse("${_agentPerformanceModel?.month?.March}"),
          double.parse("${_agentPerformanceModel?.month?.April}"),
          double.parse("${_agentPerformanceModel?.month?.May}"),
          double.parse("${_agentPerformanceModel?.month?.June}"),
          double.parse("${_agentPerformanceModel?.month?.July}"),
          double.parse("${_agentPerformanceModel?.month?.August}"),
          double.parse("${_agentPerformanceModel?.month?.September}"),
          double.parse("${_agentPerformanceModel?.month?.October}"),
          double.parse("${_agentPerformanceModel?.month?.November}"),
          double.parse("${_agentPerformanceModel?.month?.December}"),
          ];
        List<_Month> _monthdata = [
          _Month(1, _agentPerformanceModel?.month?.January),
          _Month(2, _agentPerformanceModel?.month?.February),
          _Month(3, _agentPerformanceModel?.month?.March),
          _Month(4, _agentPerformanceModel?.month?.April),
          _Month(5, _agentPerformanceModel?.month?.May),
          _Month(6, _agentPerformanceModel?.month?.June),
          _Month(7, _agentPerformanceModel?.month?.July),
          _Month(8, _agentPerformanceModel?.month?.August),
          _Month(9, _agentPerformanceModel?.month?.September),
          _Month(10, _agentPerformanceModel?.month?.October),
          _Month(11, _agentPerformanceModel?.month?.November),
          _Month(12, _agentPerformanceModel?.month?.December),
      ];
        isload2=true;
      //  _monthData = [
      //   charts.Series(
      //     id: "Month",
      //     data: _monthdata,
      //     domainFn: (_Month month,__) => month.month!.toInt(),
      //     measureFn: (_Month month,__) => int.parse(month.sales.toString()),
      //   )
      // ];
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
      ];

        isload3=true;
      //  _dayData = [
      //   charts.Series(
      //     id: "Day",
      //     data: _data,
      //     domainFn: (_Day day,__) => day.day.toString(),
      //     measureFn: (_Day day,__) => int.parse(day.sales.toString()),
      //   ),
      // ];
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
                     padding: EdgeInsets.all(5.0),
                     margin: const EdgeInsets.fromLTRB(15, 40, 0, 0),
                     child: Image.asset('images/login_stuff_03.png',
                       height: 20,
                     ),
                   ),
                 ),
                 Container(
                   padding: EdgeInsets.only(top: 5.0),
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
             margin: EdgeInsets.fromLTRB(20, 20, 20, 20),
             elevation: 5,
             shadowColor: Colors.black,
             child: Container(
               width: MediaQuery.of(context).size.width,
               height: 180,
               decoration: BoxDecoration(
                 borderRadius: BorderRadius.circular(10.0),
                 color: Colors.white,
               ),
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.center,
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Spacer(),
                   Row(
                     mainAxisAlignment: MainAxisAlignment.start,
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                             Container(
                               alignment: Alignment.center,
                               margin: EdgeInsets.only(left: 20.0, right: 10.0),
                               child: CircleAvatar(
                                 backgroundColor: Colors.black,
                                 backgroundImage: AssetImage("images/all_dids_06.png"),
                                 radius: 40,
                               ),
                             ),
                             Expanded(
                                 child: Column(
                                   crossAxisAlignment: CrossAxisAlignment.start,
                                   mainAxisAlignment: MainAxisAlignment.center,
                                   children: [
                                 Container(
                                   margin: EdgeInsets.only(top: 10.0),
                                     child: Text(
                                       "Sumit Hariyani" ,
                                       style: TextStyle(
                                           fontFamily: 'OpenSans',
                                           fontSize: 18),
                                     ),
                                 ),
                                 Container(
                                   margin: EdgeInsets.only(top: 5.0),
                                   child: Row(
                                         children: [
                                           Padding(
                                             padding: const EdgeInsets.only(right: 8.0),
                                             child: Image.asset('images/Agency-04.png',
                                               height: 15,),
                                           ),
                                           Text(
                                               "Agent",
                                               style: TextStyle(
                                                 fontFamily: 'OpenSans',
                                               )
                                           ),
                                         ],
                                       ),
                                 ),
                                 Container(
                                   margin: EdgeInsets.only(top: 5.0),
                                   child: Row(
                                       children: [
                                         Padding(
                                           padding:  const EdgeInsets.only(right: 8.0),
                                           child: Image.asset('images/home_page_icon_19.png',
                                           height: 15,),
                                         ),
                                         Text(
                                             "India",
                                             style: TextStyle(
                                                 fontFamily: 'OpenSans'
                                             )
                                         ),
                                       ],
                                     ),
                                 ),
                               ],
                             )
                             )
                     ],
                   ),
                   Container(
                     margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
                     child: Row(
                       children: [
                         Padding(
                           padding: const EdgeInsets.symmetric(horizontal: 8.0),
                           child: Image.asset('images/Agency-03.png',
                             height: 15,),
                         ),
                         Text(
                             "sumithariyani@gmail.com",
                             style: TextStyle(
                               fontFamily: 'OpenSans',
                             )
                         ),
                       ],
                     ),
                   ),
                   Spacer(),
                   Container(
                       alignment: AlignmentDirectional.bottomCenter,
                       // width: MediaQuery.of(context).size.width,
                         height: 10,
                         decoration: const BoxDecoration(
                             borderRadius: BorderRadius.only(
                               bottomLeft: Radius.circular(30.0),
                               bottomRight: Radius.circular(30.0)
                             ),
                             gradient: LinearGradient(colors: [
                               Color(0xff0B527E),
                               Color(0xff2CABBB),
                             ],
                                 begin: Alignment.centerLeft,
                                 end: Alignment.centerRight)
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
                 Padding(
                   padding: const EdgeInsets.only(bottom: 8.0),
                   child: Container(
                     margin: EdgeInsets.all(10),
                     child: Card(
                          elevation: 5,
                          shadowColor: Colors.white,
                          child: Container(
                             width: MediaQuery.of(context).size.width,
                             height: 50,
                             decoration: BoxDecoration(
                                 borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                 // color: const Color(0xc3dcfbee)
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
                        ),

                   ),
                 ),

                     // if(_monthData!.isNotEmpty) Container(
                     if(isload2) Container(
                       child: Expanded(child:
                           _isPageLoading ? Center(
                             child: CircularProgressIndicator(),
                           ):Padding(
                             padding: const EdgeInsets.only(right: 15.0),
                             child: LineChart(
                               monthData(),
                             ),
                           ),
                       ),
                     ),

                   // if(_chartsData!.isNotEmpty) Expanded(
                   if(isload1) Expanded(
                       child: _isPageLoading ? Center(
                     child: CircularProgressIndicator(),
                   ):Padding(padding: const EdgeInsets.only(right: 15.0),
                         child: LineChart(
                           yearData(),
                         ),)
                   ),

                   // if(_dayData!.isNotEmpty) Expanded(
                   if(isload3) Expanded(
                       child: _isPageLoading ? Center(
                         child: CircularProgressIndicator(),
                       ): Padding(padding: const EdgeInsets.only(right: 15.0),
                     child: LineChart(
                       weekData(),
                     ),)
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

  LineChartData monthData() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        horizontalInterval: 1,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            // color: Colors.mainGridLineColor,
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            // color: AppColors.mainGridLineColor,
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: 1,
            getTitlesWidget: monthBottomTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            // getTitlesWidget: leftTitleWidgets,
            reservedSize: 30,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: const Color(0xff37434d)),
      ),
      lineBarsData: [
        LineChartBarData(
          spots:  [
            FlSpot(0, double.parse("${_agentPerformanceModel?.month?.January}")),
            FlSpot(1, double.parse("${_agentPerformanceModel?.month?.February}")),
            FlSpot(2, double.parse("${_agentPerformanceModel?.month?.March}")),
            FlSpot(3, double.parse("${_agentPerformanceModel?.month?.April}")),
            FlSpot(4, double.parse("${_agentPerformanceModel?.month?.May}")),
            FlSpot(5, double.parse("${_agentPerformanceModel?.month?.June}")),
            FlSpot(6, double.parse("${_agentPerformanceModel?.month?.July}")),
            FlSpot(7, double.parse("${_agentPerformanceModel?.month?.August}")),
            FlSpot(8, double.parse("${_agentPerformanceModel?.month?.September}")),
            FlSpot(9, double.parse("${_agentPerformanceModel?.month?.October}")),
            FlSpot(10, double.parse("${_agentPerformanceModel?.month?.November}")),
            FlSpot(11, double.parse("${_agentPerformanceModel?.month?.December}")),
          ],
          gradient: LinearGradient(
            colors: gradientColors,
          ),
          barWidth: 3,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: true,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: gradientColors
                  .map((color) => color.withOpacity(0.3))
                  .toList(),
            ),
          ),
        ),
      ],
    );
  }
  Widget monthBottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.normal,
      fontSize: 9,
    );
    Widget text;
    switch (value.toInt()) {
      case 0:
        text = const Text('JAN', style: style);
        break;
      case 1:
        text = const Text('FEB', style: style);
        break;
      case 2:
        text = const Text('MAR', style: style);
        break;
      case 3:
        text = const Text('APR', style: style);
        break;
      case 4:
        text = const Text('MAY', style: style);
        break;
      case 5:
        text = const Text('JUN', style: style);
        break;
      case 6:
        text = const Text('JUL', style: style);
        break;
      case 7:
        text = const Text('AUG', style: style);
        break;
      case 8:
        text = const Text('SEP', style: style);
        break;
      case 9:
        text = const Text('OCT', style: style);
        break;
      case 10:
        text = const Text('NOV', style: style);
        break;
      case 11:
        text = const Text('DEC', style: style);
        break;
      default:
        text = const Text('', style: style);
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }

  LineChartData yearData() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        horizontalInterval: 1,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            // color: Colors.mainGridLineColor,
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            // color: AppColors.mainGridLineColor,
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: 1,
            getTitlesWidget: yearBottomTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            // getTitlesWidget: leftTitleWidgets,
            reservedSize: 30,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: const Color(0xff37434d)),
      ),
      lineBarsData: [
        LineChartBarData(
          spots:  [
            FlSpot(0, double.parse("${_agentPerformanceModel?.year?.year1}")),
            FlSpot(2, double.parse("${_agentPerformanceModel?.year?.year2}")),
            FlSpot(3, double.parse("${_agentPerformanceModel?.year?.year3}")),
            FlSpot(4, double.parse("${_agentPerformanceModel?.year?.year4}")),
            FlSpot(5, double.parse("${_agentPerformanceModel?.year?.year5}")),
            FlSpot(6, double.parse("${_agentPerformanceModel?.year?.year6}")),
            FlSpot(7, double.parse("${_agentPerformanceModel?.year?.year7}")),
            FlSpot(8, double.parse("${_agentPerformanceModel?.year?.year8}")),
            FlSpot(9, double.parse("${_agentPerformanceModel?.year?.year9}")),
          ],
          // isCurved: true,
          gradient: LinearGradient(
            colors: gradientColors,
          ),
          barWidth: 3,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: true,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: gradientColors
                  .map((color) => color.withOpacity(0.3))
                  .toList(),
            ),
          ),
        ),
      ],
    );

  }
  Widget yearBottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.normal,
      fontSize: 9,
    );
    Widget text;
    switch (value.toInt()) {
      case 0:
        text = const Text('2018', style: style);
        break;
      case 1:
        text = const Text('2019', style: style);
        break;
      case 2:
        text = const Text('2020', style: style);
        break;
      case 3:
        text = const Text('2021', style: style);
        break;
      case 4:
        text = const Text('2022', style: style);
        break;
      case 5:
        text = const Text('2023', style: style);
        break;
      case 6:
        text = const Text('2024', style: style);
        break;
      case 7:
        text = const Text('2025', style: style);
        break;
      case 8:
        text = const Text('2026', style: style);
        break;
      default:
        text = const Text('', style: style);
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }

  LineChartData weekData() {
    return LineChartData(
      gridData: FlGridData(
        show: true,
        drawVerticalLine: true,
        horizontalInterval: 1,
        getDrawingHorizontalLine: (value) {
          return FlLine(
            // color: Colors.mainGridLineColor,
            strokeWidth: 1,
          );
        },
        getDrawingVerticalLine: (value) {
          return FlLine(
            // color: AppColors.mainGridLineColor,
            strokeWidth: 1,
          );
        },
      ),
      titlesData: FlTitlesData(
        show: true,
        rightTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        topTitles: AxisTitles(
          sideTitles: SideTitles(showTitles: false),
        ),
        bottomTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            reservedSize: 30,
            interval: 1,
            getTitlesWidget: weekBottomTitleWidgets,
          ),
        ),
        leftTitles: AxisTitles(
          sideTitles: SideTitles(
            showTitles: true,
            interval: 1,
            // getTitlesWidget: leftTitleWidgets,
            reservedSize: 30,
          ),
        ),
      ),
      borderData: FlBorderData(
        show: true,
        border: Border.all(color: const Color(0xff37434d)),
      ),
      lineBarsData: [
        LineChartBarData(
          spots:  [
            FlSpot(0, double.parse("${_agentPerformanceModel?.day?.monday}")),
            FlSpot(1, double.parse("${_agentPerformanceModel?.day?.tuseday}")),
            FlSpot(2, double.parse("${_agentPerformanceModel?.day?.wednesday}")),
            FlSpot(3, double.parse("${_agentPerformanceModel?.day?.thrusday}")),
            FlSpot(4, double.parse("${_agentPerformanceModel?.day?.friday}")),
            FlSpot(5, double.parse("${_agentPerformanceModel?.day?.saturday}")),
            FlSpot(6, double.parse("${_agentPerformanceModel?.day?.sunday}")),
          ],
          // isCurved: true,
          gradient: LinearGradient(
            colors: gradientColors,
          ),
          barWidth: 3,
          isStrokeCapRound: true,
          dotData: FlDotData(
            show: true,
          ),
          belowBarData: BarAreaData(
            show: true,
            gradient: LinearGradient(
              colors: gradientColors
                  .map((color) => color.withOpacity(0.3))
                  .toList(),
            ),
          ),
        ),
      ],
    );

  }
  Widget weekBottomTitleWidgets(double value, TitleMeta meta) {
    const style = TextStyle(
      fontWeight: FontWeight.normal,
      fontSize: 9,
    );
    Widget text;
    switch (value.toInt()) {
      case 0:
        text = const Text('MON', style: style);
        break;
      case 1:
        text = const Text('TUE', style: style);
        break;
      case 2:
        text = const Text('WED', style: style);
        break;
      case 3:
        text = const Text('THU', style: style);
        break;
      case 4:
        text = const Text('FRI', style: style);
        break;
      case 5:
        text = const Text('SAT', style: style);
        break;
      case 6:
        text = const Text('SUN', style: style);
        break;
      default:
        text = const Text('', style: style);
        break;
    }

    return SideTitleWidget(
      axisSide: meta.axisSide,
      child: text,
    );
  }
}



