class GetOrderModel {
  String? status;
  String? message;
  List<GetOrderData>? data;
  int? totalPage;

  GetOrderModel({this.status, this.message, this.data, this.totalPage});

  GetOrderModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <GetOrderData>[];
      json['data'].forEach((v) {
        data!.add(GetOrderData.fromJson(v));
      });
    }
    totalPage = json['total_page'];
  }

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

class GetOrderData {
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

  GetOrderData(
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

  GetOrderData.fromJson(Map<String, dynamic> json) {
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
