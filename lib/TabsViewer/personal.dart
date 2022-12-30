import 'package:chrome_pay_mobile_flutter/Models/Cust%20dash%20Model.dart';
import 'package:chrome_pay_mobile_flutter/Services/Services.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';


class Personal extends StatefulWidget {
  String id = "";
  Personal(this.id);

  @override
  _personalState createState ()=> _personalState(id);

}

class _personalState extends State<Personal> {

  String id;
  _personalState(this.id);
  late CustDetailModel custDetailModel;
  Future<void> getCustomer() async {
    custDetailModel = await Services.GetCustDetail(id);

    if(custDetailModel.status!){
      Fluttertoast.showToast(msg: "Login successfully",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER);
    }
  }

  @override
  Widget build(BuildContext context) {
   return Scaffold(
     resizeToAvoidBottomInset: false,
     body: Container(
         width: MediaQuery.of(context).size.width,
         height: MediaQuery.of(context).size.height,
         margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
         color: Colors.transparent,
             child: SingleChildScrollView(
               child: Container(
                 margin: EdgeInsets.all(10.0),
                 color: Colors.transparent,
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.start,
                   crossAxisAlignment: CrossAxisAlignment.start,
                   children: [
                     Card(
                       elevation: 10,
                       color: Colors.transparent,
                       shadowColor: Colors.black,
                       child: Container(
                         width: MediaQuery.of(context).size.width,
                         height: 150,
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.all(Radius.circular(10.0)),
                           color: Color(0xff2497ad)
                         ),
                         child: Row(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           mainAxisAlignment: MainAxisAlignment.start,
                           children: [
                             Container(
                               alignment: AlignmentDirectional.center,
                               margin: EdgeInsets.only(left: 20.0, right: 10.0),
                               child: CircleAvatar(
                                 radius: 50,
                                  child: Image.asset('images/login_new_10.png',),
                               ),
                             ),
                             Expanded(
                                 child: Container(
                                   child: Column(
                                     crossAxisAlignment: CrossAxisAlignment.start,
                                     mainAxisAlignment: MainAxisAlignment.center,
                                     children: [
                                       Container(
                                         // margin: EdgeInsets.only(top: 30),
                                         child: Text('Rachel Berk',
                                         style: TextStyle(fontWeight: FontWeight.bold,
                                         fontSize: 20,
                                         color: Colors.white),),
                                       ),
                                       Row(
                                         children: [
                                           Image.asset('images/home_page_icon_20.png',
                                           height: 10,),
                                           Text('+919009474569',
                                             style: TextStyle(
                                                 fontSize: 12,
                                                 color: Colors.white),),
                                         ],
                                       ),
                                       Container(
                                         width: 150,
                                         height: 30,
                                         margin: EdgeInsets.only(top: 5.0),
                                         decoration: BoxDecoration(
                                           borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                           color: Colors.white,
                                         ),
                                         child: Row(
                                           crossAxisAlignment: CrossAxisAlignment.start,
                                           mainAxisAlignment: MainAxisAlignment.center,
                                           children: [
                                             Container(
                                                 margin: EdgeInsets.only(top: 10.0),
                                                 child: Text('D-ID Ref :',
                                                   style: TextStyle(
                                                       fontSize: 12,
                                                       color: Color(0xff98A6F4)),)
                                             ),
                                             Container(
                                                 margin: EdgeInsets.only(top: 10.0),
                                                 child: Text('#######655',
                                                   style: TextStyle(
                                                       fontSize: 12,
                                                       color: Color(0xff98A6F4)),)
                                             )
                                           ],
                                         ),
                                       ),
                                     ],
                                   ),
                                 ))
                           ],
                         ),
                       ),
                     ),
                     Card(
                       elevation: 5,
                       color: Colors.white,
                       shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.all(Radius.circular(10.0))
                       ),
                       margin: EdgeInsets.only(top: 20.0),
                       child: Container(
                         child: Column(
                           crossAxisAlignment: CrossAxisAlignment.start,
                           mainAxisAlignment: MainAxisAlignment.start,
                           children: [
                             Card(
                               elevation: 10,
                               color: Colors.white,
                               shape: RoundedRectangleBorder(
                                   borderRadius: BorderRadius.all(Radius.circular(10.0))
                               ),
                               margin: EdgeInsets.only(top: 20.0, bottom: 10.0, left: 10.0, right: 10.0),
                               child: Container(
                                 height: 60,
                                 margin: EdgeInsets.symmetric(horizontal: 10.0),
                                 child: Row(
                                   children: [
                                     Container(
                                       margin: EdgeInsets.symmetric(vertical: 10.0),
                                       child: Image.asset('images/home_page_icon_21.png',
                                       ),
                                     ),
                                     Container(
                                       margin: EdgeInsets.symmetric(horizontal: 10.0),
                                       child: Text('Fingerprint'
                                       ),
                                     )
                                   ],
                                 ),
                               ),
                             ),
                             Card(
                               elevation: 10,
                               color: Colors.white,
                               shape: RoundedRectangleBorder(
                                   borderRadius: BorderRadius.all(Radius.circular(10.0))
                               ),
                               margin: EdgeInsets.only(top: 10.0, bottom: 10.0, left: 10.0, right: 10.0),
                               child: Container(
                                 height: 60,
                                 margin: EdgeInsets.symmetric(horizontal: 10.0),
                                 child: Row(
                                   children: [
                                     Container(
                                       margin: EdgeInsets.symmetric(vertical: 10.0),
                                       child: Image.asset('images/icons_16.png',
                                       ),
                                     ),
                                     Container(
                                       margin: EdgeInsets.symmetric(horizontal: 10.0),
                                       child: Text('Facial Identification'
                                       ),
                                     )
                                   ],
                                 ),
                               ),
                             ),
                             Card(
                               elevation: 10,
                               color: Colors.white,
                               shape: RoundedRectangleBorder(
                                   borderRadius: BorderRadius.all(Radius.circular(10.0))
                               ),
                               margin: EdgeInsets.only(top: 10.0, bottom: 10.0, left: 10.0, right: 10.0),
                               child: Container(
                                 height: 60,
                                 margin: EdgeInsets.symmetric(horizontal: 10.0),
                                 child: Row(
                                   children: [
                                     Container(
                                       margin: EdgeInsets.symmetric(vertical: 10.0),
                                       child: Image.asset('images/address__1_.png',
                                       ),
                                     ),
                                     Container(
                                       margin: EdgeInsets.symmetric(horizontal: 10.0),
                                       child: Text('Location'
                                       ),
                                     )
                                   ],
                                 ),
                               ),
                             ),
                             Container(
                               margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0),
                               child: Column(
                                 children: [
                                   Container(
                                     margin: EdgeInsets.symmetric(vertical: 10.0),
                                     child: Row(
                                       children: [
                                         Expanded(
                                           child: Container(
                                             child: Text('Date of Birth',
                                             style: TextStyle(
                                                 color: Color(0xff98A6F4)
                                             ),),
                                           ),
                                         ),
                                         Expanded(
                                           child: Container(
                                             child: Text('14-06-1999',),
                                           ),
                                         )
                                       ],
                                     ),
                                   ),
                                   Container(
                                     margin: EdgeInsets.symmetric(vertical: 10.0),
                                     child: Row(
                                       children: [
                                         Expanded(
                                           child: Container(
                                             child: Text('Profession',
                                             style: TextStyle(
                                                 color: Color(0xff98A6F4)
                                             ),),
                                           ),
                                         ),
                                         Expanded(
                                           child: Container(
                                             child: Text('Student',),
                                           ),
                                         )
                                       ],
                                     ),
                                   ),
                                   Container(
                                     margin: EdgeInsets.symmetric(vertical: 10.0),
                                     child: Row(
                                       children: [
                                         Expanded(
                                           child: Container(
                                             child: Text('Gender',
                                             style: TextStyle(
                                                 color: Color(0xff98A6F4)
                                             ),),
                                           ),
                                         ),
                                         Expanded(
                                             child: Container(
                                           child: Text('Female',),
                                         )),

                                       ],
                                     ),
                                   ),
                                   Container(
                                     margin: EdgeInsets.symmetric(vertical: 10.0),
                                     child: Row(
                                       children: [
                                         Expanded(
                                           child: Container(
                                             child: Text('Next of Kin(Name)',
                                             style: TextStyle(
                                                 color: Color(0xff98A6F4)
                                             ),),
                                           ),
                                         ),
                                         Expanded(
                                           child: Container(
                                             child: Text('Daniela Saunyama',),
                                           ),
                                         )
                                       ],
                                     ),
                                   ),
                                   Container(
                                     margin: EdgeInsets.symmetric(vertical: 10.0),
                                     child: Row(
                                       children: [
                                         Expanded(
                                           child: Container(
                                           child: Text('Next of Kin(Phone No.)',
                                             style: TextStyle(
                                                 color: Color(0xff98A6F4)
                                             ),
                                           ),
                                         ),
                                         ),
                                         Expanded(
                                           child: Container(
                                             child: Text('5848744167',),
                                           ),
                                         )
                                       ],
                                     ),
                                   ),
                                   Container(
                                     margin: EdgeInsets.symmetric(vertical: 10.0),
                                     child: Row(
                                       children: [
                                         Expanded(
                                           child: Container(
                                             child: Text('Nationality',
                                             style: TextStyle(
                                                 color: Color(0xff98A6F4)
                                             ),),
                                           ),
                                         ),
                                         Expanded(
                                           child: Container(
                                             child: Text('Israeli',),
                                           ),
                                         )
                                       ],
                                     ),
                                   ),
                                   Container(
                                     margin: EdgeInsets.symmetric(vertical: 10.0),
                                     child: Row(
                                       children: [
                                         Expanded(
                                             child: Container(
                                           child: Text('Address',
                                             style: TextStyle(
                                                 color: Color(0xff98A6F4)
                                             ),),
                                         )
                                         ),
                                         Expanded(
                                           child: Container(
                                             child: Text('Sydney NAW 2025 Australia',),
                                           ),
                                         )
                                       ],
                                     ),
                                   ),
                                   Container(
                                     margin: EdgeInsets.symmetric(vertical: 10.0),
                                     child: Row(
                                       children: [
                                         Expanded(
                                             child: Card(
                                               elevation: 5,
                                               color: Color(0xff234e67),
                                               shape: RoundedRectangleBorder(
                                                   borderRadius: BorderRadius.all(Radius.circular(10.0))
                                               ),
                                               margin: EdgeInsets.only(top: 10.0, bottom: 10.0, left: 0.0, right: 5.0),
                                               child: Container(
                                                 height: 50,
                                                 margin: EdgeInsets.symmetric(horizontal: 10.0),
                                                 child: Row(
                                                   children: [
                                                     Container(
                                                       margin: EdgeInsets.symmetric(vertical: 10.0),
                                                       child: Image.asset('images/home_page_icon_24.png',
                                                       ),
                                                     ),
                                                     Container(
                                                       margin: EdgeInsets.symmetric(horizontal: 10.0),
                                                       child: Text('National Id',
                                                         style: TextStyle(color: Colors.white),
                                                       ),
                                                     )
                                                   ],
                                                 ),
                                               ),
                                             ),
                                         ),
                                         Expanded(
                                           child:Card(
                                             elevation: 5,
                                             color: Color(0xff234e67),
                                             shape: RoundedRectangleBorder(
                                                 borderRadius: BorderRadius.all(Radius.circular(10.0))
                                             ),
                                             margin: EdgeInsets.only(top: 10.0, bottom: 10.0, left: 5.0, right: 0.0),
                                             child: Container(
                                               height: 50,
                                               margin: EdgeInsets.symmetric(horizontal: 10.0),
                                               child: Row(
                                                 children: [
                                                   Container(
                                                     margin: EdgeInsets.symmetric(vertical: 10.0),
                                                     child: Image.asset('images/home_page_icon_25.png',
                                                     ),
                                                   ),
                                                   Container(
                                                     margin: EdgeInsets.symmetric(horizontal: 10.0),
                                                     child: Text('Proof of \n Residence',
                                                       style: TextStyle(color: Colors.white),
                                                     ),
                                                   )
                                                 ],
                                               ),
                                             ),
                                           ),
                                         )
                                       ],
                                     ),
                                   )
                                 ],
                               ),
                             )
                           ],
                         ),
                       ),
                     ),
                   ],
                 ),
               ),
             )

       ),
   );
  }

}