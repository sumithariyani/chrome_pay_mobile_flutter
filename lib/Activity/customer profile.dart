import 'package:chrome_pay_mobile_flutter/TabsViewer/personal.dart';
import 'package:chrome_pay_mobile_flutter/Models/Cust%20dash%20Model.dart';
import 'package:chrome_pay_mobile_flutter/Services/Services.dart';
import 'package:flutter/material.dart';

import '../TabsViewer/financial.dart';
import '../TabsViewer/land.dart';

class CustomerProfile extends StatefulWidget {

  String id="";
  CustomerProfile(this.id);


  @override
  _CustomerProfileState createState() => _CustomerProfileState();

}

class _CustomerProfileState extends State<CustomerProfile> with TickerProviderStateMixin{

  late CustDetailModel custDetailModel;
  // Future<void> getCustomer() async {
  //   custDetailModel = await Services.GetCustDetail(id);
  //
  //   // if (custDetailModel.status!) {
  //   //   print(id);
  //   // }
  // }

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        width: MediaQuery
            .of(context)
            .size
            .width,
        height: MediaQuery
            .of(context)
            .size
            .height,
        child: Stack(
          children: [
            Container(
              alignment: Alignment.topRight,
              child: Image.asset('images/login_stuff_31.png',
                height: 200,
                width: 150,
              ),
            ),
            Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              height: MediaQuery
                  .of(context)
                  .size
                  .height,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
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
                        child: const Text('Customer Profile',
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold
                          ),),
                      ),
                    ],
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        top: 20.0, bottom: 10.0, left: 10.0, right: 10.0),
                    child: Card(
                      elevation: 5,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(
                              10.0))
                      ),
                      child: TabBar(
                        controller: _tabController,
                        labelColor: Colors.white,
                        unselectedLabelColor: Colors.black,
                        indicator: BoxDecoration(
                            borderRadius: BorderRadius.all(
                                Radius.circular(10.0)),
                            color: Color(0xff0D5085)
                        ),
                        tabs: [
                          Tab(
                            child: Row(
                              children: [
                                Image.asset(
                                  'images/home_page_icon_18.png', width: 18,
                                  height: 18,),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 2.0),
                                  child: Text('Personal'),
                                ),

                              ],
                            ),
                          ),
                          Tab(
                            child: Row(
                              children: [
                                Image.asset(
                                  'images/home_page_icon_15.png', width: 18,
                                  height: 18,),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 2.0),
                                  child: Text('Land'),
                                ),
                              ],
                            ),
                          ),
                          Tab(
                            child: Row(
                              children: [

                                Image.asset(
                                  'images/home_page_icon_16.png', width: 18,
                                  height: 18,),
                                Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 0.0),
                                  child: Text('Financial'),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      child: TabBarView(
                        controller: _tabController,
                        children: [
                          Personal(widget.id),
                          LandCertificate(widget.id),
                          FinancialActivites(widget.id),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.bottomCenter,
                    margin: const EdgeInsets.fromLTRB(50, 20, 50, 10),
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(40.0)),
                        gradient: LinearGradient(colors: [
                          Color(0xff2CABBB),
                          Color(0xff0B527E),
                        ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter)
                    ),
                    child: ButtonTheme(
                      minWidth: 400,
                      height: 50,
                      child: MaterialButton(
                        onPressed: () {
                          // navigaterUser();
                        },
                        textColor: Colors.white,
                        child: const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: const Text('Services',
                            style: const TextStyle(fontSize: 18,),),
                        ),
                      ),
                    ),
                  )

                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}