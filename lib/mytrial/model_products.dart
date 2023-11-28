/*class ProductListModel {
  String? status;
  String? message;
  List<ProductData>? data;
  int? totalPage;

  ProductListModel({this.status, this.message, this.data, this.totalPage});

  ProductListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <ProductData>[];
      json['data'].forEach((v) {
        data!.add(ProductData.fromJson(v));
      });
    }
    totalPage = json['total_page'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['status'] = status;
    data['message'] = message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    data['total_page'] = totalPage;
    return data;
  }
}*/

/*class ProductData {
  int? id;
  String? categoryId;
  String? name;
  String? sku;
  String? unitQty;
  String? unitRegularPrice;
  String? unitSalePrice;
  String? unitDescription;
  String? quantityQty;
  String? quantityRegularPrice;
  String? quantitySalePrice;
  String? quantityDescription;
  String? weight;
  String? isIncludeTax;
  String? description;
  String? isLimitDeal;
  String? isExplore;
  String? createdAt;
  String? image;
  List<String>? images;
  bool? isUnitSelected;

  ProductData(
      {this.id,
        this.categoryId,
        this.name,
        this.sku,
        this.unitQty,
        this.unitRegularPrice,
        this.unitSalePrice,
        this.unitDescription,
        this.quantityQty,
        this.quantityRegularPrice,
        this.quantitySalePrice,
        this.quantityDescription,
        this.weight,
        this.isIncludeTax,
        this.description,
        this.isLimitDeal,
        this.isExplore,
        this.createdAt,
        this.image,
        this.images,
        this.isUnitSelected = false});

  ProductData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    categoryId = json['category_id'];
    name = json['name'];
    sku = json['sku'];
    unitQty = json['unit_qty'];
    unitRegularPrice = json['unit_regular_price'];
    unitSalePrice = json['unit_sale_price'];
    unitDescription = json['unit_description'];
    quantityQty = json['quantity_qty'];
    quantityRegularPrice = json['quantity_regular_price'];
    quantitySalePrice = json['quantity_sale_price'];
    quantityDescription = json['quantity_description'];
    weight = json['weight'];
    isIncludeTax = json['is_include_tax'];
    description = json['description'];
    isLimitDeal = json['is_limit_deal'];
    isExplore = json['is_explore'];
    createdAt = json['created_at'];
    image = json['image'];
    images = json['images'].cast<String>();
    isUnitSelected = json['isUnitSelected'] ?? false;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = id;
    data['category_id'] = categoryId;
    data['name'] = name;
    data['sku'] = sku;
    data['unit_qty'] = unitQty;
    data['unit_regular_price'] = unitRegularPrice;
    data['unit_sale_price'] = unitSalePrice;
    data['unit_description'] = unitDescription;
    data['quantity_qty'] = quantityQty;
    data['quantity_regular_price'] = quantityRegularPrice;
    data['quantity_sale_price'] = quantitySalePrice;
    data['quantity_description'] = quantityDescription;
    data['weight'] = weight;
    data['is_include_tax'] = isIncludeTax;
    data['description'] = description;
    data['is_limit_deal'] = isLimitDeal;
    data['is_explore'] = isExplore;
    data['created_at'] = createdAt;
    data['image'] = image;
    data['images'] = images;
    data['isUnitSelected'] = isUnitSelected;
    return data;
  }
}*/
