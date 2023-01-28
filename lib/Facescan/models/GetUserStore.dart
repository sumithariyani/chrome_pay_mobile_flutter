class GetUserStore {
  bool? status;
  String? msg;
  List<GetData>? data;

  GetUserStore({this.status, this.msg, this.data});

  GetUserStore.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    msg = json['msg'];
    if (json['data'] != null) {
      data = <GetData>[];
      json['data'].forEach((v) {
        data!.add(new GetData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class GetData {
  String? sId;
  FaceData2? faceData;
  String? createdAt;
  String? updatedAt;
  int? iV;

  GetData({this.sId, this.faceData, this.createdAt, this.updatedAt, this.iV});

  GetData.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    faceData = json['Face_data'] != null
        ? new FaceData2.fromJson(json['Face_data'])
        : null;
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    if (this.faceData != null) {
      data['Face_data'] = this.faceData!.toJson();
    }
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class FaceData2 {
  String? username;
  String? password;
  List<double>? facedata;

  FaceData2({this.username, this.password, this.facedata});

  FaceData2.fromJson(Map<String, dynamic> json) {
    username = json['username'];
    password = json['password'];
    facedata = json['facedata'].cast<double>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['username'] = this.username;
    data['password'] = this.password;
    data['facedata'] = this.facedata;
    return data;
  }
}
