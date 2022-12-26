import 'package:flutter/material.dart';

class CustomerProfile extends StatefulWidget {
  const CustomerProfile({super.key});

  @override
  _CustomerProfileState createState() => _CustomerProfileState();

}

class _CustomerProfileState extends State<CustomerProfile> with TickerProviderStateMixin{

  @override
  Widget build(BuildContext context) {

    TabController _tabController = TabController(length: 3, vsync: this);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
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
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,v
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
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
                            child: const Text('Customer Profile',
                              style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold
                              ),),
                          ),
                        ],
                      ),
                      Expanded(
                            child: Container(
                              margin: EdgeInsets.only(top: 40.0),
                              width: MediaQuery.of(context).size.width,
                              child: Column(
                                children: [
                                  Padding(padding: EdgeInsets.all(8.0),
                                    child: Column(
                                      children: [
                                        Card(
                                          shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.all(Radius.circular(10.0))
                                          ),
                                          elevation: 10,
                                          child: Container(
                                            width: MediaQuery.of(context).size.width,
                                            height: 45,
                                            decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius: BorderRadius.circular(10.0),
                                            ),
                                            child: TabBar(
                                              controller: _tabController,
                                              isScrollable: true,
                                              indicator: BoxDecoration(
                                                color: Color(0xff0D5085),
                                                borderRadius: BorderRadius.circular(10.0),
                                              ),
                                              labelColor: Colors.white,
                                              unselectedLabelColor: Colors.black,
                                              tabs: [
                                                Tab(
                                                  child: Row(
                                                    mainAxisSize: MainAxisSize.min,
                                                    children: [
                                                      Image.asset('images/home_page_icon_18.png',width: 18, height: 18,),
                                                      const SizedBox(width: 8,),
                                                      Text('Profile')
                                                    ],
                                                  ),
                                                ),
                                                Tab(
                                                  child: Row(
                                                    mainAxisSize: MainAxisSize.min,
                                                    children: [
                                                      Image.asset('images/home_page_icon_15.png',width: 18, height: 18,),
                                                      const SizedBox(width: 8,),
                                                      Text('Land')
                                                    ],
                                                  ),
                                                ),
                                                Tab(
                                                  child: Row(
                                                  mainAxisSize: MainAxisSize.min,
                                                  children: [
                                                    Image.asset('images/home_page_icon_16.png',width: 18, height: 18,),
                                                    const SizedBox(width: 8,),
                                                    Text('Financial')
                                                  ],
                                                ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                        TabBarView(
                                              controller: _tabController,
                                                  children: [
                                                    Center(child: Text('Presnol'),),
                                                    Center(child: Text('Presnol'),),
                                                    Center(child: Text('Presnol'),)
                                                  ],
                                                ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),

                      ),
                      Container(
                        // alignment: Alignment.bottomCenter,
                        margin: const EdgeInsets.fromLTRB(50, 20, 50, 10),
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
                              // navigaterUser();
                            },
                            textColor: Colors.white,
                            child: const Padding(
                              padding: EdgeInsets.all(10.0),
                              child: const Text('Services', style: const TextStyle(fontSize: 18,),),
                            ),
                          ),
                        ),
                      )

                    ],
                  ),
                ),
            ],
          ),
        ),
      ),
    );

  }
}