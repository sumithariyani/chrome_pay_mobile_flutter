import 'dart:async';
import 'dart:io';

import 'package:chrome_pay_mobile_flutter/Activity/documentscanner.dart';
import 'package:chrome_pay_mobile_flutter/Services/Services.dart';
import 'package:flutter/material.dart';
import '../Models/customer Register Model.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapSample extends StatefulWidget {

  String image;
  String name = "";
  String number = "";
  String dob = "";
  String gender = "";
  String email = "";
  String age = "";
  String city = "";
  String nationality = "";
  String profession = "";
  String kinName = "";
  String kinPhone = "";

  MapSample(this.image, this.name, this.number, this.dob, this.gender,
      this.email, this.age, this.city, this.nationality, this.profession, this.kinName, this.kinPhone,);

  @override
  MapSampleState createState() => MapSampleState();

}

class MapSampleState extends State<MapSample> {

  CustomerRegisterModel? _customerRegisterModel;
  SharedPreferences? prefs;
  Position? position;
  GoogleMapController? _googleMapController;
  Future<void> register() async{

    print('widget.image${widget.image}');
    prefs = await SharedPreferences.getInstance();
    _customerRegisterModel = (await Services.CustRegister(prefs!.getString("ID").toString(), prefs!.getString("orgID").toString(),
        widget.image, widget!.name, widget!.number, widget!.dob, widget!.gender, widget!.email, widget!.nationality, widget!.profession, widget!.kinName, widget!.kinPhone, widget!.age, widget!.city)) as CustomerRegisterModel?;

    if(_customerRegisterModel!.status == true){

      Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => DocumentScanner(widget.number, widget.email,int.parse(widget.age) , widget.city),));
    }
  }

  Future<Position> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      return Future.error('Location services are disabled');
    }

    permission = await Geolocator.checkPermission();

    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();

      if (permission == LocationPermission.denied) {
        return Future.error("Location permission denied");
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error('Location permissions are permanently denied');
    }

    Position position = await Geolocator.getCurrentPosition();

    return position;
  }

  @override
  void initState() {
    // register();
    super.initState();
    getAsync();
  }
  getAsync() async {
    try{
      prefs = await SharedPreferences.getInstance();
      position = await _determinePosition();
      setState(() {

      });
    }catch (e) {
      print(e);
    }
  }


  final Completer<GoogleMapController> _controller = Completer<GoogleMapController>();
  TextEditingController _searchController = TextEditingController();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  static final Marker _kGooglePlexMarker = Marker(
      markerId: MarkerId('_kGooglePlex'),
    infoWindow: InfoWindow(title: 'Google Plex'),
    icon: BitmapDescriptor.defaultMarker,
    position:  LatLng(22.70284, 75.8715115),
  );
  static const CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);

  @override
  Widget build(BuildContext context) {
    print("position?.latitude ${position?.latitude}");
    print("position?.longitude ${position?.longitude}");
    _googleMapController
        ?.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target: LatLng(position!.latitude, position!.longitude), zoom: 14)));
    return Scaffold(
      body: Stack(
        children: [
           Column(
            children: [
              Expanded(
                child: GoogleMap(
                  mapType: MapType.hybrid,
                  markers: {_kGooglePlexMarker},
                  initialCameraPosition: _kGooglePlex,
                  onMapCreated: (GoogleMapController controller) {
                    _googleMapController = controller;
                  },
                ),
              ),
            ],
          ),
          Positioned(
            top: MediaQuery.of(context).padding.top, left: 5, right: 5,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(20.0))
              ),
              child: Row(
                children: [
                  Expanded(child:
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: TextFormField(
                      controller: _searchController,
                      textCapitalization: TextCapitalization.words,
                      decoration: InputDecoration(hintText: 'Search by City',
                      border: InputBorder.none),
                      onChanged: (value){
                        print(value);
                      },
                    ),
                  )),
                  IconButton(
                        onPressed: (){},
                        icon: Icon(Icons.search)),

                ],
              ),
            ),
          ),

          Positioned(
            bottom: 0, right: 0, left: 0,
            child: Container(
              alignment: Alignment.bottomCenter,
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                color: Colors.white,
                  borderRadius: BorderRadius.only(topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0))
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 20, 10, 0),
                    child: Text('Address : Sydney NAW 2052 Australia',
                      style: TextStyle(
                          fontWeight: FontWeight.bold
                      ),),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
                    child: Text('Latitude : 22.7028433',
                        style: TextStyle(
                            fontWeight: FontWeight.bold
                        )),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
                    child: Text('Longitude : 75.8715109',
                        style: TextStyle(
                            fontWeight: FontWeight.bold
                        )),
                  ),
                  Container(
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
                          register();
                        },
                        textColor: Colors.white,
                        child: const Padding(
                          padding: EdgeInsets.all(10.0),
                          child: const Text('Countinue', style: const TextStyle(fontSize: 18,),),
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
      // floatingActionButton: FloatingActionButton.extended(
      //   onPressed: _goToTheLake,
      //   label: const Text('To the lake!'),
      //   icon: const Icon(Icons.directions_boat),
      // ),
    );
  }

  // void navigaterUser(){
  //   Navigator.of(context).push(MaterialPageRoute(builder: (context) => DocumentScanner(),));
  // }

  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }
}