import 'dart:convert';
import 'package:bhaladawala_app/Api/api_handler.dart';
import 'package:bhaladawala_app/model/base_model.dart';
import 'package:bhaladawala_app/model/profile_model.dart';
import 'package:bhaladawala_app/shared_preference/shared_preference_manager.dart';
import 'package:bhaladawala_app/utils/app_strings.dart';

class ProfileRepo {
  late APIHandler handler;
  ProfileData? profileData;

  ProfileRepo() {
    handler = APIHandler();
  }

  String token = SharedPrefManager.shared.sharedPres.getString(AppStrings.token) ?? '';

  Future<void> getProfileData() async {
    String endpoint = '/get_user_profile';
    var map = Map<String, dynamic>();
    map['token'] = token;

    try {
      var response = await handler.postRequest(endpoint, parameters: map);

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        ProfileModel model = ProfileModel.fromJson(data);
        profileData = model.data;
        print("profileData:::${profileData}");
      }
    } catch (e) {
      throw e;
    }
  }

  Future<String> editProfileData(String firstName, String lastName,

      String email, String countryCode, String phoneNumber) async {
    String endpoint = '/update_customer_profile';
    String responseMessage = '';
    var map = Map<String, dynamic>();
    map['token'] = token;
    map['first_name'] = firstName;
    map['last_name'] = lastName;
    map['email'] = email;
    map['country_code'] = countryCode;
    map['phone_number'] = phoneNumber;
    try {
      var response = await handler.postRequest(endpoint, parameters: map);
      if (response.statusCode == 200) {
        final Map<String, dynamic> data = json.decode(response.body);
        ProfileModel model = ProfileModel.fromJson(data);
        responseMessage = model.status.toString();
      }
      return responseMessage;
    } catch (e) {
      throw e;
    }
  }

  Future<String> changePassword(String oldPassword, String password) async {
    String endpoint = '/change_password';
    String message = '';
    var map = Map<String, dynamic>();
    map['token'] = token;
    map['old_password'] = oldPassword;
    map['password'] = password;

    print("map:::${map}");
    try {
      var response = await handler.postRequest(endpoint, parameters: map);
      final Map<String, dynamic> data = json.decode(response.body);
      BaseModel model = BaseModel.fromJson(data);
      message = model.status.toString();
    } catch (e) {
      throw e;
    }

    return message;
  }

  Future<String> deleteAccount () async {
    String endpoint = '/delete_account';
    String message = '';
    var map = Map<String, dynamic>();
    map['token'] = SharedPrefManager.shared.sharedPres.getString(AppStrings.token) ?? '';
    try {
      var response = await handler.postRequest(endpoint, parameters: map);
      final Map<String, dynamic> data = json.decode(response.body);
      BaseModel model = BaseModel.fromJson(data);
      message = model.status.toString();
    } catch (e) {
      throw e;
    }

    return message;
  }

  Future<String> logOut () async {
    String endpoint = '/logout';
    String message = '';
    var map = Map<String, dynamic>();
    map['token'] = SharedPrefManager.shared.sharedPres.getString(AppStrings.token) ?? '';
    try {
      var response = await handler.postRequest(endpoint, parameters: map);
      final Map<String, dynamic> data = json.decode(response.body);
      BaseModel model = BaseModel.fromJson(data);
      message = model.status.toString();

    } catch (e) {
      throw e;
    }

    return message;
  }


}
