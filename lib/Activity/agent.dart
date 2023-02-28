import 'dart:async';

import 'package:chrome_pay_mobile_flutter/Activity/documentscanner.dart';
import 'package:chrome_pay_mobile_flutter/Activity/register_customer.dart';
import 'package:chrome_pay_mobile_flutter/Activity/setting.dart';
import 'package:flutter/material.dart';

import 'address.dart';
import 'agencybanking.dart';
import 'agentcommission.dart';
import 'agentperformance.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'all-did.dart';
import 'awatingdid.dart';
import 'linked_services.dart';

class Agent extends StatefulWidget {

  @override
  _AgentDashBoard createState() => _AgentDashBoard();

}

class _AgentDashBoard extends State<Agent> {


  SharedPreferences? prefs;
  @override
  void initState() {
    super.initState();
    getAsync();
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
    bool? status = prefs?.getBool('agentislogin');
    print("agentStaus ${status}");
    final Shader linearGradient = LinearGradient(
      colors: <Color>[Color(0xff0B527E),
        Color(0xff2CABBB),],
    ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));
    List<Widget> routes = [Active_Did(), AwatingDid(), AgentCommission(), AgentPerformance(), AgencyBanking(), Setting()];
    var names =  ['Active\n D-ID`s', 'Pending Approval', 'Agent Commission', 'Agent Performance',
      'Agency\n Banking', 'Settings'];

    var images = ['images/Agency---06-16.png', 'images/Agency---06-17.png', 'images/Agency---06-15.png',
      'images/Agency---06-14.png', 'images/Agency---06-13.png', 'images/Agency---06-12.png'];

    var backgroundImages = ["images/Agency---06-06.png", "images/Agency---06-07.png", "images/Agency---06-08.png",
    "images/Agency---06-09.png", "images/Agency---06-11.png", "images/Agency---06-10.png"];

    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                  child:
                  SingleChildScrollView(
                      scrollDirection: Axis.vertical,
                      child:Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                           Row(
                              children: [
                                Container(
                                  margin: const EdgeInsets.fromLTRB(10, 40, 0, 0),
                                  child: Center(
                                    child: CircleAvatar(
                                      foregroundImage: NetworkImage(prefs!.getString("image").toString()),
                                      foregroundColor: Colors.black,
                                    ),
                                  ),
                                ),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Container(
                                      margin: const EdgeInsets.fromLTRB(10, 40, 0, 0),
                                      child: Text('Hello,',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold
                                        ),),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.fromLTRB(10, 0, 0, 0),
                                      child: Text(prefs!.getString("name").toString(),
                                        style: TextStyle(
                                          fontSize: 16,
                                        ),),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          Container(
                            child: PhysicalModel(color: Colors.transparent,
                                  child: Stack(
                                    children: <Widget>[
                                      Container(
                                        margin: EdgeInsets.only(left: 20.0),
                                        child: Card(
                                        margin: EdgeInsets.fromLTRB(30, 20, 10, 0),
                                        elevation: 10,
                                        color: Colors.transparent,
                                        shadowColor: Colors.black,
                                        child: InkWell(
                                          highlightColor: Colors.transparent,
                                          onTap: () {
                                            // Navigator.of(context).push(MaterialPageRoute(
                                            //   builder: (context) => RegisterCustomer("",""),
                                            // ));
                                            _dialog();
                                          },
                                          child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                                color: Colors.white
                                            ),
                                            width: MediaQuery.of(context).size.width,
                                            height: 150,
                                            child: Row(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Expanded(
                                                    flex: 10,
                                                    child: Container(
                                                      child: Column(
                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                        children: [
                                                          Container(
                                                            margin: EdgeInsets.fromLTRB(20, 10, 0, 0),
                                                            child: Text('Generate a Digital ID',
                                                                textAlign: TextAlign.center,
                                                                style: TextStyle(
                                                                    foreground: Paint()..shader = linearGradient,
                                                                    fontWeight: FontWeight.bold,
                                                                    fontSize: 16),
                                                            ),
                                                          ),
                                                          Container(
                                                            margin: EdgeInsets.fromLTRB(20, 0, 0, 0),
                                                            child: Text('for online verification purposes.',
                                                                style: TextStyle(
                                                                    fontSize: 12),
                                                            ),
                                                          ),
                                                          Container(
                                                            width: 120,
                                                            alignment: Alignment.center,
                                                            margin: const EdgeInsets.fromLTRB(50, 20, 30, 10),
                                                            decoration: const BoxDecoration(
                                                                borderRadius: BorderRadius.all(Radius.circular(40.0)),
                                                                gradient: LinearGradient(colors: [
                                                                  Color(0xff0B527E),
                                                                  Color(0xff2CABBB),
                                                                ],begin: Alignment.bottomLeft,end: Alignment.topRight)
                                                            ),
                                                            child:  Padding(
                                                              padding: const EdgeInsets.all(8.0),
                                                              child: Text('Create Digital ID', style: const TextStyle(fontSize: 12,
                                                              color: Colors.white),),
                                                            ),
                                                          )
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
                                      Card(
                                        margin: EdgeInsets.fromLTRB(20, 40, 0, 0),
                                        elevation: 10,
                                        color: Colors.transparent,
                                        shadowColor: Colors.black,
                                        child: Container(
                                            width: 90,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                                gradient: LinearGradient(colors: [
                                                  Color(0xff0B527E),
                                                  Color(0xff2CABBB),
                                                ],begin: Alignment.topLeft, end: Alignment.topRight)
                                            ),

                                            height: 100,
                                            alignment: Alignment.center,
                                            child: Image.asset("images/Agency-06.png",
                                            height: 70,)
                                        ),
                                      ),
                                    ]
                                  ),
                            ),
                          ),

                          SizedBox(
                            height: 10,
                          ),
                          Container(
                            child: GridView.builder(
                              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 5.0,
                                  mainAxisSpacing: 10.0),
                              itemBuilder: (context, index){
                                return  Container(
                                      child: Card(
                                        margin: EdgeInsets.fromLTRB(20, 0, 20, 20),
                                        elevation: 20,
                                        color: Colors.transparent,
                                        shadowColor: Colors.black,
                                          child: Container(
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.all(Radius.circular(10.0)),
                                                image: DecorationImage(
                                                  alignment: Alignment.center,
                                                    image: AssetImage(backgroundImages[index]),
                                                scale: 3.0),
                                                gradient: LinearGradient(colors: [
                                                  Color(0xff0B527E),
                                                  Color(0xff2CABBB),
                                                ],begin: Alignment.topLeft, end: Alignment.topRight)
                                            ),

                                            width: MediaQuery.of(context).size.width,
                                            height: 50,
                                            child: InkWell(
                                              highlightColor: Colors.transparent,
                                              onTap: (){
                                                Navigator.push(context, MaterialPageRoute(
                                                    builder: (context) => routes[index]));
                                              },
                                              child: Column(
                                                 mainAxisAlignment: MainAxisAlignment.start,
                                               crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Container(
                                                    margin: EdgeInsets.only(top: 10.0),
                                                    alignment: Alignment.topLeft,
                                                    decoration: BoxDecoration(
                                                        shape: BoxShape.circle,
                                                      color: Colors.transparent
                                                    ),
                                                    child: Container(
                                                      margin: EdgeInsets.only(left: 8.0),
                                                        decoration: BoxDecoration(
                                                          shape: BoxShape.circle,
                                                            color: Colors.white
                                                            // gradient: LinearGradient(colors: [
                                                            //   Color(0xff0B527E),
                                                            //   Color(0xff2CABBB),
                                                            // ],begin: Alignment.bottomLeft, end: Alignment.topRight)
                                                        ),
                                                        child: CircleAvatar(
                                                          backgroundColor: Colors.transparent,
                                                          child: Image.asset(images[index],
                                                            height: 30,),
                                                        ),
                                                      ),
                                                  ),
                                                  Spacer(),
                                                  Container(
                                                    margin: EdgeInsets.only(left: 10.0, right: 5.0, bottom: 10.0),
                                                    alignment: Alignment.bottomCenter,
                                                    child: Text(names[index],
                                                        textAlign: TextAlign.center,
                                                        style: TextStyle(
                                                          fontSize: 16,
                                                            fontFamily: "OpensansRegular",
                                                        color: Colors.white)),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                      ),
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
      );
  }

  void _dialog() async {
    showDialog(context: context,
        barrierDismissible: false,
       builder: (BuildContext dialogContext){
         return StatefulBuilder(builder: (dialogContext, setState) {
      return MyDialog();
    });
     });
  }

}

class MyDialog extends StatefulWidget {
  @override
  _MyDialogState createState() => new _MyDialogState();
}

class _MyDialogState extends State<MyDialog> {

  int _radioSelected = 0;
  String? _radioVal;

  final Shader linearGradient = LinearGradient(
    colors: <Color>[Color(0xff0B527E),
      Color(0xff2CABBB),],
  ).createShader(Rect.fromLTWH(0.0, 0.0, 200.0, 70.0));

  @override
  Widget build(BuildContext context) {

   return  Dialog(

     shape: RoundedRectangleBorder(
       borderRadius: BorderRadius.circular(10),
     ),
     elevation: 0.0,
     child: Container(
       width: MediaQuery.of(context).size.width,
       height: 300,
       decoration: const BoxDecoration(
         borderRadius: BorderRadius.all(
             Radius.circular(40.0)),
       ),
       child: Column(
         mainAxisAlignment: MainAxisAlignment.start,
         crossAxisAlignment: CrossAxisAlignment.start,
         children: [
           Container(
             decoration: BoxDecoration(
                 gradient: LinearGradient(colors: [
           Color(0xff0B527E),
         Color(0xff2CABBB),
         ],begin: Alignment.topLeft, end: Alignment.topRight),
               borderRadius: BorderRadius.only(
                 topLeft: Radius.circular(10.0), topRight: Radius.circular(10.0)
               )
             ),
             child: Padding(
               padding: const EdgeInsets.all(8.0),
               child: Row(
                 mainAxisAlignment: MainAxisAlignment.start,
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Container(
                     margin: EdgeInsets.only(left: 10.0, top: 10),
                     child: Text('Select one of them',
                       style: TextStyle(fontSize: 18,
                       color: Colors.white,
                       fontFamily: 'OpensansSemiBold'),
                       ),
                   ),
                   Expanded(
                     child: InkWell(
                       highlightColor: Colors.transparent,
                       splashColor: Colors.transparent,
                       onTap: () {
                         setState(() {
                           Navigator.of(context).pop();
                         });
                       },
                       child: Container(
                         alignment: Alignment.topRight,
                         padding: EdgeInsets.all(10.0),
                         child: Image.asset('images/popup-06.png',
                           width: 20,
                           height: 20,),
                       ),
                     ),
                   )
                 ],
               ),
             ),
           ),

           Spacer(),
           Column(
             children: [
               Card(
                 margin: EdgeInsets.fromLTRB(20, 0, 20, 20),
                 elevation: 10,
                 color: Colors.transparent,
                 shadowColor: Colors.black,
                 child: InkWell(
                   highlightColor: Colors.transparent,
                   splashColor: Colors.transparent,
                   onTap: (){
                     Navigator.of(context).pushReplacement(
                         MaterialPageRoute(builder:
                             (context)=>  RegisterCustomer("","")
                         )
                     );
                   },
                   child: Container(
                     decoration: BoxDecoration(
                         borderRadius: BorderRadius.all(Radius.circular(10.0)),
                         color: Colors.white
                     ),
                     width: MediaQuery.of(context).size.width,
                     height: 50,
                     child: Row(
                       children: [
                         Container(
                           margin: EdgeInsets.only(left: 8.0, top: 8.0, bottom: 8.0),
                           decoration: BoxDecoration(
                               shape: BoxShape.circle,
                               gradient: LinearGradient(colors: [
                                 Color(0xff0B527E),
                                 Color(0xff2CABBB),
                               ],begin: Alignment.bottomLeft, end: Alignment.topRight)
                           ),
                           child: CircleAvatar(
                             backgroundColor: Colors.transparent,
                             child: Image.asset("images/popup-04.png",
                               height: 20,),
                           ),
                         ),
                         Expanded(
                           child: Container(
                             margin: EdgeInsets.only(left: 10.0),
                             child: Text("Create New D-ID",
                               style: TextStyle(
                                   fontFamily: 'OpensansRegular',
                                   foreground: Paint()..shader = linearGradient),
                             ),
                           ),
                         )
                       ],
                     ),
                   ),
                 ),
               ),
               Card(
                 margin: EdgeInsets.fromLTRB(20, 0, 20, 20),
                 elevation: 10,
                 color: Colors.transparent,
                 shadowColor: Colors.black,
                 child: InkWell(
                   highlightColor: Colors.transparent,
                   splashColor: Colors.transparent,
                   onTap: (){
                     Navigator.of(context).pushReplacement(
                         MaterialPageRoute(builder:
                             (context)=>  LinkedServices("")
                         )
                     );
                   },
                   child: Container(
                     decoration: BoxDecoration(
                         borderRadius: BorderRadius.all(Radius.circular(10.0)),
                         color: Colors.white
                     ),
                     width: MediaQuery.of(context).size.width,
                     height: 50,
                     child: Row(
                       children: [
                         Container(
                           margin: EdgeInsets.only(left: 8.0, top: 8.0, bottom: 8.0),
                           decoration: BoxDecoration(
                               shape: BoxShape.circle,
                               gradient: LinearGradient(colors: [
                                 Color(0xff0B527E),
                                 Color(0xff2CABBB),
                               ],begin: Alignment.bottomLeft, end: Alignment.topRight)
                           ),
                           child: CircleAvatar(
                             backgroundColor: Colors.transparent,
                             child: Image.asset("images/popup-03.png",
                               height: 20,),
                           ),
                         ),
                         Expanded(
                           child: Container(
                             alignment: Alignment.center,
                             margin: EdgeInsets.only(left: 5.0),
                             child: Text("Link D-ID to New Services",
                               style: TextStyle(fontFamily: 'OpensansRegular',
                                   foreground: Paint()..shader = linearGradient),
                             ),
                           ),
                         )
                       ],
                     ),
                   ),
                 ),
               ),
             ],
           ),
           Spacer(),
         ],
       ),
     ),
   );
  }
}