
import 'dart:io';
// import 'package:document_scanner_flutter/configs/configs.dart';
// import 'package:document_scanner_flutter/document_scanner_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import '../Models/Document Scanner Model.dart';
import '../Models/Image Upload Model.dart';
import '../Models/Verify Cust Model.dart';
import '../Services/Services.dart';
import 'linked_services.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:permission_handler/permission_handler.dart';

class DocumentScanner extends StatefulWidget {

  String phone = "";
  String email = "";
  String city = "";

  DocumentScanner(this.phone, this.email, this.city);

  @override
  _DocumentScanerState createState() => _DocumentScanerState();

}


class _DocumentScanerState extends State <DocumentScanner> {

  DocumentScannerModel? _documentScannerModel;
  VerifyCustModel? _verifyCustModel;
  SharedPreferences? prefs;

  TextEditingController _otp1 = TextEditingController();
  TextEditingController _otp2 = TextEditingController();
  TextEditingController _otp3 = TextEditingController();
  TextEditingController _otp4 = TextEditingController();
  TextEditingController _otp5 = TextEditingController();
  TextEditingController _otp6 = TextEditingController();
  TextEditingController _landSize = TextEditingController();

  List<String> assetType = ['Select Asset', 'Land', 'Car', 'House', 'Store'];
  String? selectedAssetType = 'Select Asset';
  List<String> assetId = ['Select Id', 'Passport', 'Car', 'House', 'Store'];
  String? selectedAssetId = 'Select Id';
  
  File? _residnceImage,_documentImage,_registerImage;

  String base64Image = "";
  String? otp;
  var stream;
  var length;
  var residanceUrl;
  var documentUrl;
  var registrationUrl;
  ImageUploadModel? _imageUploadModel;

  Future<void> residenceImage() async{
    prefs = await SharedPreferences.getInstance();
    print("function");
    try {
      if (_residnceImage != null) {
        print("condition${_residnceImage?.path}");

        _imageUploadModel = await Services.ResidenceImage(prefs!.getString("token").toString(), _residnceImage!);
        if(_imageUploadModel?.status!=false){
          print("residanceUrl ${_imageUploadModel?.data}");
          residanceUrl = _imageUploadModel?.data;
        }
      }
    }catch(e){
      print(e);
    }
  }

  Future<void> documentImage() async{
    prefs = await SharedPreferences.getInstance();
    print("function");
    print("_documentImage${_documentImage}");
    try {
      if (_documentImage != null) {
        print("condition");
        _imageUploadModel = await Services.DocumentImage(prefs!.getString("token").toString(), _documentImage!);
        if(_imageUploadModel?.status!=false){
          print("documentUrl ${_imageUploadModel?.data}");
          documentUrl = _imageUploadModel?.data;
        }
      }
    }catch(e){
      print(e);
    }
  }


  Future<void> registraionImage() async{
    prefs = await SharedPreferences.getInstance();
    print("function");
    try {
      if (_registerImage != null) {
        print("condition");
        _imageUploadModel = await Services.RegistrationImage(prefs!.getString("token").toString(), _registerImage!);
        if(_imageUploadModel?.status!=false){
          print("registrationUrl ${_imageUploadModel?.data}");
          registrationUrl = _imageUploadModel?.data;
        }
      }
    }catch(e){
      print(e);
    }
  }

  Future<void> pickImage() async {
    try{
      var status = await Permission.storage.status;
      if (status.isDenied) {
        // You can request multiple permissions at once.
        Map<Permission, PermissionStatus> statuses = await [
          Permission.storage,
          Permission.camera,
        ].request();
        print(statuses[Permission.storage]); // it should print PermissionStatus.granted
      }

      // var _resImage;
      // final _resImage =
      // await ImagePicker().pickImage(source: ImageSource.gallery);
      final _resImage =
      await ImagePicker().pickImage(source: ImageSource.camera,maxWidth: 1800,
        maxHeight: 1800);
      // _resImage = await ImagePicker().
      // pickImage(source: ImageSource.camera);

      setState((){
        if(_resImage != null){
          setState(() {
            _residnceImage = File(_resImage.path);

            // base64Image = base64Encode(selectedImage!.readAsBytesSync());
            // print('base64Image ${base64Image}');
          });
        }else{
          print('No image capture');
        }
      });
    }catch(e){
      print(e);
    }

  }


  void pickDocumentImage() async {
    try{
      var _docImage;
      _docImage = await ImagePicker().
      pickImage(source: ImageSource.camera);

      setState((){
        if(_docImage != null){
          setState(() {
            _documentImage = File(_docImage.path);
            // base64Image = base64Encode(selectedImage!.readAsBytesSync());
            // print('base64Image ${base64Image}');
          });
        }else{
          print('No image capture');
        }
      });
    }catch(e){
      print(e);
    }

  }

  Future<void> pickRegisterImage() async {
    try{
      var _regImage;
      _regImage = await ImagePicker().
      pickImage(source: ImageSource.camera);

      setState((){
        if(_regImage != null){
          setState(() {
            _registerImage = File(_regImage.path);
            // base64Image = base64Encode(selectedImage!.readAsBytesSync());
            // print('base64Image ${base64Image}');
          });
        }else{
          print('No image capture');
        }
      });
    }catch(e){
      print(e);
    }

  }


  Future<void> scan() async{
    prefs = await SharedPreferences.getInstance();
    _documentScannerModel = await Services.DocumentScan(prefs!.getString("token").toString(), residanceUrl, documentUrl, registrationUrl!, _landSize.text, selectedAssetType!, selectedAssetId!, widget.phone, widget.email as String, widget.city,);

    if(_documentScannerModel!.service?.allMatches("Linked") != null){

      _linkedDialog();
      Fluttertoast.showToast(msg: "${_documentScannerModel?.msg}",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER);

    }else{
      if(_documentScannerModel!.status == true) {
        print('true>>>>>>>>');
        _verifyDialog();

        Fluttertoast.showToast(msg: "${_documentScannerModel?.msg}",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER);

      }else{
        Fluttertoast.showToast(msg: "${_documentScannerModel?.msg}",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER);
      }
    }
  }

  Future<void> verify() async{
    prefs = await SharedPreferences.getInstance();
    otp = _otp1.text+_otp2.text+_otp3.text+_otp4.text+_otp5.text+_otp6.text;
    _verifyCustModel = await Services.VerifyCust(prefs!.getString("token").toString(), otp!, widget.phone);

    if(_verifyCustModel!.status == true){
      print('true>>>>>>>>');

      Fluttertoast.showToast(msg: "${_verifyCustModel?.msg}",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER);

    }else{
      Fluttertoast.showToast(msg: "${_verifyCustModel?.msg}",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER);
    }
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
       resizeToAvoidBottomInset: false,
       body: Stack(
         children: [
           Container(
             alignment: Alignment.topRight,
             child: Image.asset('images/login_stuff_31.png',
             height: 200,
             width: 150,),
           ),
           Container(
             alignment: Alignment.topRight,
             margin: EdgeInsets.fromLTRB(10, 40, 10, 0),
             child: Text('3/3',
             style: TextStyle(
               fontSize: 18,
               fontWeight: FontWeight.bold
             ),),
           ),
           Container(
             width: MediaQuery.of(context).size.width,
             height: MediaQuery.of(context).size.height,
             child: Container(
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.start,
                 crossAxisAlignment: CrossAxisAlignment.start,
                 children: [
                   Container(
                     child: Row(
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
                           child: Text('Register Customer 3',
                           style: TextStyle(
                             fontWeight: FontWeight.bold,
                             fontSize: 18
                           ),),
                         )
                       ],
                     ),
                   ),
                   Expanded(
                       child: Container(
                         width: MediaQuery.of(context).size.width,
                         child: Card(
                           margin: EdgeInsets.fromLTRB(10, 40, 10, 10),
                           elevation: 10,
                           shape: RoundedRectangleBorder(
                             borderRadius: BorderRadius.all(Radius.circular(10.0))
                           ),
                           color: Colors.white,
                           shadowColor: Colors.black,
                           child: SingleChildScrollView(
                             child: Container(
                               child: Column(
                                 mainAxisAlignment: MainAxisAlignment.start,
                                 crossAxisAlignment: CrossAxisAlignment.start,
                                 children: [
                                   Container(
                                     margin: EdgeInsets.fromLTRB(10, 20, 10, 20),
                                     child: Column(
                                       children: [
                                         Container(
                                           width: double.infinity,
                                           height: 60,
                                           child: TextField(
                                             controller: _landSize,
                                             decoration: InputDecoration(
                                               border: OutlineInputBorder(
                                                 borderSide: BorderSide(color: Colors.grey,
                                                 width: 5),
                                                 borderRadius: BorderRadius.all(
                                                   Radius.circular(10.0)
                                                 )
                                               ),
                                               counterText: "",
                                               prefixIcon: Padding(
                                                 padding: EdgeInsets.fromLTRB(10, 8, 10, 8),
                                                 child: Image.asset('images/login_stuff_21.png',
                                                 height: 10,
                                                 width: 10,),
                                               ),
                                             hintText: 'Land Size'
                                             ),
                                           ),
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
                                               items: assetType.
                                               map((item) => DropdownMenuItem<String>(
                                                   value: item,
                                                   child: Text(item,)
                                               ))
                                                   .toList(),
                                               onChanged: (item) => setState(() => selectedAssetType = item),
                                             )
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
                                               value: selectedAssetId,
                                               items: assetId.
                                               map((item) => DropdownMenuItem<String>(
                                                   value: item,
                                                   child: Container(
                                                     child: Text(item,),
                                                   ),
                                               ))
                                                   .toList(),
                                               onChanged: (item) => setState(() => selectedAssetId = item),
                                             )
                                         ),
                                         Container(
                                           height: 110,
                                           margin: EdgeInsets.only(top: 10),
                                           decoration: BoxDecoration(
                                           ),
                                           child: Column(
                                             children: [
                                               Container(
                                                 width: MediaQuery.of(context).size.width,
                                                 child: Card(
                                                   shape: RoundedRectangleBorder(
                                                       borderRadius: BorderRadius.only(
                                                           bottomRight: Radius.circular(10),
                                                           topRight: Radius.circular(10),
                                                       topLeft: Radius.circular(10),
                                                       bottomLeft: Radius.circular(10)),
                                                       side: BorderSide(color: Colors.grey)),
                                                   child: InkWell(
                                                     onTap: (){
                                                       // pickImage();
                                                       scanimages(context,0);
                                                       // openImagePicker(ImageSource.camera);
                                                     },
                                                     child: Column(
                                                       children: [
                                                         Container(
                                                           margin: EdgeInsets.only(top: 10),
                                                           child:_residnceImage!= null?
                                                               Image.file(
                                                                 _residnceImage!,
                                                                 // _residnceImage!,
                                                                 fit: BoxFit.cover,
                                                                 height: 50,
                                                               ): Image.asset('images/register_customer_05.png',
                                                           height: 50,),
                                                         ),
                                                         Container(
                                                           margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
                                                           child: Text('Proof of Residence'),
                                                         )
                                                       ],
                                                     ),
                                                   ),
                                                 ),
                                               )
                                             ],
                                           ),
                                         ),
                                         Container(
                                           height: 110,
                                           margin: EdgeInsets.only(top: 10),
                                           decoration: BoxDecoration(
                                           ),
                                           child: Column(
                                             children: [
                                               Container(
                                                 width: MediaQuery.of(context).size.width,
                                                 child: Card(
                                                   shape: RoundedRectangleBorder(
                                                       borderRadius: BorderRadius.only(
                                                           bottomRight: Radius.circular(10),
                                                           topRight: Radius.circular(10),
                                                       topLeft: Radius.circular(10),
                                                       bottomLeft: Radius.circular(10)),
                                                       side: BorderSide(color: Colors.grey)),
                                                   child: InkWell(
                                                     onTap: (){
                                                       scanimages(context,1);
                                                     },
                                                     child: Column(
                                                       children: [
                                                         Container(
                                                           margin: EdgeInsets.only(top: 10),
                                                           child: _documentImage!= null?
                                                           Image.file(
                                                             _documentImage!,
                                                             fit: BoxFit.cover,
                                                             height: 50,
                                                           ):Image.asset('images/register_customer_05.png',
                                                           height: 50,),
                                                         ),
                                                         Container(
                                                           margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
                                                           child: Text('Local Gov Doc'),
                                                         )
                                                       ],
                                                     ),
                                                   ),
                                                 ),
                                               )
                                             ],
                                           ),
                                         ),
                                         Container(
                                           height: 110,
                                           margin: EdgeInsets.only(top: 10),
                                           decoration: BoxDecoration(
                                           ),
                                           child: Column(
                                             children: [
                                               Container(
                                                 width: MediaQuery.of(context).size.width,
                                                 child: Card(
                                                   shape: RoundedRectangleBorder(
                                                       borderRadius: BorderRadius.only(
                                                           bottomRight: Radius.circular(10),
                                                           topRight: Radius.circular(10),
                                                       topLeft: Radius.circular(10),
                                                       bottomLeft: Radius.circular(10)),
                                                       side: BorderSide(color: Colors.grey)),
                                                   child: InkWell(
                                                     onTap: (){
                                                       scanimages(context,2);
                                                       // pickRegisterImage();
                                                     },
                                                     child: Column(
                                                       children: [
                                                         Container(
                                                           margin: EdgeInsets.only(top: 10),
                                                           child: _registerImage!=null?
                                                           Image.file(
                                                             _registerImage!,
                                                             fit: BoxFit.cover,
                                                             height: 50,
                                                           ): Image.asset('images/register_customer_05.png',
                                                           height: 50,),
                                                         ),
                                                         Container(
                                                           margin: EdgeInsets.only(top: 10.0, bottom: 10.0),
                                                           child: Text('Land Registration'),
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
                                   )
                                 ],
                               ),
                             ),
                           ),
                         ),
                       )),
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
                           scan();
                         },
                         textColor: Colors.white,
                         child: const Padding(
                           padding: EdgeInsets.all(10.0),
                           child: const Text('Submit', style: const TextStyle(fontSize: 18,),),
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

  // void navigaterUser(){
  //   Navigator.of(context).push(MaterialPageRoute(builder: (context) => CustomerProfile(),));
  // }

  void _verifyDialog(){
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
                    child: Text('Send to customer mobile no.',
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
                        ),
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
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    alignment: Alignment.center,
                    child: Text('Resend code after 00 sec',
                      style: TextStyle(fontWeight: FontWeight.bold),),
                  ),
                  Spacer(),
                  Expanded(
                    child: Container(
                      alignment: Alignment.bottomCenter,
                      child: Column(
                        children: [
                          Container(
                            alignment: Alignment.center,
                            child: Text('Resend code after 00 sec',
                              style: TextStyle(fontWeight: FontWeight.bold),),
                          ),
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
                                 verify();
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

  void _linkedDialog() {
    showDialog(context: context, builder: (context){
      return Container(
        child: Dialog(
            child: Container(
              height: 400,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                    Radius.circular(40.0)),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    alignment: Alignment.center,
                    padding: EdgeInsets.only(top: 20.0, bottom: 10.0),
                    child: Image.asset('images/handshake_06.png',
                      height: 70,),
                  ),
                  Container(
                    margin: EdgeInsets.all(10.0),
                    alignment: Alignment.center,
                    child: Text('This customer already has an active D-ID. Would you like to link it to other services?',
                      style: TextStyle(fontSize: 18,
                        fontWeight: FontWeight.bold,),
                    textAlign: TextAlign.center,),
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
                                  Navigator.of(context).push(
                                      MaterialPageRoute(builder: (context) =>  LinkedServices(widget.phone)));
                                },
                                textColor: Colors.white,
                                child: const Padding(
                                  padding: EdgeInsets.all(10.0),
                                  child: const Text('Yes', style: const TextStyle(fontSize: 18,),),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: (){
                              Navigator.pop(context);
                            },
                            child: Container(
                              alignment: Alignment.center,
                              child: Text('Cancel',
                                style: TextStyle(fontWeight: FontWeight.bold),),
                            ),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
        ),
      );
    });

  }



  void scanimages(BuildContext context,int from)async{
    try {
     File? scannedDoc = await DocumentScannerFlutter.launch(context,source: ScannerFileSource.CAMERA);

     if(from==0) {
       _residnceImage = scannedDoc;
       residenceImage();
     }else if(from==1) {
       _documentImage = scannedDoc;
       documentImage();
     }else if(from==2){
       _registerImage = scannedDoc;
       registraionImage();
     }
     setState(() {
     });
      // `scannedDoc` will be the image file scanned from scanner
    } on PlatformException {
      // 'Failed to get document path or operation cancelled!';
    }

  }


}

