import 'dart:convert';

import 'package:bhaladawala_app/Api/api_handler.dart';
import 'package:bhaladawala_app/model/base_model.dart';

class ForgotPasswordRepo {
  late APIHandler handler;

  ForgotPasswordRepo() {
    handler = APIHandler();
  }

  Future<String> forgotPasswordRequest(String forgotEmail) async {
    String endpoint = "/forgot_password";
    String responseMessage = "";

    var map = Map<String, dynamic>();
    map['email'] = forgotEmail;
    var response = await handler.postRequest(endpoint, parameters: map);
    if(response.statusCode == 200){
      final Map<String, dynamic> data = json.decode(response.body);
      BaseModel baseModel = BaseModel.fromJson(data);
      responseMessage = baseModel.message.toString();
    }
    return responseMessage;
  }
}
