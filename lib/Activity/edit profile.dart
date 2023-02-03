import 'package:chrome_pay_mobile_flutter/Models/Agent%20Profile%20Model.dart';
import 'package:chrome_pay_mobile_flutter/Models/Agent%20Update%20Model.dart';
import 'package:flutter/material.dart';
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
                         margin: const EdgeInsets.fromLTRB(15, 40, 0, 0),
                         child: Image.asset('images/login_stuff_03.png',
                           height: 20,
                         ),
                       ),
                     ),
                     Container(
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
                      child: Card(
                        margin: const EdgeInsets.fromLTRB(10, 40, 10, 10),
                        elevation: 10.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10.0))
                        ),
                        color: Colors.white,
                        shadowColor: Colors.black,
                        child: SingleChildScrollView(
                          child: Container(
                            margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: 5.0),
                                  child: Text('Full Name',
                                  style: TextStyle(
                                      color: Colors.grey,
                                  fontSize: 15),),
                                ),
                                Container(
                                  height: 50,
                                  margin: EdgeInsets.only(top: 5.0),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                    color: const Color(0x0ff5f8fa)
                                  ),
                                  child: TextField(
                                    controller: fullName,
                                    keyboardType: TextInputType.name,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius: BorderRadius.circular(10.0)
                                      ),
                                      counterText: "",
                                      hintText: "${agentProfileModel?.filter?.name}"
                                    ),
                                    style: TextStyle(fontSize: 18.0),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 10.0),
                                  child: Text('Phone',
                                  style: TextStyle(
                                      color: Colors.grey,
                                  fontSize: 15),),
                                ),
                                Container(
                                  height: 50,
                                  margin: EdgeInsets.only(top: 5.0),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                    color: Color(0xff5f8fa)
                                  ),
                                  child: TextField(
                                    controller: mobileNumber,
                                    keyboardType: TextInputType.phone,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius: BorderRadius.circular(10.0)
                                      ),
                                      counterText: "",
                                      hintText: "${agentProfileModel?.filter?.phone}"
                                    ),
                                    style: TextStyle(fontSize: 18.0),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 10.0),
                                  child: Text('Email',
                                  style: TextStyle(
                                      color: Colors.grey,
                                  fontSize: 15),),
                                ),
                                Container(
                                  height: 50,
                                  margin: EdgeInsets.only(top: 5.0),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                    color: Color(0xff5f8fa)
                                  ),
                                  child: TextField(
                                    controller: email,
                                    keyboardType: TextInputType.emailAddress,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius: BorderRadius.circular(10.0)
                                      ),
                                      counterText: "",
                                      hintText: "${agentProfileModel?.filter?.email}"
                                    ),
                                    style: TextStyle(fontSize: 18.0),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 10.0),
                                  child: Text('Address',
                                  style: TextStyle(
                                      color: Colors.grey,
                                  fontSize: 15),),
                                ),
                                Container(
                                  height: 50,
                                  margin: EdgeInsets.only(top: 5.0),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                    color: Color(0xff5f8fa)
                                  ),
                                  child: TextField(
                                    controller: address,
                                    keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius: BorderRadius.circular(10.0)
                                      ),
                                      counterText: "",
                                      hintText: "${agentProfileModel?.filter?.address}"
                                    ),
                                    style: TextStyle(fontSize: 18.0),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 10.0),
                                  child: Text('City',
                                  style: TextStyle(
                                      color: Colors.grey,
                                  fontSize: 15),),
                                ),
                                Container(
                                  height: 50,
                                  margin: EdgeInsets.only(top: 5.0),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                    color: Color(0xff5f8fa)
                                  ),
                                  child: TextField(
                                    controller: citty,
                                    keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius: BorderRadius.circular(10.0)
                                      ),
                                      counterText: "",
                                      hintText: "${agentProfileModel?.filter?.city}"
                                    ),
                                    style: TextStyle(fontSize: 18.0),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 10.0),
                                  child: Text('Country',
                                  style: TextStyle(
                                      color: Colors.grey,
                                  fontSize: 15),),
                                ),
                                Container(
                                  height: 50,
                                  margin: EdgeInsets.only(top: 5.0),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                    color: Color(0xff5f8fa)
                                  ),
                                  child: TextField(
                                    controller: coutry,
                                    keyboardType: TextInputType.text,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius: BorderRadius.circular(10.0)
                                      ),
                                      counterText: "",
                                      hintText: "${agentProfileModel?.filter?.country}"
                                    ),
                                    style: TextStyle(fontSize: 18.0),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(top: 10.0),
                                  child: Text('PostalCode',
                                  style: TextStyle(
                                      color: Colors.grey,
                                  fontSize: 15),),
                                ),
                                Container(
                                  height: 50,
                                  margin: EdgeInsets.only(top: 5.0),
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    border: Border.all(color: Colors.grey),
                                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                    color: Color(0xff5f8fa)
                                  ),
                                  child: TextField(
                                    controller: postalcode,
                                    keyboardType: TextInputType.number,
                                    decoration: InputDecoration(
                                      border: OutlineInputBorder(
                                        borderSide: BorderSide.none,
                                        borderRadius: BorderRadius.circular(10.0)
                                      ),
                                      counterText: "",
                                      hintText: "Postal Code"
                                    ),
                                    style: TextStyle(fontSize: 18.0),
                                  ),
                                ),
                              ],
                            ),
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
         ],
       )
   );
  }

}