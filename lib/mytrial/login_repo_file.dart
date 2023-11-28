/*
import 'dart:convert';

import 'package:bhaladawala_app/Api/api_handler.dart';
import 'package:bhaladawala_app/shared_preference/shared_preference_manager.dart';

import '../model/login_model.dart';

class LoginRepo {
  late APIHandler handler;

  LoginRepo() {
    handler = APIHandler();
  }

  Future<String> loginRequestTrial(String mailId, String password, String deviceToken, String deviceType) async {
    String endpoint = "/login"; // Url endpoint
    String responseMessage = "";

    var map = Map<String, dynamic>();
    map['email'] = mailId;
    map['password'] = password;
    map['device_token']= deviceToken;
    map['device_type']= deviceType;


    var response = await handler.postRequest(endpoint, parameters: map); // jyre user login btn pr click krse tyare code ahiya wait krse jova jse k credientials valid che k nai

    if(response.statusCode == 200){  // If message gets correct
      final Map<String, dynamic> data = json.decode(response.body);  //Response stores into the data which receives from the postman response
      LoginModel loginModel = LoginModel.fromJson(data);
      responseMessage = loginModel.message.toString();
      SharedPrefManager.shared.saveToken(loginModel.data?.token); // one screen to another navigate kariye toh ae user ni Id or data kase store karava mate
    }
    return responseMessage; // this is the last step responseMessage ne return kari dese

  }

}

*/
