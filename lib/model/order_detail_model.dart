import 'package:bhaladawala_app/model/base_model.dart';

class OrderDetailsModel extends BaseModel{

  OrderDetailData? data;

  OrderDetailsModel({ this.data});

  OrderDetailsModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? OrderDetailData.fromJson(json['data']) : null;
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

class OrderDetailData {
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
  Products? products;
  String? createdAt;
  String? updatedAt;

  OrderDetailData(
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
        this.products,
        this.createdAt,
        this.updatedAt});

  OrderDetailData.fromJson(Map<String, dynamic> json) {
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
    products = json['products'] != null
        ? Products.fromJson(json['products'])
        : null;
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
    if (products != null) {
      data['products'] = products!.toJson();
    }
    data['created_at'] = createdAt;
    data['updated_at'] = updatedAt;
    return data;
  }
}

class Products {
  int? id;
  String? orderId;
  String? categoryId;
  String? productId;
  String? name;
  String? sku;
  String? productType;
  String? qty;
  String? regularPrice;
  String? salePrice;
  String? description;
  String? weight;
  String? productDescription;
  String? createdAt;
  String? image;
  List<String>? images;

  Products(
      {this.id,
        this.orderId,
        this.categoryId,
        this.productId,
        this.name,
        this.sku,
        this.productType,
        this.qty,
        this.regularPrice,
        this.salePrice,
        this.description,
        this.weight,
        this.productDescription,
        this.createdAt,
        this.image,
        this.images});

  Products.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    orderId = json['order_id'];
    categoryId = json['category_id'];
    productId = json['product_id'];
    name = json['name'];
    sku = json['sku'];
    productType = json['product_type'];
    qty = json['qty'];
    regularPrice = json['regular_price'];
    salePrice = json['sale_price'];
    description = json['description'];
    weight = json['weight'];
    productDescription = json['product_description'];
    createdAt = json['created_at'];
    image = json['image'];
    images = json['images'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['order_id'] = orderId;
    data['category_id'] = categoryId;
    data['product_id'] = productId;
    data['name'] = name;
    data['sku'] = sku;
    data['product_type'] = productType;
    data['qty'] = qty;
    data['regular_price'] = regularPrice;
    data['sale_price'] = salePrice;
    data['description'] = description;
    data['weight'] = weight;
    data['product_description'] = productDescription;
    data['created_at'] = createdAt;
    data['image'] = image;
    data['images'] = images;
    return data;
  }
}
