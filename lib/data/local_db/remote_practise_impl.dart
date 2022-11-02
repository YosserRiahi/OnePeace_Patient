// ignore_for_file: avoid_renaming_method_parameters

import 'package:application_patient/data/local_db/abstract_repository.dart';
import 'package:application_patient/data/local_db/constants_db/constant_db.dart';
import 'package:application_patient/data/local_db/database_helper.dart';
import 'package:application_patient/data/local_db/models/pratice_model.dart';
import 'package:sqflite/sqflite.dart';

class ImplPractise extends IrepositoryPractise {
  @override
  Future<int> delete(Practise practise) async {
    Database? db = await HelperDb.instance.db;
    int value = await db!.delete(
      tablePractise,
      where: '$columnId = ?',
      whereArgs: [practise.id],
    );
    return value;
  }

  @override
  Future<List<Practise>> fetchall() async {
    final List<Practise> practises = [];
    Database? db = await HelperDb.instance.db;
    List<Map<String, dynamic>> maps = await db!.query(
      tablePractise,
    );
    if (maps.isEmpty) {
      return practises;
    }
    maps.map((e) => practises.add(Practise.fromMap(e))).toList();
// ignore: avoid_print
    print("fetch all practises");
    return practises;
  }

  @override
  Future<int> insertpractise(Practise practise) async {
    Database? db = await HelperDb.instance.db;
    final int value = await db!.insert(tablePractise, practise.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);

    return value;
  }
}
