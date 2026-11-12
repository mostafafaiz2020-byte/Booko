import 'package:shared_preferences/shared_preferences.dart';

class LocalHelper {
  static SharedPreferences? prefs;

  static Future<void> inti() async {
    prefs = await SharedPreferences.getInstance();
  }
}
