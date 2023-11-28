import 'package:bhaladawala_app/model/base_model.dart';
import 'package:bhaladawala_app/model/category_data_model.dart';

class HomeModel extends BaseModel {
  Data? data;

  HomeModel({this.data});

  HomeModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
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

class Data {
  List<Offer>? offer;
  List<CategoryDataModel>? category;
  List<LimitDealData>? limitDealData;
  List<ExploreData>? exploreData;

  Data({this.offer, this.category, this.limitDealData, this.exploreData});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['offer'] != null) {
      offer = <Offer>[];
      json['offer'].forEach((v) {
        offer!.add(Offer.fromJson(v));
      });
    }
    if (json['category'] != null) {
      category = <CategoryDataModel>[];
      json['category'].forEach((v) {
        category!.add(CategoryDataModel.fromJson(v));
      });
    }
    if (json['limit_deal_data'] != null) {
      limitDealData = <LimitDealData>[];
      json['limit_deal_data'].forEach((v) {
        limitDealData!.add(LimitDealData.fromJson(v));
      });
    }
    if (json['explore_data'] != null) {
      exploreData = <ExploreData>[];
      json['explore_data'].forEach((v) {
        exploreData!.add(ExploreData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (offer != null) {
      data['offer'] = offer!.map((v) => v.toJson()).toList();
    }
    if (category != null) {
      data['category'] = category!.map((v) => v.toJson()).toList();
    }
    if (limitDealData != null) {
      data['limit_deal_data'] = limitDealData!.map((v) => v.toJson()).toList();
    }
    if (exploreData != null) {
      data['explore_data'] = exploreData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Offer {
  int? id;
  String? offerTitle;
  String? offerText;
  String? startDatetime;
  String? endDatetime;
  String? offerType;
  String? minAmount;
  String? freeProductId;
  String? image;

  Offer(
      {this.id,
      this.offerTitle,
      this.offerText,
      this.startDatetime,
      this.endDatetime,
      this.offerType,
      this.minAmount,
      this.freeProductId,
      this.image});

  Offer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    offerTitle = json['offer_title'];
    offerText = json['offer_text'];
    startDatetime = json['start_datetime'];
    endDatetime = json['end_datetime'];
    offerType = json['offer_type'];
    minAmount = json['min_amount'];
    freeProductId = json['free_product_id'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['offer_title'] = offerTitle;
    data['offer_text'] = offerText;
    data['start_datetime'] = startDatetime;
    data['end_datetime'] = endDatetime;
    data['offer_type'] = offerType;
    data['min_amount'] = minAmount;
    data['free_product_id'] = freeProductId;
    data['image'] = image;
    return data;
  }
}



class LimitDealData {
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

  LimitDealData(
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
      this.images});

  LimitDealData.fromJson(Map<String, dynamic> json) {
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
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
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
    return data;
  }
}

class ExploreData {
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
  String? isExplore;
  String? createdAt;
  String? image;
  List<String>? images;

  ExploreData(
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
      this.isExplore,
      this.createdAt,
      this.image,
      this.images});

  ExploreData.fromJson(Map<String, dynamic> json) {
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
    isExplore = json['is_explore'];
    createdAt = json['created_at'];
    image = json['image'];
    images = json['images'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
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
    data['is_explore'] = isExplore;
    data['created_at'] = createdAt;
    data['image'] = image;
    data['images'] = images;
    return data;
  }
}
