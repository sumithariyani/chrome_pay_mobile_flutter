import 'package:flutter/material.dart';

class MoreService extends StatefulWidget {
  @override
  _MoreServiceState createState() => _MoreServiceState();

}

class _MoreServiceState extends State<MoreService> {

  var images = ['images/icons-09.png', 'images/icons-08.png', 'images/icons-02.png', 'images/icons-01.png'];

  var names =  ['Micro\n Insurance', 'Micro\n Pension', 'Remittance', 'Savings', ];

  var backgroundImages = ["images/icons-10.png", "images/icons-11.png", "images/icons-13.png", "images/icons-12.png"];

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     body: Container(
       width: MediaQuery.of(context).size.width,
       height: MediaQuery.of(context).size.height,
       child: Column(
         children: [
           Row(
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
                 child: Text('Agency Banking',
                   style: TextStyle(
                       fontSize: 18,
                       fontWeight: FontWeight.bold
                   ),
                 ),
               )
             ],
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
         ],
       ),
     ),
   );
  }

}