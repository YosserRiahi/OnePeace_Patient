// ignore_for_file: unnecessary_brace_in_string_interps

import 'dart:core';

import 'package:application_patient/data/local_db/abstract_repository.dart';
import 'package:application_patient/data/local_db/models/config_model.dart';
import 'package:application_patient/data/local_db/models/dose_model.dart';
import 'package:application_patient/data/local_db/remote_Irepository_water.dater.dart';
import 'package:application_patient/data/local_db/remote_config_impl.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class WaterController extends GetxController {
  IrepositoryConfig config = ImplementConfig();
  IrepositoryWater water = ImplementWater();

  double objectif = 0.0;
  late TextEditingController writedose;
  double dose = 0.0;
  DateTime day = DateTime.now();

  ConfigModel? model;

  int pourcentage = 0;

  bool isloeading = false;

  final int _dosage = 0;
  int get dosage => _dosage;

  static String convert() {
    DateTime temps = DateTime.now();
    return DateFormat.yMd().format(temps);
  }

  @override
  void onInit() {
    super.onInit();

    loaddata(true);
    pourcentage = 0;

    fetchConfig();
    fetchdosetoday();
    loaddata(false);
    writedose = TextEditingController();
  }

  @override
  void onClose() {
    super.onClose();
    writedose.dispose();
  }

  // ------------ update dose -------------//

  onchange(String value) {
    writedose.text = value;
    update();
  }

  //------------- config fecht --------//
  fetchConfig() async {
    await config.fetchmodel().then((value) {
      model = value;
    });
    update();
  }

  // --------------- water dose for today ------------//

  fetchdosetoday() async {
    final List<Dose> list = await water.fetchbydate();
    double quan = 0.0;
    if (list.isEmpty) {
      // ignore: avoid_print

      update();
      return dose;
    } else {
      list.map((element) {
        quan = quan + element.dose;
        // ignore: avoid_print

        update();
      }).toList();
// ignore: avoid_print

    }

    dose = quan;
    calculpourcentage(model!.objective, dose);
    update();
    return dose;
  }

  //----------- calcul de pourcentage ---------//
  calculpourcentage(double obj, double dose) {
    // ignore: division_optimization
    pourcentage = ((dose / (obj)) * 100).toInt();
    update();
  }

  void loaddata(bool value) {
    isloeading = value;
    update();
  }

  // ------------ insert dosage ----------//
  adddose(double value) async {
    Dose dosen = Dose(dose: value, time: convert());
    await water.insertDose(dosen).then((value) {
      dose = 0.0;
      fetchdosetoday();

      update();
    });
  }
}
