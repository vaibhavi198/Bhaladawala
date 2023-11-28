import 'package:bhaladawala_app/Api/api_handler.dart';

class ResetPinRepo {
  late APIHandler handler;

  ResetPinRepo(){
    handler = APIHandler();
  }

  Future<void> resetPinRequest(String oldPassword, String confirmPassword) async {
    String endpoint = "change_password";
    Map<String, dynamic> parameters = {
   "token": "",
    "old_password" : oldPassword,
     "password": confirmPassword,

    };
  }




}