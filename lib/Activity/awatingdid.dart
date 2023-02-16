import 'package:flutter/material.dart';

import '../Models/Awating Did Model.dart';
import '../Services/Services.dart';
import 'package:shared_preferences/shared_preferences.dart';


class AwatingDid extends StatefulWidget {
  @override
  _AwatingState createState () => _AwatingState();
}

class _AwatingState extends State<AwatingDid>{

  SharedPreferences? prefs;
  List<Filter> customerList = [];
  int _page = 1;  bool _isPageLoading = false;

  final int _limit = 20;
  final _scrollController = ScrollController();
  late AwatingDidModel awatingDidModel;

  Future<void> getCustomer() async {
    _isPageLoading = true;
    prefs = await SharedPreferences.getInstance();
    awatingDidModel = await Services.PendingList(prefs?.getString("token").toString()??"", _page);
    setState(() {
      for (int i = 0; i<awatingDidModel.filter!.length; i++){
        customerList = awatingDidModel.filter ?? <Filter> [];
      }
    });
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
                        controller: _scrollController,
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
                                    child: Text('Pending Approval',
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
                                child: Column(
                                  children: [
                                    Container(
                                      margin: EdgeInsets.only(bottom: 50.0),
                                      child: Container(
                                        width: double.infinity,
                                        child: ListView.builder(
                                          scrollDirection: Axis.vertical,
                                          itemCount: customerList.length,
                                          shrinkWrap: true,
                                          itemBuilder: (context, index){
                                            Filter filter = customerList[index];
                                            if(customerList.length != null){
                                              return  Card(
                                                color: Colors.transparent,
                                                margin: EdgeInsets.fromLTRB(10, 0, 10, 20),
                                                elevation: 8.0,
                                                shadowColor: Colors.black,
                                                child: Container(
                                                  width: MediaQuery.of(context).size.width,
                                                  height: 180,
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(10.0),
                                                    color: Colors.white
                                                  ),
                                                  child: Column(
                                                    children: [
                                                      Spacer(),
                                                      Row(
                                                        mainAxisAlignment: MainAxisAlignment.start,
                                                        crossAxisAlignment: CrossAxisAlignment.start,
                                                        children: [
                                                          Container(
                                                            margin: EdgeInsets.only(left: 15.0),
                                                            child: Column(
                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                              crossAxisAlignment: CrossAxisAlignment.start,
                                                              children: [
                                                                Container(
                                                                  height: 30,
                                                                  decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                                                                      gradient: LinearGradient(colors: [
                                                                        Color(0xff0B527E),
                                                                        Color(0xff2CABBB),
                                                                      ],
                                                                          begin: Alignment.centerLeft,
                                                                          end: Alignment.centerRight)

                                                                  ),
                                                                  child:  Padding(
                                                                    padding: EdgeInsets.all(8.0),
                                                                    child: Text('D-ID Ref. ######${filter.digitalrefId!.substring(7,10)}',
                                                                      style: TextStyle(color: Colors.white),),
                                                                  ),
                                                                ),
                                                                Container(
                                                                  margin: EdgeInsets.only(top: 20.0),
                                                                  child: Row(
                                                                    children: [
                                                                      Container(
                                                                        child:                                                                                   Padding(
                                                                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                                                          child: Image.asset('images/Agency-04.png',
                                                                            height: 20,),
                                                                        ),
                                                                      ),
                                                                      Container(
                                                                        child: Padding(
                                                                          padding: const EdgeInsets.symmetric(vertical: 10.0),
                                                                          child: Text(
                                                                            "${filter.fullname}" ,
                                                                            style: TextStyle(
                                                                                fontFamily: 'OpenSans',
                                                                                fontSize: 16),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                                Row(
                                                                  children: [
                                                                    Padding(
                                                                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                                                      child: Image.asset('images/all_dids_10.png',
                                                                        height: 20,)
                                                                    ),
                                                                    Text(
                                                                        "${filter.phone}",
                                                                        style: TextStyle(
                                                                            fontFamily: 'OpenSans'
                                                                        )
                                                                    ),
                                                                  ],
                                                                )
                                                              ],
                                                            ),
                                                          ),
                                                          Spacer(),
                                                          Column(
                                                            children: [
                                                              Container(
                                                                height: 20,
                                                                margin: EdgeInsets.only(right: 10.0),
                                                                decoration: BoxDecoration(
                                                                  borderRadius: BorderRadius.all(
                                                                    Radius.circular(5.0)
                                                                  ),
                                                                  color: Colors.pink.shade300,
                                                                ),
                                                                child: Row(
                                                                    children: [
                                                                      Padding(
                                                                        padding: const EdgeInsets.only(left: 8.0, top: 3.0, right: 8.0, bottom: 3.0),
                                                                        child: Container(
                                                                            child: Image.asset("images/pending-04.png",
                                                                            height: 20,),
                                                                          ),
                                                                      ),

                                                                      Padding(
                                                                        padding: const EdgeInsets.only(right: 8.0),
                                                                        child: Container(
                                                                          child: Text("Pending",
                                                                          style: TextStyle(color: Colors.white),),
                                                                        ),
                                                                      )
                                                                    ],
                                                                  ),
                                                              ),
                                                              Container(
                                                                margin: EdgeInsets.only(right: 10.0, top: 10.0),
                                                                alignment: Alignment.center,
                                                                child: Container(
                                                                  width: 100,
                                                                  height: 100,
                                                                  decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.circular(20.0),
                                                                    image: DecorationImage(
                                                                      image: NetworkImage("${filter.iDphoto}"),
                                                                      fit: BoxFit.fill,
                                                                    ),
                                                                  ),
                                                                  alignment: Alignment.center,
                                                                  // child: Image.network("${snapshot.data!.filter![index].iDphoto}",
                                                                  //   width: 100,
                                                                  //   height: 100,),
                                                                ),
                                                              ),
                                                            ],
                                                          )
                                                        ],
                                                      ),
                                                      Spacer(),
                                                      Container(
                                                          alignment: AlignmentDirectional.bottomCenter,
                                                          // width: MediaQuery.of(context).size.width,
                                                          height: 10,
                                                          decoration: const BoxDecoration(
                                                              borderRadius: BorderRadius.only(
                                                                  bottomLeft: Radius.circular(30.0),
                                                                  bottomRight: Radius.circular(30.0)
                                                              ),
                                                              gradient: LinearGradient(colors: [
                                                                Color(0xff0B527E),
                                                                Color(0xff2CABBB),
                                                              ],
                                                                  begin: Alignment.centerLeft,
                                                                  end: Alignment.centerRight)
                                                          )
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              );
                                            }
                                          },
                                          physics: NeverScrollableScrollPhysics(),
                                        ),
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
}
