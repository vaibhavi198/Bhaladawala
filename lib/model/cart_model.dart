class CartModel {
  String? status;
  String? message;
  List<CartData>? data;
  String? totalPrice;

  CartModel({this.status, this.message, this.data, this.totalPrice});

  CartModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <CartData>[];
      json['data'].forEach((v) {
        data!.add(CartData.fromJson(v));
      });
    }
    totalPrice = json['total_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['total_price'] = totalPrice;
    return data;
  }
}

class CartData {
  int? id;
  String? productId;
  String? name;
  String? sku;
  String? productType;
  String? image;
  List<String>? images;
  String? qty;
  String? regularPrice;
  String? salePrice;
  String? isItemFree;
  String? createdAt;

  CartData(
      {this.id,
        this.productId,
        this.name,
        this.sku,
        this.productType,
        this.image,
        this.images,
        this.qty,
        this.regularPrice,
        this.salePrice,
        this.isItemFree,
        this.createdAt});

  CartData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productId = json['product_id'];
    name = json['name'];
    sku = json['sku'];
    productType = json['product_type'];
    image = json['image'];
    images = json['images'].cast<String>();
    qty = json['qty'];
    regularPrice = json['regular_price'];
    salePrice = json['sale_price'];
    isItemFree = json['is_free_item'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['product_id'] = productId;
    data['name'] = name;
    data['sku'] = sku;
    data['product_type'] = productType;
    data['image'] = image;
    data['images'] = images;
    data['qty'] = qty;
    data['regular_price'] = regularPrice;
    data['sale_price'] = salePrice;
   data ['is_free_item'] =  isItemFree;
    data['created_at'] = createdAt;
    return data;
  }
}
