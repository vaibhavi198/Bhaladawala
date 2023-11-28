import 'dart:convert';

import 'package:bhaladawala_app/Api/api_handler.dart';
import 'package:bhaladawala_app/model/category_data_model.dart';
import 'package:bhaladawala_app/model/category_list_model.dart';
import 'package:bhaladawala_app/shared_preference/shared_preference_manager.dart';
import 'package:bhaladawala_app/utils/app_strings.dart';

class CategoryRepo {
  List<CategoryDataModel>? categoryList = [];
  late APIHandler handler;

  CategoryRepo() {
    handler = APIHandler();
  }

  Future<String> getCategoryList() async {
    String responseMessage = '';
    String endpoint = '/category_list';

    var map = Map<String, dynamic>();
    map['token'] = SharedPrefManager.shared.sharedPres.getString(AppStrings.token);
    map['page'] = '1';
    try {
      var response = await handler.postRequest(endpoint, parameters: map);

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        CategoryListModel categoryListModel = CategoryListModel.fromJson(data);
        categoryList?.addAll(categoryListModel.data ?? []);
      }
    } catch (e) {
      throw e;
    }

    return responseMessage;
  }
}
