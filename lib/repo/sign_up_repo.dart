import 'dart:convert';

import 'package:bhaladawala_app/Api/api_handler.dart';
import 'package:bhaladawala_app/model/base_model.dart';

class SignUpRepo {
  late APIHandler handler;

  SignUpRepo() {
    handler = APIHandler();
  }

  Future<String> signUpRequest(
    String firstName,
    String lastName,
    String emailAddress,
    String password,
    String mobileNumber,
    String addStore,
    String storeAddress,
    String pin,
    String countryPin,
  ) async {
    String endpoint = "/register_user";
    String registerMessage = '';
    var map = Map<String, dynamic>();
    map['first_name'] = firstName;
    map['last_name'] = lastName;
    map['email'] = emailAddress;
    map['password'] = password;
    map['country_code'] = '91';
    map['phone_number'] = mobileNumber;
    map['store'] = addStore;
    map['store_address'] = storeAddress;
    map['latitude'] = '75.22';
    map['longitude'] = '32.22';
    try {
      var response = await handler.postRequest(endpoint, parameters: map);
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        BaseModel baseModel = BaseModel.fromJson(data);
        registerMessage = baseModel.status.toString();
      }

    } catch (e) {
      throw e;
    }

   return registerMessage;
  }
}
