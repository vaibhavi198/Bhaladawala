import 'dart:convert';
import 'package:bhaladawala_app/Api/api_handler.dart';
import 'package:bhaladawala_app/model/product_detail_model.dart';
import 'package:bhaladawala_app/model/product_list.dart';
import 'package:bhaladawala_app/shared_preference/shared_preference_manager.dart';
import 'package:bhaladawala_app/utils/app_strings.dart';

class ProductRepo {
  late APIHandler handler;
  List<ProductData>? productList = [];
  ProductDetailData? productDetails;

  ProductRepo() {
    handler = APIHandler();
  }

  Future<void> getProductList(String id) async {
    String endpoint = '/product_list';

    var map = Map<String, dynamic>();
    map['token'] = SharedPrefManager.shared.sharedPres.getString(AppStrings.token);
    map['category_id'] = id;
    map['page'] = '1';

    try {
      var response = await handler.postRequest(endpoint, parameters: map);
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        ProductListModel model = ProductListModel.fromJson(data);
        productList?.addAll(model.data ?? []);
        //print(productList?.length);
      }
    } catch (e) {
      throw e;
    }
  }

  Future<void> getProductDetail(String id) async{
    String endpoint = '/product_details';

    var map = Map<String, dynamic>();
    map['token'] = SharedPrefManager.shared.sharedPres.getString(AppStrings.token);
    map['product_id'] = id;

    try {
      var response = await handler.postRequest(endpoint, parameters: map);
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        ProductDetailModel model = ProductDetailModel.fromJson(data);
        productDetails = model.data;
        print("productDetails::${productDetails}");

      }
    } catch (e) {
      throw e;
    }
  }

}
