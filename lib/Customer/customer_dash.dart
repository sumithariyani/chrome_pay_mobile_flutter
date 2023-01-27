import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../Activity/login.dart';


class CustomerDash extends StatefulWidget{
  @override
  _CustomerDashState createState() => _CustomerDashState();
}

class _CustomerDashState extends State<CustomerDash> {

  // List<Widget> routes = [Active_Did(), AwatingDid(), AgentCommission(), AgentPerformance(), AgencyBanking(), Setting()];
  var names =  ['Profile', 'Transfers', 'MicroLoans', 'Bills', 'Airtime', 'Cash in / Cash out'];
  var images = ['images/home_page_icon_08.png', 'images/home_page_icon_06.png', 'images/home_page_icon_03.png',
    'images/home_page_icon_04.png', 'images/home_page_icon_05.png', 'images/home_page_icon_06.png'];

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

  void LogoutMethod() async{
    prefs?.remove('ID');
    prefs?.remove('token');
    prefs?.remove('custislogin');
    prefs?.clear();
    // custPrefs?.remove('ID',);
    // custPrefs?.remove('orgID',);
    // custPrefs?.remove('token',);
    Fluttertoast.showToast(
        msg: "Logout successfully",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER);

    Navigator.pop(context);
    Navigator.push(context, MaterialPageRoute(builder: (context) => Login()),
    );
  }
  @override
  Widget build(BuildContext context) {
   return Scaffold(
     body: Container(
       width: MediaQuery.of(context).size.width,
       height: MediaQuery.of(context).size.height,
       child: SingleChildScrollView(
         child: Column(
           mainAxisAlignment: MainAxisAlignment.start,
           crossAxisAlignment: CrossAxisAlignment.start,
           children: [
             Row(
               children: [
                 Container(
                   margin: const EdgeInsets.fromLTRB(10, 30, 0, 0),
                   child: Text('Customer Dashboard',
                     style: TextStyle(
                         fontSize: 18,
                         fontWeight: FontWeight.bold
                     ),
                   ),
                 ),
                 Align(
                   alignment: Alignment.centerRight,
                   child: InkWell(
                     onTap: (){
                       LogoutMethod();
                     },
                     child: Container(
                       alignment: Alignment.centerRight,
                       child: Image.asset('images/power.png',
                         height: 30,
                         width: 30,
                         alignment: Alignment.centerRight,),
                     ),
                   ),
                 )
               ],
             ),
             Container(
               child: PhysicalModel(color: Colors.transparent,
                 child: InkWell(
                   onTap: () {
                     // Navigator.of(context).push(MaterialPageRoute(
                     //   builder: (context) => RegisterCustomer(),
                     // ));
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
                       height: 150,
                       child: Column(
                         crossAxisAlignment: CrossAxisAlignment.center,
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           Container(
                             child: Text("Chromepay wallet Balance",
                               style: TextStyle(color: Colors.white,
                               fontSize: 16.0),),
                           ),
                           Row(
                             crossAxisAlignment: CrossAxisAlignment.start,
                             mainAxisAlignment: MainAxisAlignment.center,
                             children: [
                               Container(
                                 child: Image.asset('images/coin.png'),
                               ),
                               Column(
                                 children: [
                                   Container(
                                     child: Text("458.00",
                                     style: TextStyle(color: Colors.white,
                                     fontSize: 16.0),),
                                   ),
                                   Container(
                                     child: Text("Available Balance",
                                     style: TextStyle(color: Colors.white,
                                     fontSize: 10.0),),
                                   ),
                                 ],
                               )
                             ],
                           )
                         ],
                       ),
                     ),
                   ),
                 ),

               ),
             ),
             SizedBox(
               height: 10,
             ),
             Container(
               child: ListView.builder(
                 itemBuilder: (context, index){
                   return    InkWell(
                       onTap: (){
                         // Navigator.push(context, MaterialPageRoute(
                         //     builder: (context) => routes[index]));
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
             // Stack(
             //   children: [
             //     Container(
             //       alignment: Alignment.bottomCenter,
             //       margin: EdgeInsets.fromLTRB(30, 0, 30, 40),
             //       decoration: const BoxDecoration(
             //           borderRadius: BorderRadius.all(Radius.circular(40.0)),
             //           gradient: LinearGradient(colors: [
             //             Color(0xff2CABBB),
             //             Color(0xff0B527E),
             //           ],begin: Alignment.topCenter,end: Alignment.bottomCenter)
             //       ),
             //       child: ButtonTheme(
             //         minWidth: 400,
             //         height: 50,
             //         child: MaterialButton(
             //           onPressed: () {
             //             // if(email.text.isEmpty){
             //             //   Fluttertoast.showToast(
             //             //       msg: "Enter Email",
             //             //       toastLength: Toast.LENGTH_SHORT,
             //             //       gravity: ToastGravity.BOTTOM);
             //             // }else if(password.text.isEmpty){
             //             //   Fluttertoast.showToast(
             //             //       msg: "Enter Password",
             //             //       toastLength: Toast.LENGTH_SHORT,
             //             //       gravity: ToastGravity.BOTTOM);
             //             // }else{
             //             //   LoginMethod(email.text, password.text);
             //             //   print("print"+email.text+password.text);
             //             // }
             //           },
             //           textColor: Colors.white,
             //           child: Padding(
             //             padding: const EdgeInsets.all(10.0),
             //             child: Text('More Services', style: TextStyle(fontSize: 18,),),
             //           ),
             //         ),
             //       ),
             //     ),
             //   ],
             // )
           ],
         ),
       ),
     )
   );
  }
}