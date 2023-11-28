import 'dart:convert';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;

class APIHandler {
  APIHandler();

  String get baseUrl => "https://bhaldawala.thegoalachiever.com/api";
  String base = "bhaldawala.thegoalachiever.com";
  String APISuffix = "/api/";

  Future<Map<String, String>> headers() async {
    // String? token = SharedPrefManager.shared.sharedPres.getString(AppStrings.token);

    if (("token" ?? "").isNotEmpty) {
      return {
        "content-type": "application/json; charset=UTF-8",
        "authorization": "token" ?? "",
      };
    } else {
      return {
        "content-type": "application/json; charset=UTF-8",
      };
    }
  }

  Future<http.Response> getRequest(String endpoint,
      {Map<String, String>? queryParameter}) async {
    try {
      var url = Uri.https(base, APISuffix + endpoint, queryParameter);
      if (kDebugMode) {
        print(url);
      }
      var response = await http.get(
        url,
        headers: await headers(),
      );
      return response;
    } catch (e) {
      throw e;
    }
  }

  Future<http.Response> postRequest(String endpoint,
      {Map<String, dynamic>? parameters}) async {
    try {
      var url = Uri.parse(baseUrl + endpoint);
      print(url);
      var response = await http.post(url, body: parameters);
      return response;
    } catch (e) {
      print("Error:$e");
      throw e;
    }
  }

  Future<http.Response> putRequest(String endpoint,
      {Map<String, dynamic>? parameters}) async {
    try {
      var url = Uri.parse(baseUrl + endpoint);
      var body = json.encode(parameters);
      var response = await http.put(url,
          headers: await headers(),
          body: body,
          encoding: Encoding.getByName("form-data"));

      return response;
    } catch (e) {
      throw e;
    }
  }
}
