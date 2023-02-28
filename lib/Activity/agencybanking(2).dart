import 'package:flutter/material.dart';

class AgencyBanking2 extends StatefulWidget{
  @override
  _AgencyBankingState createState() => _AgencyBankingState();

}

class _AgencyBankingState extends State<AgencyBanking2>{

var images = ['images/agent_dashboard_stuff_03.png', 'images/agent_dashboard_stuff_08.png',
  'images/agent_dashboard_stuff_10.png', 'images/agent_dashboard_stuff_10.png', 'images/icon_12.png',
  'images/agent_dashboard_stuff_11.png'];
var names =  ['Active D-ID`s', 'Pending approval', 'Agent Commission', 'Agent Performance',
  'Agency Banking', 'Settings'];

@override
Widget build(BuildContext context) {
  return Scaffold(
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
              scrollDirection: Axis.vertical,
              child: Column(
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
                          child:  Container(
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
                          child: Text('Agecy Banking',
                            style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0),
                    itemCount: images.length,
                    itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Card(
                            color: Colors.transparent,
                            shadowColor: Colors.black,
                            elevation: 5,
                            child: Container(
                              width: MediaQuery.of(context).size.width,
                              height: 120,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  shape: BoxShape.rectangle,
                                  color: Colors.white
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Column(
                                      children: [
                                        Card(
                                          margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                          elevation: 8,
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(100.0)
                                          ),
                                          child: Container(
                                            width: 50,
                                            height: 50,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                                gradient: LinearGradient(colors: [
                                                  Color(0xff0B527E),
                                                  Color(0xff2CABBB),
                                                ],begin: Alignment.bottomLeft,end: Alignment.topRight)

                                            ),
                                            child: CircleAvatar(
                                              backgroundColor: Colors.transparent,
                                              child: Image.asset(images[index],
                                                height: 20,),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),

                                  Container(
                                    margin: EdgeInsets.only(top: 10.0),
                                    child: Text('Microloans',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w400
                                      ),),
                                  )
                                ],
                              ),
                            ),
                          ),
                        );
                    },
                  )
                ],
              ),
            ),
          ),
      ],
    )
  );
}

}