import 'package:shared_preferences/shared_preferences.dart';

class ConfigToken {
  ConfigToken._();

  static void addToken(
      {required String access, required String refresh}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final bool acc = await prefs.setString("access", access);
    final ref = await prefs.setString("refresh", refresh);
    // ignore: avoid_print
    print("les deux token sont enregistres access $acc and refresh $ref");
  }

  static Future<String?> fetchAccesToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("access");
  }

  static Future<String?> fetchRefreshToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("refresh");
  }

  static deteletoken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("access");
    prefs.remove("refresh");
  }
}
