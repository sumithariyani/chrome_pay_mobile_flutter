import 'package:chrome_pay_mobile_flutter/Activity/moreservices..dart';
import 'package:flutter/material.dart';

class AgencyBanking2 extends StatefulWidget{
  String image = "";
  String name = "";

  AgencyBanking2(this.image, this.name);

  @override
  _AgencyBankingState createState() => _AgencyBankingState();

}

class _AgencyBankingState extends State<AgencyBanking2>{

var images = ['images/icons-06.png', 'images/icons-05.png', 'images/icons-07.png',
  'images/icons-04.png', 'images/icons-03.png', 'images/icons-02.png'];

var names =  ['Profile', 'Transfer', 'Micro Loans', 'Bills', 'Airtime', 'Cash In/\nCash Out'];

var backgroundImages = ["images/icons-17.png", "images/icons-19.png", "images/icons-18.png",
  "images/icons-16.png", "images/icons-14.png", "images/icons-15.png"];

@override
Widget build(BuildContext context) {
  return Scaffold(
    body:  Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
          child: Container(
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
                Container(
                  margin: EdgeInsets.only(left: 10.0),
                  child: Card(
                    margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
                    elevation: 10,
                    color: Colors.transparent,
                    shadowColor: Colors.black,
                    child: InkWell(
                      highlightColor: Colors.transparent,
                      onTap: () {
                        // Navigator.of(context).push(MaterialPageRoute(
                        //   builder: (context) => RegisterCustomer("",""),
                        // ));
                        // _dialog();
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
                          Container(
                          margin: EdgeInsets.only(left: 20.0, right: 10.0, top: 10.0),
                          child: CircleAvatar(
                            backgroundColor: Colors.black,
                            backgroundImage: AssetImage("images/all_dids_06.png"),
                            radius: 40,
                          ),
                          ),
                            Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          Container(
                                            child: Image.asset("images/icons-21.png",
                                            height: 20,),
                                          ),
                                          Container(
                                            margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                            child: Text(widget.name,
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  // foreground: Paint()..shader = linearGradient,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 16),
                                            ),
                                          ),
                                        ],
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.only(top: 8.0),
                                        child: Column(
                                          children: [
                                            Row(
                                              children: [
                                                Container(
                                                  child: Image.asset("images/icons-20.png",
                                                    height: 20,),
                                                ),
                                                Container(
                                                  margin: EdgeInsets.fromLTRB(5, 0, 0, 0),
                                                  child: Text('Chromepay Wallet Balance',
                                                    style: TextStyle(
                                                        fontSize: 12),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Container(
                                              margin: EdgeInsets.only(top: 8.0),
                                              alignment: Alignment.bottomCenter,
                                              child: Text("456.00",
                                                textAlign: TextAlign.center,
                                              style: TextStyle(
                                                fontFamily: "OpensansSemiBold"
                                              ),),
                                            ),
                                            Container(
                                              child: Text("Available Balance"),
                                            )
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                GridView.builder(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 10.0),
                  itemCount: images.length,
                  physics: NeverScrollableScrollPhysics(),
                  itemBuilder: (context, index) {
                    return Container(
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
                                  scale: 1.0),
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
                              // Navigator.push(context, MaterialPageRoute(
                              //     builder: (context) => routes[index]));
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: 5.0),
                                  width: 30,
                                  height: 30,
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
                                        height: 20,),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Container(
                                    margin: EdgeInsets.only(left: 10.0, right: 5.0, bottom: 10.0),
                                    alignment: Alignment.centerLeft,
                                    child: Text(names[index],
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            fontSize: 16,
                                            fontFamily: "OpensansRegular",
                                            color: Colors.white)),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    );
                  },
                ),
                 Container(
                    alignment: Alignment.bottomCenter,
                    child: Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.fromLTRB(30, 10, 30, 30),
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(10.0)),
                              gradient: LinearGradient(colors: [
                                Color(0xff0B527E),
                                Color(0xff2CABBB),
                              ],begin: Alignment.centerLeft,end: Alignment.centerRight)
                          ),
                          child: ButtonTheme(
                            minWidth: 400,
                            height: 60,
                            child: MaterialButton(
                              onPressed: () {
                                Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (context) => MoreService()
                                    )
                                );
                              },
                              textColor: Colors.white,
                              child: const Padding(
                                padding: EdgeInsets.all(10.0),
                                child: const Text('More Services', style: const TextStyle(fontSize: 18,),),
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

      ),
    ),
  );
}

}