import 'package:bhaladawala_app/model/base_model.dart';

class OrderListModel extends BaseModel{

  List<OrderListData>? data;
  int? totalPage;

  OrderListModel({ this.data, this.totalPage});

  OrderListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <OrderListData>[];
      json['data'].forEach((v) {
        data!.add(OrderListData.fromJson(v));
      });
    }
    totalPage = json['total_page'];
  }

  @override
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['total_page'] = totalPage;
    return data;
  }
}

class OrderListData {
  int? id;
  String? userId;
  String? firstName;
  String? lastName;
  String? countryCode;
  String? phoneNumber;
  String? email;
  String? storeId;
  String? store;
  String? storeAddress;
  String? latitude;
  String? longitude;
  String? price;
  String? point;
  String? redeemAmount;
  String? totalPrice;
  String? orderType;
  String? orderStatus;
  String? paymentStatus;
  int? totalProduct;
  String? createdAt;
  String? updatedAt;

  OrderListData(
      {this.id,
        this.userId,
        this.firstName,
        this.lastName,
        this.countryCode,
        this.phoneNumber,
        this.email,
        this.storeId,
        this.store,
        this.storeAddress,
        this.latitude,
        this.longitude,
        this.price,
        this.point,
        this.redeemAmount,
        this.totalPrice,
        this.orderType,
        this.orderStatus,
        this.paymentStatus,
        this.totalProduct,
        this.createdAt,
        this.updatedAt});

  OrderListData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    countryCode = json['country_code'];
    phoneNumber = json['phone_number'];
    email = json['email'];
    storeId = json['store_id'];
    store = json['store'];
    storeAddress = json['store_address'];
    latitude = json['latitude'];
    longitude = json['longitude'];
    price = json['price'];
    point = json['point'];
    redeemAmount = json['redeem_amount'];
    totalPrice = json['total_price'];
    orderType = json['order_type'];
    orderStatus = json['order_status'];
    paymentStatus = json['payment_status'];
    totalProduct = json['total_product'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['user_id'] = userId;
    data['first_name'] = firstName;
    data['last_name'] = lastName;
    data['country_code'] = countryCode;
    data['phone_number'] = phoneNumber;
    data['email'] = email;
    data['store_id'] = storeId;
    data['store'] = store;
    data['store_address'] = storeAddress;
    data['latitude'] = latitude;
    data['longitude'] = longitude;
    data['price'] = price;
    data['point'] = point;
    data['redeem_amount'] = redeemAmount;
    data['total_price'] = totalPrice;
    data['order_type'] = orderType;
    data['order_status'] = orderStatus;
    data['payment_status'] = paymentStatus;
    data['total_product'] = totalProduct;
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}
