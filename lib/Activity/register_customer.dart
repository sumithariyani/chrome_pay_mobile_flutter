import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'address.dart';

class RegisterCustomer extends StatefulWidget{
  @override
  _RegisterCustomerState createState() => _RegisterCustomerState();

}

class _RegisterCustomerState extends State <RegisterCustomer>{

  TextEditingController fullName = TextEditingController();
  TextEditingController mobileNumber = TextEditingController();
  TextEditingController day = TextEditingController();
  TextEditingController month = TextEditingController();
  TextEditingController year = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController profession = TextEditingController();
  TextEditingController nameKin = TextEditingController();
  TextEditingController numberKin = TextEditingController();

  List<String> countryCodes = ['+972', '+251', '+91', '+1'];
  String? selectedCode = '+972';
  List<String> nationality = ['Ethiopian', 'Israeli', 'Indian', 'American'];
  String? selectedNationality = 'Ethiopian';
  int _radioSelected = 0;
  String? _radioVal;
  DateTime? datePicked;

  @override
  Widget build(BuildContext context) {
   return MaterialApp(
     debugShowCheckedModeBanner: false,
     home: Scaffold(
       resizeToAvoidBottomInset: false,
       body: Stack(
         children: <Widget>[
           Container(
             alignment: Alignment.topRight,
             child: Image.asset('images/login_stuff_31.png',
               height: 200,
               width: 150,
             ),
           ),
           Container(
             alignment: Alignment.topRight,
             margin: const EdgeInsets.fromLTRB(10, 40, 10, 0),
             child: const Text('1/3',
               style: const TextStyle(
                   fontSize: 18,
                   fontWeight: FontWeight.bold
               ),),
           ),
           Container(
             width: MediaQuery.of(context).size.width,
             height: MediaQuery.of(context).size.height,
             child: Container(
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.start,
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Container(
                     child: Row(
                       crossAxisAlignment: CrossAxisAlignment.start,
                       mainAxisAlignment: MainAxisAlignment.start,
                       children: [
                         Container(
                           margin: const EdgeInsets.fromLTRB(10, 30, 0, 0),
                           child: Image.asset('images/login_stuff_03.png',
                           height: 20,),
                         ),
                         Container(
                           margin: const EdgeInsets.fromLTRB(10, 30, 0, 0),
                           child: const Text('Register Customer',
                           style: TextStyle(
                             fontSize: 18,
                             fontWeight: FontWeight.bold
                           ),),
                         ),
                       ],
                     ),
                   ),
                   Expanded(
                     child: Container(
                       width: MediaQuery.of(context).size.width,
                       child: Card(
                         margin: const EdgeInsets.fromLTRB(10, 40, 10, 10),
                         elevation: 10,
                         shape: RoundedRectangleBorder(
                           borderRadius: BorderRadius.all(Radius.circular(10.0))
                         ),
                         color: Colors.white,
                         shadowColor: Colors.black,
                         child: SingleChildScrollView(
                           child: Container(
                             child: Column(
                               mainAxisAlignment: MainAxisAlignment.start,
                               crossAxisAlignment: CrossAxisAlignment.start,
                               children: [
                                 Container(
                                        alignment: Alignment.center,
                                        margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),

                                        child: PhysicalModel(color: Colors.transparent,
                                          child: InkWell(
                                            onTap: (){
                                              Fluttertoast.showToast(
                                                  msg: 'Coming Soon',
                                                  toastLength: Toast.LENGTH_SHORT,
                                                  gravity: ToastGravity.CENTER);

                                            },
                                              child: Image.asset('images/login_new_10.png',
                                                height: 70,)
                                          ),
                                        ),

                                      ),
                                 Container(
                                     alignment: Alignment.center,
                                     margin: const EdgeInsets.fromLTRB(0, 10, 0, 0),
                                     child: const Text('Facial Scan',
                                     style: TextStyle(
                                       fontSize: 14,
                                     ),)
                                   ),
                                 Container(
                                   margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
                                     child: Column(
                                       children: [
                                         Container(
                                           child: TextField(
                                             controller: fullName,
                                             keyboardType: TextInputType.text,
                                             decoration: InputDecoration(
                                               counterText: "",
                                               prefixIcon: Container(
                                                 padding: EdgeInsets.all(5.0),
                                                 margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                                                 child: Image.asset('images/login_stuff_17.png',
                                                 height: 2.0,
                                                 width: 2.0,),
                                               ),
                                               hintText: 'Full Name',
                                             ),
                                             style: const TextStyle(fontSize: 18.0),
                                           ),
                                         ),
                                         Container(
                                           decoration: BoxDecoration(
                                               border: Border(
                                                   bottom: BorderSide(
                                                       color: Colors.grey
                                                   )
                                               )
                                           ),
                                           margin: const EdgeInsets.only(top: 10.0),
                                           child: Row(
                                             children: [
                                               Container(
                                                 margin: const EdgeInsets.fromLTRB(10, 10, 10, 5),
                                                 child: Image.asset('images/login_stuff_18.png',
                                                 height: 20,
                                                 width: 20,),
                                               ),
                                               Container(
                                                 width: 60,
                                                   child: DropdownButtonFormField<String>(
                                                     decoration: InputDecoration(
                                                       border: InputBorder.none
                                                     ),
                                                     value: selectedCode,
                                                     items: countryCodes.
                                                     map((item) => DropdownMenuItem<String>(
                                                       value: item,
                                                         child: Text(item, style: const TextStyle(fontSize: 15),)
                                                     ))
                                                         .toList(),
                                                     onChanged: (item) => setState(() => selectedCode = item),
                                                   ),
                                                 ),
                                               Expanded(
                                                 child: Container(
                                                   margin: EdgeInsets.symmetric(horizontal: 5.0),
                                                   child: TextField(
                                                     controller: mobileNumber,
                                                     keyboardType: TextInputType.phone,
                                                     maxLength: 10,
                                                     decoration: const InputDecoration(
                                                       counterText: "",
                                                       hintText: 'Mobile Number',
                                                       border: InputBorder.none
                                                     ),
                                                     style: const TextStyle(fontSize: 18.0),
                                                   ),
                                                 ),
                                               )
                                             ],
                                           ),
                                         ),
                                         Container(
                                           alignment: Alignment.centerLeft,
                                           margin: const EdgeInsets.fromLTRB(10, 10, 0, 0),
                                           child: const Text('Date of birth :',
                                             style: TextStyle(
                                                 fontSize: 18,
                                                 fontWeight: FontWeight.bold
                                             ),),
                                         ),
                                         Row(
                                           children: [
                                             Container(
                                               height: 30,
                                               width: 50,
                                               margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                                               child: TextField(
                                                 onTap: () async{
                                                   datePicked = await showDatePicker(
                                                       context: context,
                                                       initialDate: DateTime.now(),
                                                       firstDate: DateTime(1950),
                                                       lastDate: DateTime.now());
                                                   if(datePicked != null){
                                                     print('Date Selecte : ${datePicked?.day}-${datePicked?.month}-${datePicked?.year}');
                                                   }
                                                 },
                                                 controller: day,
                                                 textAlign: TextAlign.center,
                                                 keyboardType: TextInputType.number,
                                                 decoration: InputDecoration(
                                                   border: OutlineInputBorder(
                                                     borderSide: BorderSide(
                                                       color: Colors.black,
                                                       width: 5.0)
                                                   ),
                                                   hintText: 'DD',
                                                 ),
                                                 style: TextStyle(fontSize: 12.0
                                                 ),
                                                   inputFormatters: [
                                                     new LengthLimitingTextInputFormatter(2)
                                                   ]

                                               ),
                                             ),
                                             Container(
                                               height: 30,
                                               width: 50,
                                               decoration: BoxDecoration(),
                                               margin: const EdgeInsets.only(top: 10.0),
                                               child: TextField(
                                                 controller: month,
                                                 textAlign: TextAlign.center,
                                                 keyboardType: TextInputType.number,
                                                 decoration: InputDecoration(
                                                   border: OutlineInputBorder(
                                                       borderSide: BorderSide(
                                                           color: Colors.black,
                                                           width: 5.0)
                                                   ),
                                                   counterText: "",
                                                   hintText: 'MM',
                                                 ),
                                                 style: TextStyle(fontSize: 12.0),
                                                   inputFormatters: [
                                                     new LengthLimitingTextInputFormatter(2)
                                                   ]

                                               ),
                                             ),
                                             Container(
                                               height: 30,
                                               width: 60,
                                               margin: const EdgeInsets.fromLTRB(10, 10, 10, 0),
                                               child: TextField(
                                                 controller: year,
                                                 textAlign: TextAlign.center,
                                                 keyboardType: TextInputType.number,
                                                 decoration: InputDecoration(
                                                   border: OutlineInputBorder(
                                                       borderSide: BorderSide(
                                                           color: Colors.black,
                                                           width: 5.0)
                                                   ),
                                                   counterText: "",
                                                   hintText: 'YYYY',
                                                 ),
                                                 style: TextStyle(fontSize: 12.0),
                                                   inputFormatters: [
                                                     new LengthLimitingTextInputFormatter(4)
                                                   ]

                                               ),
                                             )
                                           ],
                                         ),

                                         Container(
                                           margin: const EdgeInsets.fromLTRB(5, 15, 0, 0),
                                           child: Row(
                                             crossAxisAlignment: CrossAxisAlignment.center,
                                             children: [
                                               Container(
                                                 alignment: Alignment.centerLeft,
                                                 child: const Text('Gender :',
                                                   style: TextStyle(
                                                       fontSize: 18,
                                                       fontWeight: FontWeight.bold
                                                   ),),
                                               ),
                                               Radio(
                                                 activeColor: Colors.greenAccent,
                                                   value: 1,
                                                   groupValue: _radioSelected,
                                                   onChanged: (value) {
                                                     setState((){
                                                       _radioSelected = value as int;
                                                       _radioVal = 'male';
                                                     });
                                                   },),
                                               Text('Male'),
                                               Radio(
                                                   activeColor: Colors.greenAccent,
                                                   value: 2,
                                                   groupValue: _radioSelected,
                                                   onChanged: (value) {
                                                     setState((){
                                                       _radioVal = 'female';
                                                       _radioSelected = value as int;
                                                     });
                                                   }),
                                               Text('Female')
                                             ],
                                           ),
                                         ),
                                         Container(
                                           alignment: Alignment.centerLeft,
                                           margin: const EdgeInsets.fromLTRB(5, 15, 0, 0),
                                           child: const Text('Other Information',
                                             style: TextStyle(
                                                 fontSize: 18,
                                                 fontWeight: FontWeight.bold
                                             ),),
                                         ),
                                         Container(
                                           margin: EdgeInsets.only(top: 10.0),
                                           child: TextField(
                                             controller: email,
                                             keyboardType: TextInputType.text,
                                             decoration: InputDecoration(
                                               counterText: "",
                                               prefixIcon: Container(
                                                 padding: EdgeInsets.all(5.0),
                                                 margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                                                 child: Image.asset('images/login_stuff_04.png',
                                                   height: 2.0,
                                                   width: 2.0,),
                                               ),
                                               hintText: 'Email',
                                             ),
                                             style: const TextStyle(fontSize: 18.0),
                                           ),
                                         ),
                                         Container(
                                           decoration: BoxDecoration(
                                             border: Border(
                                               bottom: BorderSide(
                                                 color: Colors.grey
                                               )
                                             )
                                           ),
                                           width: MediaQuery.of(context).size.width,
                                           margin: const EdgeInsets.only(top: 10.0),
                                           child: Row(
                                             children: [
                                               Container(
                                                 margin: const EdgeInsets.fromLTRB(10, 10, 10, 5),
                                                 child: Image.asset('images/login_stuff_20.png',
                                                   height: 20,
                                                   width: 20,),
                                               ),
                                               Expanded(
                                                 child: Container(
                                                   alignment: Alignment.center,
                                                   child: DropdownButtonFormField<String>(
                                                     decoration: InputDecoration(
                                                       border: InputBorder.none
                                                     ),
                                                     icon: Icon(Icons.keyboard_arrow_down),
                                                     value: selectedNationality,
                                                     items: nationality.
                                                     map((item) => DropdownMenuItem<String>(
                                                         value: item,
                                                         child: Text(item, style: const TextStyle(fontSize: 18),)
                                                     ))
                                                         .toList(),
                                                     onChanged: (item) => setState(() => selectedNationality = item),
                                                   ),
                                                 ),
                                               ),
                                             ],
                                           ),
                                         ),
                                         Container(
                                           child: TextField(
                                             controller: profession,
                                             keyboardType: TextInputType.text,
                                             decoration: InputDecoration(
                                               counterText: "",
                                               prefixIcon: Container(
                                                 padding: EdgeInsets.all(5.0),
                                                 margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                                                 child: Image.asset('images/login_stuff_21.png',
                                                   height: 2.0,
                                                   width: 2.0,),
                                               ),
                                               hintText: 'Profession',
                                             ),
                                             style: const TextStyle(fontSize: 18.0),
                                           ),
                                         ),
                                         Container(
                                           child: TextField(
                                             controller: nameKin,
                                             keyboardType: TextInputType.text,
                                             decoration: InputDecoration(
                                               counterText: "",
                                               prefixIcon: Container(
                                                 padding: EdgeInsets.all(5.0),
                                                 margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                                                 child: Image.asset('images/login_stuff_17.png',
                                                   height: 2.0,
                                                   width: 2.0,),
                                               ),
                                               hintText: 'Name of Kin (Name)',
                                             ),
                                             style: const TextStyle(fontSize: 18.0),
                                           ),
                                         ),
                                         Container(
                                           child: TextField(
                                             controller: nameKin,
                                             keyboardType: TextInputType.text,
                                             decoration: InputDecoration(
                                               counterText: "",
                                               prefixIcon: Container(
                                                 padding: EdgeInsets.all(8.0),
                                                 margin: const EdgeInsets.fromLTRB(10, 5, 10, 5),
                                                 child: Image.asset('images/login_stuff_23.png',
                                                   height: 2.0,
                                                   width: 2.0,),
                                               ),
                                               hintText: 'Number of Kin (Phone no.)',
                                             ),
                                             style: const TextStyle(fontSize: 18.0),
                                           ),
                                         )
                                       ],

                                     ),
                                 )
                               ],
                             ),
                           ),
                         ),
                       )
                     ),
                   ),
                   Container(
                     alignment: Alignment.bottomCenter,
                     margin: const EdgeInsets.fromLTRB(30, 20, 30, 10),
                     decoration: const BoxDecoration(
                         borderRadius: BorderRadius.all(Radius.circular(40.0)),
                         gradient: LinearGradient(colors: [
                           Color(0xff2CABBB),
                           Color(0xff0B527E),
                         ],begin: Alignment.topCenter,end: Alignment.bottomCenter)
                     ),
                     child: ButtonTheme(
                       minWidth: 400,
                       height: 50,
                       child: MaterialButton(
                         onPressed: () {
                           navigaterUser();
                         },
                         textColor: Colors.white,
                         child: const Padding(
                           padding: EdgeInsets.all(10.0),
                           child: const Text('Next', style: const TextStyle(fontSize: 18,),),
                         ),
                       ),
                     ),
                   )

                 ],
               ),
             ),
           )
         ],
       )
     ),
   );
  }

  void navigaterUser(){
    Navigator.of(context).push(MaterialPageRoute(builder: (context) => MapSample(),));
  }

}