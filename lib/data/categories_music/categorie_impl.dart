import 'package:application_patient/core/constant/client_dio.dart';
import 'package:application_patient/data/categories_music/models/categorie_model.dart';
import 'package:application_patient/data/categories_music/models/music_model.dart';

import 'package:dio/dio.dart';

abstract class IrepoCategorie {
  Future<Categories?> fetchall();
  Future<Musique?> fetchallmusiques();
  Future<Categories?> fetchOne(String categorie);
}

class IreposecategorieImpl extends IrepoCategorie {
  final _dio = CustomDio();
  @override
  // ignore: body_might_complete_normally_nullable
  Future<Categories?> fetchOne(String categorie) async {
    try {
      // ignore: unnecessary_brace_in_string_interps
      final response = await _dio.get("/categorie/${categorie}");
      if (response.statusCode == 200) {
        return Categories.fromJson(response.data);
      }
      return null;
    } on DioError catch (e) {
      if (e.response != null) {
        // ignore: avoid_print
        print(e.response!.data);
      } else {
        // ignore: avoid_print
        print(e.response!.data);
      }
    }
  }

  @override
  // ignore: body_might_complete_normally_nullable
  Future<Categories?> fetchall() async {
    try {
      final response = await _dio.get("/categories");
      if (response.statusCode == 200) {
        return Categories.fromJson(response.data);
      }
    } on DioError catch (e) {
      if (e.response != null) {
      } else {}
    }
  }

  @override
  // ignore: body_might_complete_normally_nullable
  Future<Musique?> fetchallmusiques() async {
    try {
      final response = await _dio.get("/musiques");
      if (response.statusCode == 200) {
        return Musique.fromJson(response.data);
      }
      return null;
    } on DioError catch (e) {
      if (e.response != null) {
      } else {}
    }
  }
}
