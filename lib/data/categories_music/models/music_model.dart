import 'package:application_patient/data/categories_music/models/categorie_model.dart';

class Musique {
  List<Musiques>? musiques;

  Musique({this.musiques});

  Musique.fromJson(Map<String, dynamic> json) {
    if (json['musiques'] != null) {
      musiques = <Musiques>[];
      json['musiques'].forEach((v) {
        musiques!.add(Musiques.fromJson(v));
      });
    }
  }
}
