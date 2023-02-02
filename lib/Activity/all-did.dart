import 'package:chrome_pay_mobile_flutter/Activity/customer%20profile.dart';
import 'package:chrome_pay_mobile_flutter/Models/All%20Did%20Model.dart';
import 'package:chrome_pay_mobile_flutter/Models/CustomerViewOtpModel.dart';
import 'package:chrome_pay_mobile_flutter/Services/Services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../Models/VerifyCustViewOtpModel.dart';

class Active_Did extends StatefulWidget {
  @override
  _ActiveDidState createState ()=> _ActiveDidState();

}

class _ActiveDidState extends State<Active_Did> {

  SharedPreferences? prefs;
  List<String> customerList = [];
  int? _page = 1;
  bool _isPageLoading = false;
  final _scrollController = ScrollController();
  String? otp;
  String? id;

  TextEditingController _otp1 = TextEditingController();
  TextEditingController _otp2 = TextEditingController();
  TextEditingController _otp3 = TextEditingController();
  TextEditingController _otp4 = TextEditingController();
  TextEditingController _otp5 = TextEditingController();
  TextEditingController _otp6 = TextEditingController();

  late AllDidModel allDidModel;
  CustomerViewOtpModel? _customerViewOtpModel;
  VerifyCustViewOtpModel? _verifyCustViewOtpModel;

  Future<void> getCustomer() async {
    _isPageLoading = true;
    prefs = await SharedPreferences.getInstance();
    allDidModel = await Services.CustomerList(prefs!.getString('token').toString(), _page!);
    setState(() {
      for (int i = 0; i<allDidModel.filter!.length; i++){
        customerList.add(allDidModel.filter![i].id ??"");
      }
    });
  }

  Future<void> _verifyCust(String phone, String id) async {

    print("id${id}");
    _customerViewOtpModel = await Services.CustViewOtp(phone);

    if(_customerViewOtpModel?.status!= false){
      Fluttertoast.showToast(msg: "${_customerViewOtpModel?.msg}",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER);
    }
  }

  Future<void> _verifyCustOtp(String phone,) async {
    otp = _otp1.text+_otp2.text+_otp3.text+_otp4.text+_otp5.text+_otp6.text;
    _verifyCustViewOtpModel = await Services.VerifyCustomerViewOtp(phone, otp!);

    if(_verifyCustViewOtpModel?.status!= false){
      Fluttertoast.showToast(msg: "${_verifyCustViewOtpModel?.msg}",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER);
      print(id);
      Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => CustomerProfile(id!)
          )
      );
    }
  }
  @override
  void initState() {
    getCustomer();
    super.initState();
    getAsync();
    _scrollController.addListener(_scrollListener) ;
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
      // resizeToAvoidBottomInset: false,
      body: SingleChildScrollView(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
            child: Stack(
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
                    child: ConstrainedBox(
                      constraints: BoxConstraints(),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        height: MediaQuery.of(context).size.height,
                        child: SingleChildScrollView(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
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
                                      child: Container(
                                        margin: const EdgeInsets.fromLTRB(15, 40, 0, 0),
                                        child: Image.asset('images/login_stuff_03.png',
                                          height: 20,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: const EdgeInsets.fromLTRB(15, 40, 0, 0),
                                      child: Text('Active D-IDs',
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
                                  width: MediaQuery.of(context).size.width,
                                  height: MediaQuery.of(context).size.height,
                                    child: SingleChildScrollView(
                                      controller: _scrollController,
                                      child: Column(
                                        children: [
                                          Container(
                                            margin: EdgeInsets.only(bottom: 50.0),
                                            child: FutureBuilder<AllDidModel>(
                                              future: Services.CustomerList(prefs!.getString('token').toString(), _page!),
                                              builder: (mcontext, snapshot){
                                                if (snapshot.hasData){
                                                  _isPageLoading = false;

                                                  return Container(
                                                    width: double.infinity,
                                                    child: ListView.builder(
                                                      scrollDirection: Axis.vertical,
                                                      itemCount: snapshot.data!.filter?.length?? 0,
                                                      shrinkWrap: true,
                                                      itemBuilder: (context, index){
                                                        return  InkWell(
                                                          onTap: () {
                                                            id = "${snapshot.data?.filter![index]?.id}";
                                                            _verifyCust("${snapshot.data?.filter![index]?.phone}", "${id}");
                                                            _custDetailDialog("${snapshot.data?.filter![index]?.phone}");
                                                            // Navigator.push(
                                                            //     context,
                                                            //     MaterialPageRoute(builder: (context) => CustomerProfile(
                                                            //       snapshot.data!.filter![index].id.toString() ?? "1",
                                                            //     )
                                                            //     )
                                                            // );
                                                          },
                                                          child: Card(
                                                            color: Colors.transparent,
                                                            margin: EdgeInsets.fromLTRB(20, 0, 20, 20),
                                                            elevation: 5,
                                                            shadowColor: Colors.black,
                                                            child: Container(
                                                              width: MediaQuery.of(context).size.width,
                                                              height: 150,
                                                              decoration: BoxDecoration(
                                                                borderRadius: BorderRadius.circular(20.0),
                                                                image: const DecorationImage(image: AssetImage('images/all_dids_07.png'),
                                                                  fit: BoxFit.cover,),
                                                              ),
                                                              child: Row(
                                                                mainAxisAlignment: MainAxisAlignment.start,
                                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                                children: [
                                                                  Container(
                                                                    child: Column(
                                                                      mainAxisAlignment: MainAxisAlignment.start,
                                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                                      children: [
                                                                        Container(
                                                                          height: 30,
                                                                          margin: EdgeInsets.all(10),
                                                                          decoration: BoxDecoration(
                                                                            borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                                                            color: Colors.white,
                                                                          ),
                                                                          child: Padding(
                                                                            padding: EdgeInsets.all(8.0),
                                                                            child: Text(
                                                                              "D-ID Ref. ######${snapshot.data!.filter![index].digitalrefId!.substring(7,10)}",
                                                                             ),
                                                                          ),
                                                                        ),
                                                                        Padding(
                                                                          padding: const EdgeInsets.all(12.0),
                                                                          child: Text(
                                                                            "${snapshot.data!.filter![index].fullname}" ,
                                                                            style: TextStyle(
                                                                                fontWeight: FontWeight.w600,
                                                                                fontSize: 16),
                                                                          ),
                                                                        ),
                                                                        Row(
                                                                          children: [
                                                                            Padding(
                                                                              padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                                                              child: Image.asset('images/all_dids_10.png',
                                                                                height: 20,),
                                                                            ),
                                                                            Text(
                                                                                "${snapshot.data!.filter![index].phone}",
                                                                                style: TextStyle(
                                                                                  fontWeight: FontWeight.w500,
                                                                                )
                                                                            ),
                                                                          ],
                                                                        )
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  Spacer(),
                                                                  Container(
                                                                    margin: EdgeInsets.only(right: 10.0),
                                                                    alignment: Alignment.center,
                                                                    child: Container(
                                                                      width: 100,
                                                                      height: 100,
                                                                      decoration: BoxDecoration(
                                                                        borderRadius: BorderRadius.circular(20.0),
                                                                        image: DecorationImage(
                                                                          image: NetworkImage("${snapshot.data!.filter![index].iDphoto}"),
                                                                          fit: BoxFit.fill,
                                                                        ),
                                                                      ),
                                                                      alignment: Alignment.center,
                                                                      // child: Image.network("${snapshot.data!.filter![index].iDphoto}",
                                                                      //   width: 100,
                                                                      //   height: 100,),
                                                                    ),
                                                                  )
                                                                ],
                                                              ),
                                                            ),
                                                          ),
                                                        );
                                                      },
                                                      physics: NeverScrollableScrollPhysics(),
                                                    ),
                                                  );
                                                }else if (snapshot.hasError){
                                                  return Center(
                                                    child: Text('Not Found'),
                                                  );
                                                }
                                                return const CircularProgressIndicator();
                                              },
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                                ),

                            ],
                          ),
                        ),
                      ),
                    ),
                )
                ),
              ],
            ),
        ),
      ),
    );
  }

  void _scrollListener(){
    print("working");
    if(_scrollController.position.pixels ==
        _scrollController.position.maxScrollExtent) {
      _page = _page!+1;
      getCustomer().then((data) {
      });
    } else {
      print('Dont');
    }
  }
  void _custDetailDialog(String phone){
    showDialog(context: context, builder: (context){
      return Container(
        child: Dialog(
          child: SingleChildScrollView(
            child: Container(
              height: 400,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                    Radius.circular(40.0)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
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
                    alignment: Alignment.center,
                    child: Text('Verification Code',
                      style: TextStyle(fontSize: 18,
                        fontWeight: FontWeight.bold,),),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Text('Sent to customer mobile no.',
                      style: TextStyle(fontWeight: FontWeight.bold),),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 30.0),
                    alignment: Alignment.center,
                    child: Text('Enter the 6 Digit OTP',
                      style: TextStyle(fontWeight: FontWeight.w500,
                          fontSize: 16),),
                  ),
                  Container(
                    alignment: Alignment.center,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          margin: EdgeInsets.only(top: 10.0, right: 2.5, left: 10.0),
                          width: 40,
                          height: 50,
                          child: Card(
                            color: Color(0xff17314C),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(5),
                                    bottomLeft: Radius.circular(5),
                                    topLeft: Radius.circular(5),
                                    topRight: Radius.circular(5)),
                                side: BorderSide(width:2, color: Colors.lightBlueAccent)),
                            child: TextField(
                                controller: _otp1,
                                decoration: InputDecoration(
                                    border: InputBorder.none
                                ),
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.white),
                                onChanged: (value){
                                  if (value.isNotEmpty){
                                    FocusScope.of(context).nextFocus();
                                  }else if (value.isEmpty){
                                    FocusScope.of(context).previousFocus();
                                  }
                                },
                                inputFormatters: [
                                  new LengthLimitingTextInputFormatter(1)
                                ]
                            ),
                          ),
                        )
                        ,
                        Container(
                          margin: EdgeInsets.only(top: 10.0, right: 2.5),
                          width: 40,
                          height: 50,
                          child: Card(
                            color: Color(0xff17314C),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(5),
                                    bottomLeft: Radius.circular(5),
                                    topLeft: Radius.circular(5),
                                    topRight: Radius.circular(5)),
                                side: BorderSide(width:2, color: Colors.lightBlueAccent)),
                            child: TextField(
                                controller: _otp2,
                                decoration: InputDecoration(
                                    border: InputBorder.none
                                ),
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.white),
                                onChanged: (value){
                                  if (value.isNotEmpty){
                                    FocusScope.of(context).nextFocus();
                                  }else if (value.isEmpty){
                                    FocusScope.of(context).previousFocus();
                                  }
                                },
                                inputFormatters: [
                                  new LengthLimitingTextInputFormatter(1)
                                ]
                            ),
                          ),
                        )
                        ,
                        Container(
                          margin: EdgeInsets.only(top: 10.0, right: 2.5),
                          width: 40,
                          height: 50,
                          child: Card(
                            color: Color(0xff17314C),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(5),
                                    bottomLeft: Radius.circular(5),
                                    topLeft: Radius.circular(5),
                                    topRight: Radius.circular(5)),
                                side: BorderSide(width:2, color: Colors.lightBlueAccent)),
                            child: TextField(
                                controller: _otp3,
                                decoration: InputDecoration(
                                    border: InputBorder.none
                                ),
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.white),
                                onChanged: (value){
                                  if (value.isNotEmpty){
                                    FocusScope.of(context).nextFocus();
                                  }else if (value.isEmpty){
                                    FocusScope.of(context).previousFocus();
                                  }
                                },
                                inputFormatters: [
                                  new LengthLimitingTextInputFormatter(1)
                                ]
                            ),
                          ),
                        )
                        ,
                        Container(
                          margin: EdgeInsets.only(top: 10.0, right: 2.5),
                          width: 40,
                          height: 50,
                          child: Card(
                            color: Color(0xff17314C),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(5),
                                    bottomLeft: Radius.circular(5),
                                    topLeft: Radius.circular(5),
                                    topRight: Radius.circular(5)),
                                side: BorderSide(width:2, color: Colors.lightBlueAccent)),
                            child: TextField(
                                controller: _otp4,
                                decoration: InputDecoration(
                                    border: InputBorder.none
                                ),
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.white),
                                onChanged: (value){
                                  if (value.isNotEmpty){
                                    FocusScope.of(context).nextFocus();
                                  }else if (value.isEmpty){
                                    FocusScope.of(context).previousFocus();
                                  }
                                },
                                inputFormatters: [
                                  new LengthLimitingTextInputFormatter(1)
                                ]
                            ),
                          ),
                        )
                        ,
                        Container(
                          margin: EdgeInsets.only(top: 10.0, right: 2.5),
                          width: 40,
                          height: 50,
                          child: Card(
                            color: Color(0xff17314C),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(5),
                                    bottomLeft: Radius.circular(5),
                                    topLeft: Radius.circular(5),
                                    topRight: Radius.circular(5)),
                                side: BorderSide(width:2, color: Colors.lightBlueAccent)),
                            child: TextField(
                                controller: _otp5,
                                decoration: InputDecoration(
                                    border: InputBorder.none
                                ),
                                keyboardType: TextInputType.number,
                                textAlign: TextAlign.center,
                                style: TextStyle(color: Colors.white),
                                onChanged: (value){
                                  if (value.isNotEmpty){
                                    FocusScope.of(context).nextFocus();
                                  }else if (value.isEmpty){
                                    FocusScope.of(context).previousFocus();
                                  }
                                },
                                inputFormatters: [
                                  new LengthLimitingTextInputFormatter(1)
                                ]
                            ),
                          ),
                        )
                        ,
                        Container(
                          margin: EdgeInsets.only(top: 10.0, right: 2.5),
                          width: 40,
                          height: 50,
                          child: Card(
                            color: Color(0xff17314C),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    bottomRight: Radius.circular(5),
                                    bottomLeft: Radius.circular(5),
                                    topLeft: Radius.circular(5),
                                    topRight: Radius.circular(5)),
                                side: BorderSide(width:2, color: Colors.lightBlueAccent)),
                            child: TextField(
                              controller: _otp6,
                              decoration: InputDecoration(
                                  border: InputBorder.none
                              ),
                              keyboardType: TextInputType.number,
                              textAlign: TextAlign.center,
                              style: TextStyle(color: Colors.white,
                                  fontSize: 18),
                              onChanged: (value){
                                if (value.isNotEmpty){
                                  FocusScope.of(context).nextFocus();
                                }else if (value.isEmpty){
                                  FocusScope.of(context).previousFocus();
                                }
                              },
                              inputFormatters: [
                                new LengthLimitingTextInputFormatter(1)
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Spacer(),
                  Expanded(
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.fromLTRB(30, 10, 30, 10),
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
                                  _verifyCustOtp(phone);
                                  Navigator.pop(context);
                                },
                                textColor: Colors.white,
                                child: const Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: const Text('Verify DID', style: const TextStyle(fontSize: 18,),),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      );
    });
  }
}