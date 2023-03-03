class UserStore {
  bool? status;
  String? msg;
  Data? data;

  UserStore({this.status, this.msg, this.data});

  UserStore.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class Data {
  FaceData? faceData;
  String? sId;
  String? createdAt;
  String? updatedAt;
  // int? iV;

  Data({this.faceData, this.sId, this.createdAt, this.updatedAt
    // , this.iV
  });

  Data.fromJson(Map<String, dynamic> json) {
    faceData = json['Face_data'] != null
        ? new FaceData.fromJson(json['Face_data'])
        : null;
    sId = json['_id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    // iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.faceData != null) {
      data['Face_data'] = this.faceData!.toJson();
    }
    data['_id'] = this.sId;
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    // data['__v'] = this.iV;
    return data;
  }
}

class FaceData {
  String? username;
  String? password;
  List<double>? facedata;

  FaceData({this.username, this.password, this.facedata});

  FaceData.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    password = json['password'];

    facedata =  List<double>.from(json["facedata"].map((x) => x.toDouble()));
    // facedata = json['facedata'].cast<double>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['password'] = this.password;

    data['facedata'] = List<dynamic>.from(facedata!.map((x) => x));
    // data['facedata'] = this.facedata;
    return data;
  }
}
