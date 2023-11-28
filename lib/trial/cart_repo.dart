import 'dart:convert';
import 'package:bhaladawala_app/Api/api_handler.dart';
import 'package:bhaladawala_app/model/base_model.dart';
import 'package:bhaladawala_app/model/cart_model.dart';
import '../shared_preference/shared_preference_manager.dart';
import '../utils/app_strings.dart';

class AddCartRepoTrial {
  late APIHandler handler;
  List<CartData>? cartListData = [];
  String totalPriceOfCart = '';

  AddCartRepoTrial() {
    handler = APIHandler();
  }

  String token = SharedPrefManager.shared.sharedPres.getString(
      AppStrings.token) ?? '';


  Future<String> addToCartTrial(String productId, String productType, String qty,
      String regularPrice, String salePrice,) async {
    String endpoint = '/add_to_cart';

    String responseMessage = '';
    var map = Map<String, dynamic>();
    map['token'] = token;
    map['product_id'] = productId;
    map['product_type'] = productType;
    map['qty'] = qty;
    map['regular_price'] = regularPrice;
    map['sale_price'] = salePrice;

    try {
      var response = await handler.postRequest(endpoint, parameters: map);
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        BaseModel model = BaseModel.fromJson(data);
        responseMessage = model.status.toString();
      }
    } catch (e) {
      throw e;
    }

    return responseMessage;
  }
}