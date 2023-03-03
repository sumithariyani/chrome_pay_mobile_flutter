import 'package:chrome_pay_mobile_flutter/Activity/all-did.dart';
import 'package:chrome_pay_mobile_flutter/Models/Agent%20Profile%20Model.dart';
import 'package:chrome_pay_mobile_flutter/Models/Agent%20Update%20Model.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Services/Services.dart';

class EditProfile extends StatefulWidget {
  @override
 _EditProfileState createState () => _EditProfileState();

}

class _EditProfileState extends State<EditProfile>{

  TextEditingController fullName = TextEditingController();
  TextEditingController mobileNumber = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController citty = TextEditingController();
  TextEditingController coutry = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController postalcode = TextEditingController();

  late SharedPreferences prefs;

  AgentProfileModel? agentProfileModel;
  AgentUpdateModel? agentUpdateModel;

  Future<void> getAgent() async {
    prefs = await SharedPreferences.getInstance();
    agentProfileModel = await Services.UpdateAgentProfile(prefs.getString('token').toString());

    if(agentProfileModel?.status==true){
      print('ho0');
      fullName.text = "${agentProfileModel?.filter?.name}";
      mobileNumber.text = "${agentProfileModel?.filter?.phone}";
      email.text = "${agentProfileModel?.filter?.email}";
      address.text = "${agentProfileModel?.filter?.address}";
      citty.text = "${agentProfileModel?.filter?.city}";
      coutry.text = "${agentProfileModel?.filter?.country}";
      postalcode.text = "${agentProfileModel?.filter?.postCode}";
      print("personal ${agentProfileModel?.filter?.name}");
    }
    setState(() {
    });
  }

  Future<void> Update(String name, String phone, String email, String address, String city, String country, String postcode,) async {
    prefs = await SharedPreferences.getInstance();
    agentUpdateModel = await Services.AgentUpdate(prefs.getString('token').toString(), name , phone, email, address, country, city, postcode);

    if(agentUpdateModel?.status==true){
      print('ho0');
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => Active_Did()));
    }
    setState(() {
    });
  }
  @override
  void initState() {
    getAgent();
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
   return Scaffold(
       body: Container(
             width: MediaQuery.of(context).size.width,
             height: MediaQuery.of(context).size.height,
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
                       child: const Text('Edit Profile',
                         style: TextStyle(
                             fontSize: 18,
                             fontWeight: FontWeight.bold
                         ),),
                     ),
                   ],
                 ),
                 Expanded(
                     child: Container(
                      width: MediaQuery.of(context).size.width,
                       margin: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                        child: SingleChildScrollView(
                          child: Container(
                            margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                InkWell(
                                  onTap: (){
                                    Fluttertoast.showToast(msg: "Coming Soon");
                                  },
                                  child: Container(
                                    alignment: Alignment.center,
                                    margin: EdgeInsets.only(top: 5.0, bottom: 10.0),
                                    height: 70,
                                    decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.transparent
                                    ),
                                    child: Container(
                                      alignment: Alignment.center,
                                      margin: EdgeInsets.only(left: 8.0),
                                      decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          gradient: LinearGradient(colors: [
                                            Color(0xff0B527E),
                                            Color(0xff2CABBB),
                                          ],begin: Alignment.centerLeft, end: Alignment.centerRight)
                                      ),
                                      child: CircleAvatar(
                                        radius: 60,
                                        backgroundColor: Colors.transparent,
                                        child: Image.asset("images/new pages-06.png",
                                          height: 40,
                                          alignment: Alignment.center,),
                                      ),
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(bottom: 10.0),
                                  child: Text("Contact Info",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontFamily: "OpensansSemiBold"
                                  ),),
                                ),
                                Card(
                                  elevation: 5,
                                  color: Colors.white,
                                  shadowColor: Colors.white,
                                  child: Container(
                                    height: 60,
                                    margin: EdgeInsets.only(top: 5.0, left: 5.0),
                                    alignment: Alignment.center,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          alignment: Alignment.centerLeft,
                                          // margin: EdgeInsets.only(top: 5.0),
                                          child: Padding(
                                            padding: const EdgeInsets.all(0.0),
                                            child: Text('Full Name',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 10),),
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(0.0),
                                          child: TextFormField(
                                            controller: fullName,
                                            keyboardType: TextInputType
                                                .name,
                                            decoration: InputDecoration(
                                                border: InputBorder.none,
                                                counterText: "",
                                                hintText: "Full Name"
                                            ),
                                            style: TextStyle(fontSize: 16.0),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Card(
                                  elevation: 5,
                                  color: Colors.white,
                                  shadowColor: Colors.black,
                                  child: Container(
                                    height: 60,
                                    margin: EdgeInsets.only(top: 5.0, left: 5.0),
                                    alignment: Alignment.center,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          child: Text('Phone',
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 10),),
                                        ),
                                        TextFormField(
                                          controller: mobileNumber,
                                          maxLength: 10,
                                          keyboardType: TextInputType
                                              .phone,
                                          decoration: InputDecoration(
                                              border: InputBorder.none,
                                              counterText: "",
                                              hintText: "Mobile number"
                                          ),
                                          style: TextStyle(fontSize: 16.0),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Card(
                                  elevation: 5,
                                  color: Colors.white,
                                  shadowColor: Colors.black,
                                  child: Container(
                                    height: 60,
                                    margin: EdgeInsets.only(top: 5.0, left: 5.0),
                                    alignment: Alignment.center,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          child: Text('Email',
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 10),),
                                        ),
                                        TextFormField(
                                          controller: email,
                                          maxLength: 10,
                                          keyboardType: TextInputType
                                              .phone,
                                          decoration: InputDecoration(
                                              border: InputBorder.none,
                                              counterText: "",
                                              hintText: "Emil"
                                          ),
                                          style: TextStyle(fontSize: 16.0),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(bottom: 10.0, top: 15.0),
                                  child: Text("Address",
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontFamily: "OpensansSemiBold"
                                    ),),
                                ),
                                Card(
                                  elevation: 5,
                                  color: Colors.white,
                                  shadowColor: Colors.black,
                                  child: Container(
                                    height: 60,
                                    margin: EdgeInsets.only(top: 5.0, left: 5.0),
                                    alignment: Alignment.center,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          child: Text('Postal Code',
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 10),),
                                        ),
                                        TextFormField(
                                          controller: postalcode,
                                          maxLength: 10,
                                          keyboardType: TextInputType
                                              .phone,
                                          decoration: InputDecoration(
                                              border: InputBorder.none,
                                              counterText: "",
                                              hintText: "Postal Code"
                                          ),
                                          style: TextStyle(fontSize: 16.0),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Card(
                                  elevation: 5,
                                  color: Colors.white,
                                  shadowColor: Colors.black,
                                  child: Container(
                                    height: 60,
                                    margin: EdgeInsets.only(top: 5.0, left: 5.0),
                                    alignment: Alignment.center,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          child: Text('Address',
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 10),),
                                        ),
                                        TextFormField(
                                          controller: address,
                                          maxLength: 10,
                                          keyboardType: TextInputType
                                              .phone,
                                          decoration: InputDecoration(
                                              border: InputBorder.none,
                                              counterText: "",
                                              hintText: "Address"
                                          ),
                                          style: TextStyle(fontSize: 16.0),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Card(
                                  elevation: 5,
                                  color: Colors.white,
                                  shadowColor: Colors.black,
                                  child: Container(
                                    height: 60,
                                    margin: EdgeInsets.only(top: 5.0, left: 5.0),
                                    alignment: Alignment.center,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          child: Text('City',
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 10),),
                                        ),
                                        TextFormField(
                                          controller: citty,
                                          maxLength: 10,
                                          keyboardType: TextInputType
                                              .phone,
                                          decoration: InputDecoration(
                                              border: InputBorder.none,
                                              counterText: "",
                                              hintText: "City"
                                          ),
                                          style: TextStyle(fontSize: 16.0),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Card(
                                  elevation: 5,
                                  color: Colors.white,
                                  shadowColor: Colors.black,
                                  child: Container(
                                    height: 60,
                                    margin: EdgeInsets.only(top: 5.0, left: 5.0),
                                    alignment: Alignment.center,
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Container(
                                          child: Text('Country',
                                            style: TextStyle(
                                                color: Colors.grey,
                                                fontSize: 10),),
                                        ),
                                        TextFormField(
                                          controller: coutry,
                                          maxLength: 10,
                                          keyboardType: TextInputType
                                              .phone,
                                          decoration: InputDecoration(
                                              border: InputBorder.none,
                                              counterText: "",
                                              hintText: "Country"
                                          ),
                                          style: TextStyle(fontSize: 16.0),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),

                     )
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
                         Update(fullName.text, email.text, mobileNumber.text, coutry.text,
                             citty.text, address.text, postalcode.text);
                       },
                       textColor: Colors.white,
                       child: const Padding(
                         padding: EdgeInsets.all(10.0),
                         child: const Text('Update', style: const TextStyle(fontSize: 18,),),
                       ),
                     ),
                   ),
                 )

               ],
             ),
           )
   );
  }

}