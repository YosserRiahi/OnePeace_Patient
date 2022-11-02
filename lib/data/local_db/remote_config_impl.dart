import 'package:application_patient/data/local_db/abstract_repository.dart';
import 'package:application_patient/data/local_db/constants_db/constant_db.dart';
import 'package:application_patient/data/local_db/database_helper.dart';
import 'package:application_patient/data/local_db/models/config_model.dart';
import 'package:sqflite/sqflite.dart';

class ImplementConfig extends IrepositoryConfig {
  @override
  Future<int> delete(int id) async {
    Database? db = await HelperDb.instance.db;
    int value = await db!.delete(
      tableConfig,
      where: '$columnId = ?',
      whereArgs: [id],
    );
    return value;
  }

  @override
  Future<ConfigModel> fetchmodel() async {
    Database? db = await HelperDb.instance.db;
    List<Map<String, Object?>> response = await db!.query(tableConfig);

    return ConfigModel.fromMap(response.first);
  }

  @override
  Future<int> insertconfig(ConfigModel model) async {
    Database? db = await HelperDb.instance.db;
    final int value = await db!.insert(tableConfig, model.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace);
    // ignore: avoid_print
    print("insert config at table $value");
    return value;
  }

  @override
  Future<int> updateConfig(ConfigModel model) async {
    Database? db = await HelperDb.instance.db;
    final int value = await db!.update(tableConfig, model.toMap(),
        where: "$columnId =?", whereArgs: [model.id]);
    // ignore: avoid_print
    print("update config de la table ");
    return value;
  }
}
