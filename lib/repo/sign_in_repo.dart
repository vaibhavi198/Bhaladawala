import 'dart:convert';
import 'package:bhaladawala_app/Api/api_handler.dart';
import 'package:bhaladawala_app/model/login_model.dart';
import 'package:bhaladawala_app/shared_preference/shared_preference_manager.dart';

class SignInRepo {
  late APIHandler handler;

  SignInRepo() {
    handler = APIHandler();
  }

  Future<String> sigInRequest(String loginEmail, String password, String deviceToken, String deviceType) async {
    String endpoint = "/login";
    String responseMessage = "";

    var map = Map<String,dynamic>();
    map['email'] = loginEmail;
    map['password'] = password;
    map['device_token']= deviceToken;
    map['device_type']= deviceType;

    var response = await handler.postRequest(endpoint, parameters: map);

    if(response.statusCode == 200){
      final Map<String, dynamic> data = json.decode(response.body);
      LoginModel loginModel = LoginModel.fromJson(data);
      responseMessage = loginModel.message.toString();
      SharedPrefManager.shared.saveToken(loginModel.data?.token);
    }
    return responseMessage;
  }
}
