import 'package:application_patient/data/categories_music/categorie_impl.dart';
import 'package:application_patient/data/categories_music/models/categorie_model.dart';

import 'package:get/get.dart';

import '../data/categories_music/models/music_model.dart';

class CategorieController extends GetxController {
  IrepoCategorie repos = IreposecategorieImpl();

  @override
  void onInit() {
    super.onInit();
    // ignore: avoid_print

    fetchallcategorie();
    fetchallmusiques();
  }

  bool leading = false;

  List<Categorie> categorie = [];
  List<Musiques> music = [];

  fetchallcategorie() async {
    leading = true;
    try {
      Categories? response = await repos.fetchall();
      if (response != null) {
        response.categorie!.map((e) => categorie.add(e)).toList();

        update();
        return categorie;
      }
    } catch (e) {
      update();
      leading = false;
    }
  }

  fetchallmusiques() async {
    leading = true;
    try {
      Musique? response = await repos.fetchallmusiques();
      if (response != null) {
        response.musiques!.map((element) => music.add(element)).toList();

        update();
      }
      return [];
    } catch (e) {
      update();

      leading = false;
      return [];
    }
  }
}
