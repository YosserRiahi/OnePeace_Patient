// ignore_for_file: public_member_api_docs, sort_constructors_first, constant_identifier_names
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MeditationController extends GetxController {
  @override
  void onInit() async {
    super.onInit();
    fetchSession(value: SAISON_2).then((value) {
      saison2 = value ?? false;
      update();
    });
    fetchSession(value: SAISON_3).then((value) {
      saison3 = value ?? false;
      update();
    });
    fetchSession(value: SAISON_4).then((value) {
      saison4 = value ?? false;
      update();
    });
    fetchSession(value: SAISON_5).then((value) {
      saison5 = value ?? false;
      update();
    });
    fetchSession(value: QUIZ).then((value) {
      quiz = value ?? false;
      update();
    });
  }

  //----------------- variable ------------------
  static const SAISON_1 = "saison1";
  static const SAISON_2 = "saison2";
  static const SAISON_3 = "saison3";
  static const SAISON_4 = "saison4";
  static const SAISON_5 = "saison5";
  static const QUIZ = "quiz";

  bool saison1 = true;
  bool saison2 = false;
  bool saison3 = false;
  bool saison4 = false;
  bool saison5 = false;
  bool quiz = false;

  addSaison(bool value, String saison) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(saison, value);
    fetchSession(value: saison);
    update();
  }

  updateSaison4() {
    saison4 = true;
    update();
  }

  updateSaison3() {
    saison3 = true;
    update();
  }

  updateSaison2() {
    saison2 = true;
    update();
  }

  updateSaison5() {
    saison5 = true;
    update();
  }

  updateQuiz() {
    quiz = true;
    update();
  }

  Future<bool?> fetchSession({required String value}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? result = prefs.getBool(value);
    if (result == null) {
      return null;
    }
    update();
    return result;
  }

//------------------------ exemple -----------------------

}
