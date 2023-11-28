import 'dart:convert';
import 'package:bhaladawala_app/Api/api_handler.dart';
import 'package:bhaladawala_app/model/base_model.dart';
import 'package:bhaladawala_app/model/cart_model.dart';
import 'package:bhaladawala_app/model/store_model.dart';
import 'package:bhaladawala_app/shared_preference/shared_preference_manager.dart';
import 'package:bhaladawala_app/utils/app_strings.dart';


class AddCartRepo {
  late APIHandler handler;
  List<CartData>? cartListData = [];
  String totalPriceOfCart = '';

  AddCartRepo() {
    handler = APIHandler();
  }

      String token = SharedPrefManager.shared.sharedPres.getString(AppStrings.token) ?? '';



  Future<String> addToCart(String productId, String productType, String qty,
      String regularPrice, String salePrice, ) async {
    String endpoint = '/add_to_cart';
    String responseMessage = '';
    var map = Map<String, dynamic>();
    map['token'] = token;
    map['product_id'] = productId;
    map['product_type'] = productType;
    map['qty'] = qty;
    map['regular_price'] = regularPrice;
    map['sale_price'] = salePrice;
    print(map);

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

  Future<List<CartData>?>  getCartListItem() async {
    String endpoint = '/cart_list';

    var map = Map<String, dynamic>();
    map['token'] = token;
    print(token);

    try {
      var response = await handler.postRequest(endpoint, parameters: map);
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        CartModel model = CartModel.fromJson(data);
        cartListData?.addAll(model.data ?? []);
        totalPriceOfCart = model.totalPrice.toString();
        print("cartList:::${jsonEncode(cartListData)}");
      }
    } catch (e) {
      throw e;
    }
    return cartListData;
  }





  Future<String> removeCartItem(String id) async {
    String endpoint = '/remove_cart_item';
    String responseMessage = '';
    var map = Map<String, dynamic>();
    map['token'] = token;
    map['prouct_id'] = id;
    try {
      var response = await handler.postRequest(endpoint, parameters: map);
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        CartModel model = CartModel.fromJson(data);
        responseMessage = model.status.toString();
      }
    } catch (e) {
      throw e;
    }
    return responseMessage;
  }

  Future<String> placeOrder() async {
    String endpoint = '/get_all_store';
    String responseMessage = '';
    var map = Map<String, dynamic>();
    map['token'] = token;

    try {
      var response = await handler.postRequest(endpoint, parameters: map);
      print(jsonEncode(response.body));
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        StoreModel model = StoreModel.fromJson(data);
        responseMessage = model.status.toString();
        SharedPrefManager.shared.sharedPres.setString("store Id", model.data!.first.id.toString()) ?? '';
        print(model.data?.first.id);
      }
    } catch (e) {
      throw e;
    }
    return responseMessage;
  }

}
