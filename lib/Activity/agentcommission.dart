import 'package:chrome_pay_mobile_flutter/Models/Agent%20Commisssion%20%20Model.dart';
import 'package:chrome_pay_mobile_flutter/Services/Services.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:intl/intl.dart';


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
  List<Filter> customerList = [];
  DateTime? fromDate, toDate;
  String? selectedFromDate, selectedToDate;
  late AgentCommissionModel agentCommissionModel;

  Future<void> getCustomer(int page) async {
    print("calaghhggj");
    if(page<=1) {
      setState(() {
        _isPageLoading = true;
      });
    }

    prefs = await SharedPreferences.getInstance();
    agentCommissionModel = await Services.CommissionList(prefs?.getString("token").toString()??"",
        page, selectedFromDate??"", selectedToDate??"");
    for (int i = 0; i<agentCommissionModel.filter!.length; i++){
      customerList.add(agentCommissionModel.filter![i]);
    }
    if(page<=1) {
      setState(() {
        _isPageLoading = false;
      });
    }else{
      setState(() {

      });
    }
  }

  @override
  void initState() {
    super.initState();
      getCustomer(_page);
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
      body: Container(
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
                    Container(
                      margin: EdgeInsets.only(top: 10.0),
                      child: Row(
                        children: [
                          Container(
                            height: 60.0,
                            margin: EdgeInsets.only(left: 15.0, right: 10.0),
                            child: InkWell(
                                onTap: () async{
                                  fromDate = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(1950),
                                      lastDate: DateTime.now());
                                  int? month = fromDate?.month;
                                  String? fm=""+ "${month}";
                                  String? fd=""+"${fromDate?.day}";
                                  if(month!<10){
                                    fm ="0"+"${month}";
                                    print("fm ${fm}");
                                  }
                                  if (fromDate!.day<10){
                                    fd="0"+"${fromDate?.day}";
                                    print("fd ${fd}");
                                  }
                                  if(fromDate != null){
                                    print('Date Selecte : ${fromDate?.day ??""}-${fromDate?.month ??""}-${fromDate?.year ??""}');
                                    setState(() {
                                      selectedFromDate='${fromDate?.year??""}-${fm}-${fd}';
                                      print("selectedFromDate ${selectedFromDate?.split(" ")[0]}");
                                    });
                                  }
                              },
                              child: Card(
                                elevation: 10,
                                  child: Row(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                                        child: Image.asset("images/popup-07.png",
                                        height: 20,),
                                      ),
                                      Container(
                                        child: Text("${selectedFromDate??"From Date"}",
                                        style: TextStyle(
                                          fontFamily: "OpensansSemiBold",
                                          fontSize: 13.0
                                        ),),
                                      ),
                                      Container(
                                          margin: EdgeInsets.only(left: 5.0),
                                          alignment: Alignment.center,
                                          child: Icon(Icons.keyboard_arrow_down)
                                      ),
                                    ],
                                  )
                              ),
                            ),
                          ),
                          Container(
                            width: 140,
                              height: 60.0,
                              margin: EdgeInsets.symmetric(horizontal: 5.0),
                              child: InkWell(
                                onTap: () async{
                                  toDate = await showDatePicker(
                                      context: context,
                                      initialDate: DateTime.now(),
                                      firstDate: DateTime(1950),
                                      lastDate: DateTime.now());
                                  int? month = toDate?.month;
                                  String? fm=""+ "${month}";
                                  String? fd=""+"${toDate?.day}";
                                  if(month!<10){
                                    fm ="0"+"${month}";
                                    print("fm ${fm}");
                                  }
                                  if (toDate!.day<10){
                                    fd="0"+"${toDate?.day}";
                                    print("fd ${fd}");
                                  }
                                  if(toDate != null){
                                    print('toDate : ${toDate?.day ??""}-${toDate?.month ??""}-${toDate?.year ??""}');
                                    setState(() {
                                      selectedToDate='${toDate?.year ??""}-${fm}-${fd}';
                                      print("selectedToDate ${selectedToDate}");
                                    });
                                  }
                                },
                                child: Card(
                                    elevation: 10,
                                    child: Row(
                                      children: [
                                        Container(
                                          margin: EdgeInsets.symmetric(horizontal: 5.0),
                                          child: Image.asset("images/popup-07.png",
                                            height: 20,),
                                        ),
                                        Container(
                                          child: Text("${selectedToDate??"To Date"}",
                                            style: TextStyle(
                                              fontSize: 13.0,
                                                fontFamily: "OpensansSemiBold"
                                            ),),
                                        ),
                                        Spacer(),
                                        Container(
                                            margin: EdgeInsets.only(left: 5.0),
                                            alignment: Alignment.centerRight,
                                            child: Icon(Icons.keyboard_arrow_down)
                                        ),
                                      ],
                                    )
                                ),
                              ),
                            ),
                          Container(
                                  alignment: Alignment.centerRight,
                                  margin: EdgeInsets.only(right: 10.0),
                                  child: InkWell(
                                    onTap: (){
                                      // _isPageLoading = true;
                                        setState(() {
                                        if(selectedFromDate != null && fromDate != null) {
                                          _isPageLoading = true;
                                          getCustomer(1);
                                          print("tap");
                                        }
                                        });
                                    },
                                    child: CircleAvatar(
                                      radius: 20,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                            boxShadow:  [
                                              BoxShadow(
                                                color: Color(0xff2CABBB).withOpacity(0.5),
                                                spreadRadius: 1,
                                                blurRadius: 5,
                                                offset: Offset(0, 3), // changes position of shadow
                                              ),
                                            ],
                                            image: DecorationImage(image: AssetImage("images/popup-08.png",),
                                            scale: 4.0),
                                            gradient: LinearGradient(colors: [
                                              Color(0xff0B527E),
                                              Color(0xff2CABBB),
                                            ],begin: Alignment.bottomLeft, end: Alignment.topRight)
                                        ),
                                      ),
                            ),
                                  ),
                                ),
                        ],
                      ),
                    ),
                    Container(
                      alignment: Alignment.center ,
                      margin: EdgeInsets.only(top:10.0, bottom: 10.0),
                      child: Container(
                        // width: double.infinity,
                        child: _isPageLoading ? Center(
                          child: CircularProgressIndicator(),
                        ):ListView.builder(
                          padding: EdgeInsets.all(12.0),
                          itemCount: customerList.length,
                          shrinkWrap: true,
                          itemBuilder:(context, index) {
                            Filter filter = customerList[index];
                            var date = DateTime.parse("${filter.Date}");
                            var time = "${filter.Time}";
                            if (customerList.length != null){
                              return Card(
                                color: Colors.transparent,
                                margin: EdgeInsets.fromLTRB(5, 0, 5, 20),
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
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Container(
                                            height: 60.0,
                                            alignment: AlignmentDirectional.center,
                                            margin: EdgeInsets.only(left: 10.0, right: 5.0, top: 5.0, bottom: 5.0),
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(5.0),
                                                gradient: LinearGradient(colors: [
                                                  Color(0xff0B527E),
                                                  Color(0xff2CABBB),
                                                ],begin: Alignment.topLeft, end: Alignment.topRight)

                                            ),
                                            child:  Padding(
                                              padding: EdgeInsets.all(4.0),
                                              child: Column(
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.all(8.0),
                                                    child: Text(
                                                      "${DateFormat('dd/MMMM').format(date).substring(0,6).replaceAll("/", " ")}",
                                                      textAlign: TextAlign.center,
                                                      style: TextStyle(color: Colors.white,
                                                          fontWeight: FontWeight.w500),),
                                                  ),
                                                  Container(
                                                      child: Text( "${time}",
                                                        style: TextStyle(color: Colors.white,
                                                        fontSize: 10.0 ),
                                                      )
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(left: 20.0),
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.center,
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              margin: EdgeInsets.only(left: 5.0,top: 10.0, bottom: 5.0),
                                              child: Text("${filter.custName}",
                                                style: TextStyle(fontWeight: FontWeight.w500,
                                                    fontSize: 13.0,
                                                fontFamily: "OpensansRegular"),),
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(left: 5.0, bottom: 5.0),
                                              child: Column(
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                mainAxisAlignment: MainAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    child: Text("Transaction ID",
                                                    style: TextStyle(
                                                      fontSize: 10.0
                                                    ),),
                                                  ),
                                                  Container(
                                                    child: Text("#1313131346",
                                                      style: TextStyle(
                                                          fontSize: 13.0,
                                                          fontFamily: "OpensansRegular"),),
                                                  ),
                                                ],
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                      Spacer(),
                                      Container(
                                          margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
                                          alignment: Alignment.centerRight,
                                          child: Column(
                                            crossAxisAlignment: CrossAxisAlignment.end,
                                            children: [
                                              Container(
                                                margin: EdgeInsets.only(top: 10.0),
                                                child: Text("\$${filter.commission}",
                                                  style: TextStyle(fontFamily: "OpensansRegular"),),
                                              ),
                                            ],
                                          )
                                      ),

                                    ],
                                  ),
                                ),
                              );
                            }
                            else if(customerList.isEmpty == true){
                              print("gfhdgsgdfkjl");
                              return Center(
                                child: Text('Not Found'),
                              );
                            }
                            return const CircularProgressIndicator();
                          },
                          physics: NeverScrollableScrollPhysics(),
                        ),
                      )
                    )
                  ],
                ),
              ),
            ),
          )
    );
  }

  void _scrollListener(){
    if(_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      _page = _page+1;
      print("working");
      getCustomer(_page).then((data) {
      });
    }
  }
}