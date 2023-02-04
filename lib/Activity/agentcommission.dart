

import 'package:chrome_pay_mobile_flutter/Models/Agent%20Commisssion%20%20Model.dart';
import 'package:chrome_pay_mobile_flutter/Services/Services.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AgentCommission extends StatefulWidget {
  @override
  _AgentCommissionState createState() => _AgentCommissionState();

}

class _AgentCommissionState extends State<AgentCommission> {

  int _page = 1;
  final int _limit = 20;
  final _scrollController = ScrollController();
  bool _isPageLoading = false;
  SharedPreferences? prefs;
  List<String> customerList = [];
  DateTime? fromDate, toDate;
  String? selectedFromDate, selectedToDate;

  late AgentCommissionModel agentCommissionModel;

  Future<void> getCustomer() async {
    _isPageLoading = true;
    prefs = await SharedPreferences.getInstance();
    agentCommissionModel = await Services.CommissionList(prefs?.getString("token").toString()??"",
        _page, selectedFromDate??"0001-01-01", selectedToDate??"0001-01-01");
    setState(() {
      for (int i = 0; i<agentCommissionModel.filter!.length; i++){
        customerList.add(agentCommissionModel.filter![i].id ??"");
      }
    });
  }

  @override
  void initState() {
    getCustomer();
    super.initState();
    getAsync();
    _scrollController.addListener(_scrollListener) ;
    }

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
  Widget build(BuildContext context) {

    return  Scaffold(
      body: Stack(
        children: [
          Container(
            alignment: Alignment.topRight,
            child: Image.asset('images/login_stuff_31.png',
              height: 200,
              width: 150,
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: SingleChildScrollView(
              controller: _scrollController,
              child: ConstrainedBox(
                constraints: BoxConstraints(),
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
                            child: Text('Agent Commission',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Card(
                      margin: EdgeInsets.all(20.0),
                      color: Colors.transparent,
                      shadowColor: Colors.black,
                      elevation: 5,
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: 40.0,
                        decoration: BoxDecoration(
                            border: Border.all(
                                color: Colors.black,
                                width: 1
                            ),
                            borderRadius: BorderRadius.circular(20.0),
                            shape: BoxShape.rectangle,
                            color: Colors.white
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () async{
                                fromDate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(1950),
                                    lastDate: DateTime.now());
                                if(fromDate != null){
                                  print('Date Selecte : ${fromDate?.day}-${fromDate?.month}-${fromDate?.year}');
                                }
                                setState(() {
                                  selectedFromDate='${fromDate?.year}-${fromDate?.month}-${fromDate?.day}';
                                  print("selectedFromDate ${selectedFromDate}");
                                });
                              },
                              child: Row(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(left: 20.0),
                                    alignment: Alignment.center,
                                        child: Text('${selectedFromDate??"From Date"}'),
                                  ),
                                  Container(
                                      margin: EdgeInsets.only(left: 5.0),
                                      alignment: Alignment.center,
                                      child: Icon(Icons.keyboard_arrow_down)
                                  ),
                                ],
                              ),
                            ),
                            Spacer(),
                            Container(
                              margin: EdgeInsets.symmetric(vertical: 3.5),
                              alignment: Alignment.center,
                              width: 1,
                              color: Colors.black,
                            ),
                            Spacer(),
                            InkWell(
                              onTap: () async{
                                toDate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime.now(),
                                    firstDate: DateTime(1950),
                                    lastDate: DateTime.now());
                                if(toDate != null){
                                  print('toDate : ${toDate?.day}-${toDate?.month}-${toDate?.year}');
                                  setState(() {
                                    selectedToDate='${toDate?.year}-${toDate?.month}-${toDate?.day}';
                                    print("selectedToDate ${selectedToDate}");
                                  });
                                }
                              },
                              child: Row(
                                children: [
                                  Container(
                                      margin: EdgeInsets.symmetric(horizontal: 5.0),
                                      alignment: Alignment.centerRight,
                                          child: Text('${selectedToDate??"To Date"}'),
                                    ),
                                  Container(
                                      margin: EdgeInsets.only(right: 20.0),
                                      alignment: Alignment.centerRight,
                                      child: Icon(Icons.keyboard_arrow_down)
                                  )
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    // Card(
                    //   margin: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
                    //   color: Colors.transparent,
                    //   shadowColor: Colors.black,
                    //   elevation: 5,
                    //   child: Container(
                    //     width: MediaQuery.of(context).size.width,
                    //     height: 40.0,
                    //     decoration: BoxDecoration(
                    //         borderRadius: BorderRadius.circular(10.0),
                    //         shape: BoxShape.rectangle,
                    //         color: Colors.white
                    //     ),
                    //     child: Row(
                    //       mainAxisAlignment: MainAxisAlignment.start,
                    //       crossAxisAlignment: CrossAxisAlignment.start,
                    //       children: [
                    //         Container(
                    //           margin: EdgeInsets.only(left: 20.0),
                    //           alignment: Alignment.center,
                    //           child: Text('Name'),
                    //         ),
                    //
                    //         Spacer(),
                    //         Container(
                    //           margin: EdgeInsets.symmetric(horizontal: 20.0),
                    //           alignment: Alignment.centerRight,
                    //           child: Text('Amount'),
                    //         ),
                    //       ],
                    //     ),
                    //   ),
                    // ),
                    Container(
                      alignment: Alignment.center ,
                      margin: EdgeInsets.only(bottom: 10.0),
                      child: FutureBuilder<AgentCommissionModel>(
                          future: Services.CommissionList(prefs?.getString('token').toString()??"",
                              _page, selectedFromDate??"0001-01-01", selectedToDate??"0001-01-01"),
                          builder: (mcontext, snapshot){
                            if (snapshot.hasData){
                              _isPageLoading = false;

                              Container(
                                // width: double.infinity,
                                child: ListView.builder(
                                  padding: EdgeInsets.all(12.0),
                                  itemCount: snapshot.data!.filter?.length?? 0,
                                  shrinkWrap: true,
                                  itemBuilder:(context, index) {
                                    return Card(
                                      color: Colors.transparent,
                                      margin: EdgeInsets.fromLTRB(20, 0, 20, 20),
                                      elevation: 5,
                                      shadowColor: Colors.black,
                                      child: Container(
                                        width: MediaQuery.of(context).size.width,
                                        height: 90,
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(5.0),
                                            color: Colors.white
                                        ),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.start,
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Column(
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Container(
                                                  alignment: AlignmentDirectional.center,
                                                  margin: EdgeInsets.only(left: 5.0, right: 5.0, top: 5.0, bottom: 5.0),
                                                  decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(5.0),
                                                      color: Colors.black12
                                                  ),
                                                  child: Padding(
                                                    padding: const EdgeInsets.all(8.0),
                                                    child: Text("30\nJAN",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(fontSize: 16.0,
                                                        fontWeight: FontWeight.w500),),
                                                  ),
                                                ),
                                                Container(
                                                    margin: EdgeInsets.only(left: 5.0, right: 5.0, top: 5.0, bottom: 5.0),
                                                    child: Text("03:15 PM")
                                                )
                                              ],
                                            ),
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Container(
                                                  margin: EdgeInsets.only(left: 5.0,top: 10.0,),
                                                  child: Text("${agentCommissionModel?.filter?[index].custName}",
                                                    style: TextStyle(fontWeight: FontWeight.w500,
                                                    fontSize: 16.0),),
                                                ),
                                                Spacer(),
                                                Container(
                                                  margin: EdgeInsets.only(left: 5.0, bottom: 5.0),
                                                  child: Column(
                                                    crossAxisAlignment: CrossAxisAlignment.start,
                                                    mainAxisAlignment: MainAxisAlignment.start,
                                                    children: [
                                                      Container(
                                                        child: Text("Transaction ID"),
                                                      ),
                                                      Container(
                                                        child: Text("#1313131346",
                                                        style: TextStyle(fontWeight: FontWeight.bold),),
                                                      ),
                                                    ],
                                                  ),
                                                )
                                              ],
                                            ),
                                            Spacer(),
                                            Container(
                                                margin: EdgeInsets.symmetric(horizontal: 10.0),
                                                alignment: Alignment.centerRight,
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.end,
                                                  children: [
                                                    Container(
                                                      margin: EdgeInsets.only(top: 10.0),
                                                      child: Text("\$${agentCommissionModel?.filter?[index].commission}",
                                                        style: TextStyle(),),
                                                    ),
                                                  ],
                                                )
                                            ),

                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                  physics: NeverScrollableScrollPhysics(),
                                ),
                              );
                            }else if (snapshot.hasError){
                              return Expanded(
                                child: Center(
                                  child: Text('Not Found'),
                                ),
                              );
                            }
                            return const CircularProgressIndicator();
                          }
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }

  void _scrollListener(){
    print("working");
    if(_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      _page = _page+1;
      getCustomer().then((data) {
      });
    } else {
      print('Dont');
    }
  }
}