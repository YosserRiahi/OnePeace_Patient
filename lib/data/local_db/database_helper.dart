// ignore_for_file: avoid_print

import 'dart:async';
import 'dart:io';
import 'package:application_patient/data/local_db/constants_db/constant_db.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class HelperDb {
  static final HelperDb instance = HelperDb._();
  HelperDb._();

  static Database? _db;

  Future<Database?> get db async {
    if (_db == null) {
      _db = await _initDb();
      return _db;
    } else {
      return _db;
    }
  }

  _initDb() async {
    Directory databasepath = await getApplicationDocumentsDirectory();
    String path = join(databasepath.path, "patient.db");
    Database mydb = await openDatabase(path, onCreate: _create, version: 1);
    return mydb;
  }

  FutureOr<void> _create(Database db, int version) async {
    await db.execute("""
      CREATE TABLE $tableDrinks(
      $columnId INTEGER PRIMARY KEY AUTOINCREMENT,
       $columnDose REAL ,     
       $columnDate TEXT 
      )
      """).then((_) {
      // ignore:
      print("databse create table water created*************");
    });
    await db.execute("""CREATE TABLE $tableEvents(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      $columnEvent TEXT,
      $columnDateCreated INTEGER
       )
      """).then((_) {
      // ignore:
      print("tables historique creer avec succes");
    });
    await db.execute('''CREATE TABLE $tableConfig(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      $columnSex TEXT,
      $columnAge INTEGER,
      $columnHeight REAL,
      $columnWeight REAL,
      $columnObjective REAL
    )
''');
    await db.execute('''CREATE TABLE $tablePractise (
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    $columnDuration REAL,
    $columnCreate INTEGER
    )
''');
  }

  Future close() async {
    final db = await instance.db;
    db!.close().then((_) {
      print("databse closed");
    });
  }
}
