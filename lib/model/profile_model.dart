import 'package:bhaladawala_app/model/base_model.dart';

class ProfileModel extends BaseModel{

  ProfileData? data;

  ProfileModel({this.data});

  ProfileModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? ProfileData.fromJson(json['data']) : null;
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    return data;
  }
}

class ProfileData {
  int? id;
  String? token;
  String? firstName;
  String? lastName;
  String? email;
  String? countryCode;
  String? phoneNumber;
  String? point;
  List<StoreList>? storeList;
  String? notificationStatus;
  String? createdAt;

  ProfileData(
      {this.id,
        this.token,
        this.firstName,
        this.lastName,
        this.email,
        this.countryCode,
        this.phoneNumber,
        this.point,
        this.storeList,
        this.notificationStatus,
        this.createdAt});

  ProfileData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    token = json['token'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    email = json['email'];
    countryCode = json['country_code'];
    phoneNumber = json['phone_number'];
    point = json['point'];
    if (json['store_list'] != null) {
      storeList = <StoreList>[];
      json['store_list'].forEach((v) {
        storeList!.add(StoreList.fromJson(v));
      });
    }
    notificationStatus = json['notification_status'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['token'] = token;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['email'] = email;
    data['country_code'] = countryCode;
    data['phone_number'] = phoneNumber;
    data['point'] = point;
    if (storeList != null) {
      data['store_list'] = storeList!.map((v) => v.toJson()).toList();
    }
    data['notification_status'] = notificationStatus;
    data['created_at'] = createdAt;
    return data;
  }
}

class StoreList {
  int? id;
  String? store;
  String? storeAddress;
  String? latitude;
  String? longitude;
  String? createdAt;

  StoreList(
      {this.id,
        this.store,
        this.storeAddress,
        this.latitude,
        this.longitude,
        this.createdAt});

  StoreList.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    store = json['store'];
    storeAddress = json['store_address'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['store'] = store;
    data['store_address'] = storeAddress;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['created_at'] = createdAt;
    return data;
  }
}
