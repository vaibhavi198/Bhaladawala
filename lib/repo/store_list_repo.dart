import 'dart:convert';
import 'package:bhaladawala_app/Api/api_handler.dart';
import 'package:bhaladawala_app/model/store_list_modal.dart';
import 'package:bhaladawala_app/shared_preference/shared_preference_manager.dart';
import 'package:bhaladawala_app/utils/app_strings.dart';

class StoreListRepo{
  List<StoreListData>? storeListData = [];

  late APIHandler handler;

  StoreListRepo(){
    handler = APIHandler();
  }
  String token = SharedPrefManager.shared.sharedPres.getString(AppStrings.token) ?? '';


  Future<void> storeList() async {
    String endpoint = '/get_all_store';
    var map = Map<String, dynamic>();
    map['token'] = token;

    try {
      var response = await handler.postRequest(endpoint, parameters: map);

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        StoreListModal storeListModel = StoreListModal.fromJson(data);
        storeListData?.addAll(storeListModel.data ?? []);

        print("StoreListData:::${storeListModel.data}");
      }
    } catch (e) {
      throw e;
    }
  }

}