import 'package:application_patient/data/appointment/abstract_repo_appointment.dart';
import 'package:application_patient/data/appointment/models/appoint_model.dart';
import 'package:application_patient/data/auth_data_resource/sign_up_resource/model/error_response.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import '../data/appointment/models/response_appoint_model_one.dart';

class AppointmentController extends GetxController {
  IrepoiApp reposi = IreposiAppImpl();
  String? date;
  String? hourselected;
  int? selectedindex;
  int? doctorid;
  bool loading = false;

  List<String> hour = [
    "8.00",
    "9.00",
    "10.00",
    "11.00",
    "12.00",
    "13.00",
    "14.00",
    "15.00"
  ];

  late TextEditingController description;

  @override
  void onInit() {
    super.onInit();

    description = TextEditingController();
  }

//----------- format date --------- //
  static String convert(DateTime time) {
    return DateFormat.yMd().format(time);
  }

// ---------- update horaire ----------//
  updateindex(int index, String value) {
    selectedindex = index;
    hourselected = value;
    update();
  }

  //-------------- onchange time ----------//
  void updateTime(DateTime? time) {
    if (time != null) {
      date = convert(time);
      // ignore: avoid_print
      print(time);
      update();
    }
  }

  // ------------- onsave text description -----------//
  void onsubmit(String value) {
    description.text = value;
    update();
  }

// ----------- save Appointment -------------//

  void clearAppointment() {
    description.clear();
    date = null;
    hourselected = null;
    selectedindex = null;
    update();
  }

  addAppointment(int doctorid) async {
    loading = true;
    AppointmentModel model = AppointmentModel(
        date: date!,
        heur: hourselected!,
        description: description.text,
        doctor: doctorid);
    Either<ErrorResponse, AppointmentOne> result =
        await reposi.insertapp(model);
    result.fold((error) {
      // ignore: avoid_print

      Get.snackbar(
        "Appointment Error",
        error.error,
        backgroundColor: Colors.black26,
        snackPosition: SnackPosition.TOP,
        icon: Image.asset("assets/logo/OnePeace.png"),
        duration: const Duration(seconds: 4),
      );
    }, (r) {
      Get.snackbar(
        "Appointment",
        "Appointment submitted, wait for psychologist confirmation",
        backgroundColor: Colors.black26,
        snackPosition: SnackPosition.TOP,
        icon: Image.asset("assets/logo/OnePeace.png"),
        duration: const Duration(seconds: 4),
      );
      clearAppointment();
      update();
    });
    loading = false;
    update();
  }

  @override
  void onClose() {
    super.onClose();
    description.dispose();
  }
}
