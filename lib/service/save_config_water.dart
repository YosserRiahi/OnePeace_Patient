import 'package:application_patient/core/constant/constant_db.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ConfigWater {
  ConfigWater._();

  static void add() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    // ignore: avoid_print

    preferences.setBool(Constants.configwater, true);
  }

  static Future<bool> fetch() async {
    SharedPreferences preferences = await SharedPreferences.getInstance();
    bool? config = preferences.getBool(Constants.configwater);
    if (config == null) {
      return false;
    }
    // ignore: avoid_print

    return config;
  }
}
