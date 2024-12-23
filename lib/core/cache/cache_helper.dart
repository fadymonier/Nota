import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static SharedPreferences? _preferences;

  // Initialize the SharedPreferences instance
  static Future<void> init() async {
    _preferences = await SharedPreferences.getInstance();
  }

  // Save a boolean value in SharedPreferences
  static Future<bool> saveBool(
      {required String key, required bool value}) async {
    return await _preferences?.setBool(key, value) ?? false;
  }

  // Get a boolean value from SharedPreferences
  static bool? getBool({required String key}) {
    return _preferences?.getBool(key);
  }
}
