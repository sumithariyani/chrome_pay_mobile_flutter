import 'package:chrome_pay_mobile_flutter/Activity/register_customer.dart';
import 'package:chrome_pay_mobile_flutter/Activity/setting.dart';
import 'package:flutter/material.dart';

import 'agencybanking.dart';
import 'agentcommission.dart';
import 'agentperformance.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'all-did.dart';
import 'awatingdid.dart';

class Agent extends StatefulWidget {
  @override
  _AgentDashBoard createState() => _AgentDashBoard();

}

class _AgentDashBoard extends State<Agent> {

  int _radioSelected = 0;
  String? _radioVal;
  SharedPreferences? prefs;
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
    bool? status = prefs?.getBool('agentislogin');
    print("agentStaus ${status}");
    List<Widget> routes = [Active_Did(), AwatingDid(), AgentCommission(), AgentPerformance(), AgencyBanking(), Setting()];
    var names =  ['Active D-ID`s', 'Pending approval', 'Agent Commission', 'Agent Performance', 'Agency Banking', 'Settings'];
    var images = ['images/agent_dashboard_stuff_03.png', 'images/agent_dashboard_stuff_08.png', 'images/agent_dashboard_stuff_10.png', 'images/agent_dashboard_stuff_10.png', 'images/icon_12.png', 'images/agent_dashboard_stuff_11.png'];
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body:
        Stack(
          children: <Widget>[
            Container(
              alignment: Alignment.topRight,
              child: Image.asset('images/login_stuff_31.png',
                height: 200,
                width: 150,
                alignment: Alignment.centerRight,),
            ),
             Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child:
                  SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child:Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            margin: const EdgeInsets.fromLTRB(10, 40, 0, 0),
                            child: Image.asset('images/login_stuff_07.png',
                              height: 40,),
                          ),
                          Container(
                            margin: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                            child: Text('Hello,',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold
                              ),),
                          ),
                          Container(
                            margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                            child: Text('Sumit Hariyani',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                              ),),
                          ),
                          Container(
                            child: PhysicalModel(color: Colors.transparent,
                                child: InkWell(
                                  onTap: () {
                                    Navigator.of(context).push(MaterialPageRoute(
                                      builder: (context) => RegisterCustomer("",""),
                                    ));
                                    // _dialog();
                                  },
                                  child: Card(
                                    margin: EdgeInsets.fromLTRB(10, 50, 10, 20),
                                    elevation: 10,
                                    color: Colors.transparent,
                                    shadowColor: Colors.black,
                                    child: Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                          gradient: LinearGradient(colors: [
                                            Color(0xff0B527E),
                                            Color(0xff2CABBB),
                                          ],begin: Alignment.topLeft, end: Alignment.topRight)
                                      ),
                                      width: MediaQuery.of(context).size.width,
                                      height: 100,
                                      child: Row(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
                                            height: 40,
                                            alignment: Alignment.topLeft,
                                            child: CircleAvatar(
                                              backgroundColor: Colors.white,
                                              child: Image.asset('images/agent_dashboard_stuff_01.png',
                                                height: 30,),
                                            ),
                                          ),
                                          Expanded(
                                              flex: 10,
                                              child: Container(
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      margin: EdgeInsets.fromLTRB(10, 10, 0, 0),
                                                      child: Text('Create',
                                                          textAlign: TextAlign.start,
                                                          style: TextStyle(color: Colors.white,
                                                              fontSize: 18)),
                                                    ),
                                                    Container(
                                                      margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                                                      child: Text('Digital ID',
                                                          style: TextStyle(color: Colors.white,
                                                              fontSize: 20,
                                                              fontWeight: FontWeight.bold)),
                                                    ),
                                                    Container(
                                                      alignment: Alignment.bottomRight,
                                                      margin: EdgeInsets.fromLTRB(0, 0, 10, 10),
                                                      child: Image.asset('images/login_stuff_10.png',
                                                        height: 35,),
                                                    ),
                                                  ],
                                                ),
                                              )
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),

                            ),
                          ),

                          Container(
                            margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
                            child: Text('Our Services',
                                style: TextStyle(color: Colors.black,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold)),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Container(
                            child: ListView.builder(
                              itemBuilder: (context, index){
                                return    InkWell(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(
                                        builder: (context) => routes[index]));
                                  },
                                    child: Container(
                                      child: Card(
                                        margin: EdgeInsets.fromLTRB(20, 0, 20, 20),
                                        elevation: 20,
                                        color: Colors.transparent,
                                        shadowColor: Colors.black,
                                        child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                              color: Colors.white
                                          ),

                                          width: MediaQuery.of(context).size.width,
                                          height: 70,
                                          child: Row(
                                            /* mainAxisAlignment: MainAxisAlignment.start,
                                           crossAxisAlignment: CrossAxisAlignment.start,*/
                                            children: [
                                              Container(
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.all(Radius.circular(20.0))
                                                ),
                                                child:
                                                Card(
                                                  margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                                  elevation: 8,
                                                  color: Colors.transparent,
                                                  child: CircleAvatar(
                                                    backgroundColor: Colors.white,
                                                    child: Image.asset(images[index],
                                                      height: 20,),
                                                  ),),
                                              ),
                                              Container(
                                                margin: EdgeInsets.symmetric(horizontal: 10.0),
                                                alignment: Alignment.center,
                                                child: Text(names[index],
                                                    style: TextStyle(
                                                        fontSize: 15,
                                                        fontWeight: FontWeight.w500)),
                                              ),
                                              const Spacer(),
                                              Container(
                                                  alignment: Alignment.centerRight,
                                                  margin: EdgeInsets.symmetric(horizontal: 10.0),
                                                  child: Image.asset('images/login_stuff_11.png',
                                                    height: 30,)
                                              )
                                            ],
                                          ),
                                        ),
                                      ),
                                    )
                                );
                              },
                              itemCount: names.length,
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                            ),
                          ),
                        ],
                      )
                  )
              ),
          ],
        ),

      ),
    );
  }

  void _dialog(){
    showDialog(context: context, builder: (context){
      return Container(
        child: Dialog(
          child: Container(
            height: 350,
            decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(
                  Radius.circular(40.0)),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        margin: EdgeInsets.all(10.0),
                        child: Text('Select one of them',
                          style: TextStyle(fontSize: 18,
                            fontWeight: FontWeight.bold,),
                          textAlign: TextAlign.center,),
                      ),
                      Expanded(
                          child: InkWell(
                            onTap: (){
                              Navigator.pop(context);
                            },
                            child: Container(
                              alignment: Alignment.topRight,
                              padding: EdgeInsets.all(10.0),
                              child: Image.asset('images/login_stuff_28.png',
                                width:20,
                                height: 20,),
                            ),
                          ),
                      )
                    ],
                  ),
                ),

                  Spacer(),
                   Column(
                        children: [
                          Container(
                            child: Row(
                              children: [
                                Radio(
                                  activeColor: Colors.greenAccent,
                                  value: 1,
                                  groupValue: _radioSelected,
                                  onChanged: (value) {
                                    setState((){
                                      _radioSelected = value as int;
                                      _radioVal = 'Create New D-ID';
                                      print(_radioVal);
                                    });
                                  },),
                                Text('Create New D-ID'),
                              ],
                            ),
                          ),
                          Container(
                            child: Row(
                              children: [
                                Radio(
                                  activeColor: Colors.greenAccent,
                                  value: 2,
                                  groupValue: _radioSelected,
                                  onChanged: (value) {
                                    setState((){
                                      _radioSelected = value as int;
                                      _radioVal = 'Link D-ID to New Services';
                                      print(_radioVal);
                                    });
                                  },),
                                Text('Link D-ID to New Services'),
                              ],
                            ),
                          ),
                        ],
                      ),
                Spacer(),
                Expanded(
                  child: Align(
                    alignment: Alignment.bottomRight,
                    child: Container(
                      // alignment: Alignment.bottomRight,
                      margin: const EdgeInsets.fromLTRB(30, 20, 10, 10),
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(40.0)),
                          gradient: LinearGradient(colors: [
                            Color(0xff2CABBB),
                            Color(0xff0B527E),
                          ],begin: Alignment.topCenter,end: Alignment.bottomCenter)
                      ),
                      child: ButtonTheme(
                        minWidth: 150,
                        height: 50,
                        child: MaterialButton(
                          onPressed: () {
                            _navigator();
                          },
                          textColor: Colors.white,
                          child: const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: const Text('Confirm', style: const TextStyle(fontSize: 16,),),
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      );
    });
  }

  void _navigator() {
    if(_radioVal?.matchAsPrefix("Link D-ID to New Services")!= null){
      print("link pe jaao");
    }
    if(_radioVal?.matchAsPrefix("Create New D-ID")!= null){
      print("new pe jaao");
    }else {
      print("please select");
    }
    // Navigator.of(context).push(
    //     MaterialPageRoute(builder:
    //         (context)=> RegisterCustomer("")
    // )
    // );
  }
}