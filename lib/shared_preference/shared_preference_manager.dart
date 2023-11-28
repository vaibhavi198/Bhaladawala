import 'package:bhaladawala_app/utils/app_strings.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefManager {
  static final SharedPrefManager shared = SharedPrefManager();
  late SharedPreferences sharedPres;

  Future initialize() async {
    sharedPres = await SharedPreferences.getInstance();
  }

  Future clearSession() async {
    await sharedPres.remove(AppStrings.token);
    await sharedPres.clear();
    await sharedPres.setBool(AppStrings.isFirstTime, true);
  }

  void saveToken(String? token) async {
    await sharedPres.setString(AppStrings.token, token ?? "");
  }

}
