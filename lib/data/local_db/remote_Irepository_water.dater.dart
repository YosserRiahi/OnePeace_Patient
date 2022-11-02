import 'package:application_patient/data/local_db/abstract_repository.dart';
import 'package:application_patient/data/local_db/constants_db/constant_db.dart';
import 'package:application_patient/data/local_db/database_helper.dart';
import 'package:application_patient/data/local_db/models/dose_model.dart';
import 'package:sqflite/sqflite.dart';

class ImplementWater extends IrepositoryWater {
  @override
  Future<int> deleteDose(Dose dose) async {
    Database? db = await HelperDb.instance.db;
    int value = await db!.delete(
      tableDrinks,
      where: '$columnId = ?',
      whereArgs: [dose.id],
    );
    return value;
  }

  @override
  Future<List<Dose>> fetchall() async {
    final List<Dose> dos = [];
    Database? db = await HelperDb.instance.db;
    List<Map<String, dynamic>> maps = await db!.query(
      tableDrinks,
    );
    if (maps.isEmpty) {
      return dos;
    }
    maps.map((e) => dos.add(Dose.fromMap(e))).toList();

    return dos;
  }

  @override
  Future<List<Dose>> fetchbydate() async {
    final String date = Dose.convert();

    final List<Dose> dos = [];
    Database? db = await HelperDb.instance.db;
    List<Map<String, dynamic>> maps = await db!.query(tableDrinks,
        where: "$columnDate = ?",
        whereArgs: [date],
        // ignore: unnecessary_string_interpolations
        orderBy: "$columnDose");
    if (maps.isEmpty) {
      return dos;
    }
    maps.map((e) => dos.add(Dose.fromMap(e))).toList();
    return dos;
  }

  @override
  Future<int> insertDose(Dose dose) async {
    Database? db = await HelperDb.instance.db;
    final int value = await db!.insert(tableDrinks, dose.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    // ignore: avoid_print
    print("insert dose at table $value");
    return value;
  }

  @override
  Future<int> updateDose(Dose dose) async {
    Database? db = await HelperDb.instance.db;
    final int value = await db!.update(tableDrinks, dose.toMap(),
        where: "$columnId =?", whereArgs: [dose.id]);
    // ignore: avoid_print
    print("update dose de la table all dose");
    return value;
  }
}
