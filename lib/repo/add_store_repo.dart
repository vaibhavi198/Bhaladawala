import 'dart:convert';

import 'package:bhaladawala_app/Api/api_handler.dart';
import 'package:bhaladawala_app/model/base_model.dart';
import 'package:bhaladawala_app/shared_preference/shared_preference_manager.dart';
import 'package:bhaladawala_app/utils/app_strings.dart';

class AddStoreRepo {
  late APIHandler handler;

  AddStoreRepo() {
    handler = APIHandler();
  }

  Future<String> addStore(String storeName, String storeAddress) async {
    String endpoint = '/add_store';
    String responseMessage = '';
    var map = Map<String, dynamic>();
    map['token'] =
        SharedPrefManager.shared.sharedPres.getString(AppStrings.token);
    map['store'] = storeName;
    map['store_address'] = storeAddress;
    map['latitude'] = "11";
    map['longitude'] = "22";
    var response = await handler.postRequest(endpoint, parameters: map);
    if (response.statusCode == 200) {
      final Map<String, dynamic> data = json.decode(response.body);
      BaseModel baseModel = BaseModel.fromJson(data);
      responseMessage = baseModel.status.toString();
    }
    return responseMessage;
  }
}
