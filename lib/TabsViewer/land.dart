import 'package:flutter/material.dart';

import '../Models/Cust dash Model.dart';
import '../Services/Services.dart';
import 'package:shared_preferences/shared_preferences.dart';


class LandCertificate extends StatefulWidget {

  String id = "";
  LandCertificate(this.id);

  @override
  _LandCertifyState createState () => _LandCertifyState();
}

class _LandCertifyState extends State<LandCertificate> {


  CustDetailModel? custDetailModel;
  SharedPreferences? prefs;

  Future<void> getCustomer() async {
    prefs = await SharedPreferences.getInstance();

    custDetailModel = await Services.GetCustDetail(prefs!.getString("token").toString(), widget.id);

    if(custDetailModel!.status!){
      print("land"+widget.id);
      print("land ${custDetailModel!.obj!.fullname}");
      print("land ${custDetailModel!.obj!.location}");
    }
    setState(() {

    });
  }

  @override
  void initState() {
    getCustomer();
    super.initState();
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
                              backgroundColor: Colors.black,
                              backgroundImage: NetworkImage("${custDetailModel?.obj?.iDphoto ??""}"),
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
                                      child: Text("${custDetailModel?.obj?.fullname??""}",
                                        style: TextStyle(fontWeight: FontWeight.bold,
                                            fontSize: 20,
                                            color: Colors.white),),
                                    ),
                                    Row(
                                      children: [
                                        Image.asset('images/home_page_icon_20.png',
                                          height: 10,),
                                        Text("${custDetailModel?.obj?.phone??""}",
                                          style: TextStyle(
                                              fontSize: 12,
                                              color: Colors.white),),
                                      ],
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
                                    child: Image.asset('images/address__1_.png',
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.symmetric(horizontal: 10.0),
                                    child: Text('Location'
                                    ),
                                  ),
                                  Spacer(),

                                  if(custDetailModel?.obj?.location == 0)
                                    Container(
                                      width: 30,
                                      height: 30,
                                      alignment: Alignment.centerRight,
                                      margin: EdgeInsets.symmetric(vertical: 10.0),
                                      child: Image.asset('images/cross.png',
                                      ),
                                    ),
                                  if (custDetailModel?.obj?.location == 1)
                                    Container(
                                      width: 30,
                                      height: 30,
                                      margin: EdgeInsets.symmetric(vertical: 10.0),
                                      child: Image.asset('images/home_page_icon_22.png',
                                      ),
                                    ),
                                ],
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(vertical: 20.0, horizontal: 15.0),
                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.symmetric(vertical: 20.0),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          child: Text('Land Owner',
                                            style: TextStyle(
                                                color: Color(0xff98A6F4)
                                            ),),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          child: Text("${custDetailModel?.obj?.fullname??""}",),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(vertical: 20.0),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          child: Text('Contact',
                                            style: TextStyle(
                                                color: Color(0xff98A6F4)
                                            ),),
                                        ),
                                      ),
                                      Expanded(
                                        child: Container(
                                          child: Text("${custDetailModel?.obj?.phone??""}",),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(vertical: 20.0),
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Container(
                                          child: Text('Land Size',
                                            style: TextStyle(
                                                color: Color(0xff98A6F4)
                                            ),),
                                        ),
                                      ),
                                      Expanded(
                                          child: Container(
                                            child: Text("${custDetailModel?.obj?.landSize??""}",),
                                          )),

                                    ],
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(vertical: 20.0),
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
                                          child: Text("${custDetailModel?.obj?.address??""}",),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                InkWell(
                                  onTap: (){
                                    _registrationDialog();
                                  },
                                  child: Card(
                                    elevation: 5,
                                    color: Color(0xff234e67),
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.all(Radius.circular(10.0))
                                    ),
                                    margin: EdgeInsets.only(top: 10.0, bottom: 10.0, left: 0.0, right: 0.0),
                                    child: Container(
                                      height: 55,
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
                                            child: Text('Land Crtificate',
                                              style: TextStyle(color: Colors.white),
                                            ),
                                          ),
                                          Spacer(),
                                          Container(
                                              alignment: Alignment.centerRight,
                                              margin: EdgeInsets.symmetric(vertical: 10.0),
                                              child: Icon(Icons.arrow_forward_ios,
                                                color: Colors.white,)
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
                    ),
                  ),
                ],
              ),
            ),
          )

      ),
    );
  }

  void _registrationDialog(){
    showDialog(context: context, builder: (context){
      return Container(
        child: Dialog(
          child: SingleChildScrollView(
            child: Column(
              children: [
                InkWell(
                  onTap: (){
                    Navigator.pop(context);
                  },
                  child: Container(
                    alignment: Alignment.topRight,
                    padding: EdgeInsets.all(10.0),
                    child: Image.asset('images/login_stuff_28.png',
                      height: 20,),
                  ),
                ),
                Container(
                  height: 400,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(
                        Radius.circular(40.0)),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Center(
                        child: Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.all(10.0),
                          child: Image.network("${custDetailModel?.obj?.landRegistration??""}",),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    });
  }

}