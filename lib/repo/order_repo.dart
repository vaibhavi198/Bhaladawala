import 'dart:convert';
import 'package:bhaladawala_app/Api/api_handler.dart';
import 'package:bhaladawala_app/model/base_model.dart';
import 'package:bhaladawala_app/model/get_order_model.dart';
import 'package:bhaladawala_app/model/order_detail_model.dart';
import 'package:bhaladawala_app/model/order_list_model.dart';
import 'package:bhaladawala_app/shared_preference/shared_preference_manager.dart';
import 'package:bhaladawala_app/utils/app_strings.dart';

class OrderRepo {
  late APIHandler handler;
  List<GetOrderData>? getOrderData = [];
  OrderDetailData? orderDetailData;
  List<OrderListData>? orderListData = [];

   OrderRepo() {
    handler = APIHandler();
  }

  String token = SharedPrefManager.shared.sharedPres.getString(AppStrings.token) ?? '';

  Future<String> generatedOrder(String storeId, String totalPrice) async {
    String endpoint = '/generate_order';
    String responseMessage = '';

    var map = Map<String, dynamic>();
    map['token'] = token;
    map['store_id'] = storeId;
    map['total_price'] = totalPrice;
    print(map);
    try {
      var response = await handler.postRequest(endpoint, parameters: map);
      final Map<String, dynamic> data = json.decode(response.body);
      BaseModel model = BaseModel.fromJson(data);
      responseMessage = model.status.toString();
    } catch (e) {
      throw e;
    }

     return responseMessage;
  }

  Future<String> reGeneratedOrder(String orderId, String productId) async {
    String endpoint = '/re_generate_order';
    String responseMessage = '';

    var map = Map<String, dynamic>();
    map['token'] = token;
    map['order_id'] = orderId;
    map['product_id'] = productId;

    print(map);
    try {
      var response = await handler.postRequest(endpoint, parameters: map);
      final Map<String, dynamic> data = json.decode(response.body);
      BaseModel model = BaseModel.fromJson(data);
      responseMessage = model.status.toString();
    } catch (e) {
      throw e;
    }

    return responseMessage;
  }

  Future<List<GetOrderData>?> getOrder() async {
    String endpoint = '/get_my_orders';
    var map = Map<String, dynamic>();
    map['token'] = token;
    map['page'] = '1';

    print(map);
    try {
      var response = await handler.postRequest(endpoint, parameters: map);
      final Map<String, dynamic> data = json.decode(response.body);
      GetOrderModel model = GetOrderModel.fromJson(data);

      getOrderData?.addAll(model.data ?? []);
      print("getOrderData:::${jsonEncode(getOrderData)}");
    } catch (e) {
      print("Error:::${e}");
      throw e;
    }
    return getOrderData;
  }

  Future<void> getOrderList() async {
    String endpoint = '/get_order_list';
    var map = Map<String, dynamic>();
    map['token'] = token;
    map['page'] = '1';

    print(map);
    try {
      var response = await handler.postRequest(endpoint, parameters: map);
      final Map<String, dynamic> data = json.decode(response.body);
      OrderListModel model = OrderListModel.fromJson(data);
      orderListData?.addAll(model.data ?? []);
      print("getOrderData:::${jsonEncode(orderListData)}");
    } catch (e) {
      print("Error:::${e}");
      throw e;
    }
  }

  Future<void> getOrderDetails() async {
    String endpoint = '/get_order_details';
    var map = Map<String, dynamic>();
    map['token'] = token;
    map['order_id'] = '7';

    print(map);
    try {
      var response = await handler.postRequest(endpoint, parameters: map);
      final Map<String, dynamic> data = json.decode(response.body);
      OrderDetailsModel model = OrderDetailsModel.fromJson(data);
      orderDetailData = model.data;
      print("getOrderData:::${jsonEncode(orderDetailData)}");
    } catch (e) {
      print("Error:::${e}");
      throw e;
    }
  }
}




