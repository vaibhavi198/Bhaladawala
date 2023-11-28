class StoreModel {
  String? status;
  String? message;
  List<Data>? data;

  StoreModel({this.status, this.message, this.data});

  StoreModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? id;
  String? store;
  String? storeAddress;
  String? latitude;
  String? longitude;
  String? createdAt;

  Data(
      {this.id,
        this.store,
        this.storeAddress,
        this.latitude,
        this.longitude,
        this.createdAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    store = json['store'];
    storeAddress = json['store_address'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['store'] = this.store;
    data['store_address'] = this.storeAddress;
    data['latitude'] = this.latitude;
    data['longitude'] = this.longitude;
    data['created_at'] = this.createdAt;
    return data;
  }
}
