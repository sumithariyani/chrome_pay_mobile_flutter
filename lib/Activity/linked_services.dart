import 'package:flutter/material.dart';

import '../Models/OrganisationModel.dart';
import '../Services/Services.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LinkedServices extends StatefulWidget {

  String phone = "";
  LinkedServices(this.phone);

  @override
  _LinkedServicesState createState() => _LinkedServicesState();

}

 class _LinkedServicesState extends State<LinkedServices> {

   List<String> _orgList = [];
   List<String>? assetType;
   String? selectedAssetType;
   OrganisationModel? _organisationModel;
   TextEditingController mobileNumber = TextEditingController();
   SharedPreferences? prefs;


   Future<void> scan() async{
     // prefs = await SharedPreferences.getInstance();
     // _organisationModel = await Services.OrgList(prefs!.getString("token").toString());
     // print("assetType${assetType}");
     // setState(() {
     //   for(int i=0; i< _organisationModel!.org!.length; i++){
     //     _orgList.add(_organisationModel!.org![i]!.id ?? "");
     //     // assetType = ['${_organisationModel!.org![i]!.name }'];
     //     selectedAssetType = 'Select Asset';
     //     assetType?.add('${_organisationModel!.org![i]!.name }');
     //     assetType?.addAll('${_organisationModel!.org![i]!.name }' as Iterable<String>);
     //   }
     // });

     }

   @override
   void initState() {
     scan();
     super.initState();
   }

   @override
  Widget build(BuildContext context) {
     mobileNumber.value = TextEditingValue(text: "${widget.phone}");
  return Scaffold(
    body: Stack(
      children: [
        Container(
          alignment: Alignment.topRight,
          child: Image.asset('images/login_stuff_31.png',
            height: 200,
            width: 150,),
        ),
        Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
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
                    margin: EdgeInsets.fromLTRB(15, 40, 0, 0),
                    child: Text('Linked Service',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18
                      ),),
                  )
                ],
              ),
              Expanded(
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  // height: MediaQuery.of(context).size.height,
                  child: Card(
                    margin: EdgeInsets.fromLTRB(10, 40, 10, 10),
                    elevation: 10,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(10.0))
                    ),
                    color: Colors.white,
                    shadowColor: Colors.black,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.only(top: 20.0, bottom: 10.0),
                                  child: Image.asset('images/handshake_06.png',
                                    height: 70,),
                              ),
                              Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    // mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
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
                                              hintText: "Mobile Number"
                                          ),
                                          style: TextStyle(fontSize: 18.0),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(top: 10.0),
                                        child: Text('Organisation',
                                          style: TextStyle(
                                              color: Colors.grey,
                                              fontSize: 15),),
                                      ),
                                      Container(
                                          width: double.infinity,
                                          height: 60,
                                          margin: EdgeInsets.fromLTRB(0, 10, 0, 0),
                                          child: DropdownButtonFormField<String>(
                                            decoration: InputDecoration(
                                              border: OutlineInputBorder(
                                                  borderSide: BorderSide(color: Colors.grey,
                                                      width: 5.0),
                                                  borderRadius: BorderRadius.all(
                                                    Radius.circular(10.0),
                                                  )
                                              ),
                                            ),
                                            icon: Icon(Icons.keyboard_arrow_down),
                                            value: selectedAssetType,
                                            items: assetType?.
                                            map((item) => DropdownMenuItem<String>(
                                                value: item,
                                                child: Text(item,)
                                            ))
                                                .toList(),
                                            onChanged: (item) => setState(() => selectedAssetType = item),
                                          )
                                      ),
                                    ],
                                ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
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
                      // scan();
                    },
                    textColor: Colors.white,
                    child: const Padding(
                      padding: EdgeInsets.all(10.0),
                      child: Text('Save Changes', style: const TextStyle(fontSize: 18,),),
                    ),
                  ),
                ),
              )
            ],
          ),
        )
      ]
    ),
  );
  }

 }