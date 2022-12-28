import 'package:flutter/material.dart';

class LandCertificate extends StatefulWidget {
  @override
  _LandCertifyState createState () => _LandCertifyState();
}

class _LandCertifyState extends State<LandCertificate> {
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
                                          child: Text('Rachel Berk',),
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
                                          child: Text('+972537088719',),
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
                                            child: Text('100',),
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
                                          child: Text('Sydney NAW 2025 Australia',),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                Card(
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