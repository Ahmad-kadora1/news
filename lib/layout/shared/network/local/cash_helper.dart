import 'package:shared_preferences/shared_preferences.dart';

class CashHelper {
  static SharedPreferences? sharedPrefernaces;
  static init() async {
    sharedPrefernaces = await SharedPreferences.getInstance();
  }

  static Future<bool> putdata({
    required String key,
    required bool value,
  }) async {
    return await sharedPrefernaces?.setBool(key, value) ?? false;
  }

  static bool? getdata({required String key}) {
    return sharedPrefernaces?.getBool(key);
  }
}
