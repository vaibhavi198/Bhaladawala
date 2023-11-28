import 'package:bhaladawala_app/model/base_model.dart';
import 'package:flutter/foundation.dart';

import 'category_data_model.dart';

class CategoryListModel extends BaseModel {

  List<CategoryDataModel>? data;
  int? totalPage;

  CategoryListModel({ this.data, this.totalPage});

  CategoryListModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['data'] != null) {
      data = <CategoryDataModel>[];
      json['data'].forEach((v) {
        data!.add(CategoryDataModel.fromJson(v));
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