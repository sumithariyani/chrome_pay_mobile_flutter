import 'dart:async';
import 'dart:io';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:chrome_pay_mobile_flutter/Activity/documentscanner.dart';
import 'package:chrome_pay_mobile_flutter/Services/Services.dart';
import 'package:flutter/material.dart';
import '../Models/customer Register Model.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:awesome_snackbar_content/awesome_snackbar_content.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:google_api_headers/google_api_headers.dart';

class MapSample extends StatefulWidget {

  String image = "";
  String name = "";
  String number = "";
  String dob = "";
  String gender = "";
  String email = "";
  String city = "";
  String nationality = "";
  String profession = "";
  String kinName = "";
  String kinPhone = "";

  MapSample(this.image, this.name, this.number, this.dob, this.gender,
      this.email, this.city, this.nationality, this.profession, this.kinName, this.kinPhone,);

  @override
  MapSampleState createState() => MapSampleState();

}

const kGoogleApiKey = 'AIzaSyCdkMLmt8vv54OmKcp4c174eK4t7J1Xgzk';
final homeScaffoldKey = GlobalKey<ScaffoldState>();

class MapSampleState extends State<MapSample> {

  CustomerRegisterModel? _customerRegisterModel;
  SharedPreferences? prefs;
  Position? position;
  GoogleMapController? _googleMapController;
  Set<Marker> markers = {};
  final Mode _mode = Mode.overlay;
  PlacesDetailsResponse? detail;
  var lat;
  var lng;
  List<Placemark>? addresses;
  var first;

  Future<void> register() async{

    print('widget.image${widget.image}');
    prefs = await SharedPreferences.getInstance();
    _customerRegisterModel = (await Services.CustRegister(prefs!.getString("token").toString(),
         widget.image, widget.name, widget.number, widget.dob, widget.gender, widget.email, widget.nationality, widget.profession, widget.kinName, widget.kinPhone, widget.city)) as CustomerRegisterModel?;

    if(_customerRegisterModel!.status == true){

      Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => DocumentScanner(widget.number, widget.email, widget.city),));
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

  var completeAddress;
  @override
  void initState() {
    _handlePressButton();
    _currentLocation();
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

  Future<void> _currentLocation() async {
    position = await _determinePosition();

    if(position!=null) {
      _getLocation();
      print("position?.latitude ${position?.latitude}");
      print("position?.longitude ${position?.longitude}");
      _googleMapController
          ?.animateCamera(CameraUpdate.newCameraPosition(CameraPosition(target:
      LatLng(position!.latitude, position!.longitude), zoom: 20)));
      markers.clear();

      markers.add(Marker(markerId: const MarkerId('CurrentLocation'),
          position: LatLng(position!.latitude, position!.longitude)));


       lat = position!.latitude;
       lng = position!.longitude;
      print("lat ${lat}");
      print(" lng ${lng}");
      markers.clear();
      markers.add(Marker(markerId: const MarkerId("0"),
          position: LatLng(lat, lng),
          infoWindow: InfoWindow(title: detail?.result.name)));
      print(" name ${detail?.result.formattedAddress}");

    } else{
      print("gfgddfhddhfddd ${throw Error()}");
      throw Error();
    }
    setState(() {});
  }
  _getLocation() async
  {
    Position position = await
    Geolocator.getCurrentPosition(desiredAccuracy:
    LocationAccuracy.high);
    debugPrint('location: ${position.latitude}');
     addresses = await
    placemarkFromCoordinates(position.latitude,position.longitude);
// addresses.first.thoroughfare
     setState(() {
       first = addresses?.first;
       completeAddress = first?.name + ", "+ first.thoroughfare+", "+first.locality + ", "
           +first.administrativeArea + ", "+first.country;
       print("AHGDGHSDGFSDJKAGH addresses ${completeAddress}");
       // print("AHGDGHSDGFSDJKAGH first ${first}");
       // print("AHGDGHSDGFSDJKAGH ${first?.name} : ${first?.administrativeArea}");
     });

    return addresses;
  }

  final Completer<GoogleMapController> _controller = Completer<GoogleMapController>();
  TextEditingController _searchController = TextEditingController();

  static const CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.5
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
    return Scaffold(
      body: Stack(
        children: [
           Column(
            children: [
              Expanded(
                child: GoogleMap(
                  mapType: MapType.hybrid,
                  markers: markers,
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
            child: InkWell(
              onTap: () {
                _handlePressButton();
              },
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.all(Radius.circular(20.0))
                ),
                  child: Row(
                    children: [
                      Expanded(
                          child: InkWell(
                            onTap: (){
                              _handlePressButton();
                            },
                            child: Container(
                            margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: TextField(
                              controller: _searchController,
                              readOnly: true,
                              enabled: false,
                              decoration: InputDecoration(hintText: 'Search by City',
                              border: InputBorder.none),
                            ),
                        ),
                          )
                      ),
                      IconButton(
                            onPressed: (){
                              _handlePressButton();
                            },
                            icon: Icon(Icons.search)),

                    ],
                  ),
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
                    child: Text('Address : ${completeAddress}',
                      style: TextStyle(
                          fontWeight: FontWeight.bold
                      ),),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
                    child: Text('Latitude : ${position?.latitude}',
                        style: TextStyle(
                            fontWeight: FontWeight.bold
                        )),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(10, 5, 10, 0),
                    child: Text('Longitude : ${position?.longitude}',
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
                          child: const Text('Continue', style: const TextStyle(fontSize: 18,),),
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
    );
  }


  Future<void> _goToTheLake() async {
    final GoogleMapController controller = await _controller.future;
    controller.animateCamera(CameraUpdate.newCameraPosition(_kLake));
  }

  Future<void> _handlePressButton() async {
    print("objectnbvcxzxcvbn");
    Prediction? p = await PlacesAutocomplete.show(
        context: context,
        apiKey: kGoogleApiKey,
        onError: onError,
        mode: _mode,
        language: 'en',
        strictbounds: false,
        types: [""],
        decoration: InputDecoration(
            hintText: 'Search',
            focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(20), borderSide: BorderSide(color: Colors.white))),
        components: [Component(Component.country,"ind"),Component(Component.country,"usa"),Component(Component.country,"isr")]);


    displayPrediction(p!,homeScaffoldKey.currentState);
  }

  void onError(PlacesAutocompleteResponse response){

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      elevation: 0,
      behavior: SnackBarBehavior.floating,
      backgroundColor: Colors.transparent,
      content: AwesomeSnackbarContent(
        title: 'Message',
        message: response.errorMessage!,
        contentType: ContentType.failure,
      ),
    ));

    // homeScaffoldKey.currentState!.showSnackBar(SnackBar(content: Text(response.errorMessage!)));
  }

  Future<void> displayPrediction(Prediction p, ScaffoldState? currentState) async {

    GoogleMapsPlaces places = GoogleMapsPlaces(
        apiKey: kGoogleApiKey,
        apiHeaders: await const GoogleApiHeaders().getHeaders()
    );

    detail = await places.getDetailsByPlaceId(p.placeId!);

    lat = detail?.result.geometry!.location.lat;
    lng = detail?.result.geometry!.location.lng;

    markers.clear();
    markers.add(Marker(markerId: const MarkerId("0"),position: LatLng(lat!, lng!),infoWindow: InfoWindow(title: detail?.result.name)));

    print(" locationhghbhname ${detail?.result.adrAddress}");
    print("klflkdsksmmmdmmmlat ${lat}");
    print(" bdjshhbsdhjbhjbsdfjfbsblng ${lng}");

    setState(() {});

    _googleMapController?.animateCamera(CameraUpdate.newLatLngZoom(LatLng(lat, lng), 14.0));

  }
}