import 'package:chrome_pay_mobile_flutter/Activity/customer%20profile.dart';
import 'package:chrome_pay_mobile_flutter/Activity/login.dart';
import 'package:chrome_pay_mobile_flutter/Activity/register_customer.dart';
import 'package:flutter/material.dart';

class Agent extends StatefulWidget {
  @override
  _AgentDashBoard createState() => _AgentDashBoard();

}

class _AgentDashBoard extends State<Agent> {
  @override
  Widget build(BuildContext context) {

    List<Widget> routes = [CustomerProfile()];
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
                                      builder: (context) => RegisterCustomer(),
                                    ));
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
                            height: 30,
                          ),
                          Container(
                            child: ListView.builder(
                              itemBuilder: (context, index){
                                InkWell(
                                  onTap: (){
                                    Navigator.push(context, MaterialPageRoute(
                                        builder: (context) => routes[1]));
                                  },
                                );
                                return  Container(
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
                                          Spacer(),
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

}