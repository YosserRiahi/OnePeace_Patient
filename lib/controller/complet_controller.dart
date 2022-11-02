import 'package:application_patient/core/constant/error_constants.dart';
import 'package:application_patient/core/constant/route_name.dart';
import 'package:application_patient/data/auth_data_resource/login_resource/models/complet_request.dart';
import 'package:application_patient/data/auth_data_resource/login_resource/models/response_complet.dart';
import 'package:application_patient/data/auth_data_resource/sign_up_resource/model/error_response.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/auth_data_resource/login_resource/auth_log_contract.dart';

class CompletController extends GetxController {
  final IrepoSignin repository = IrespoSinImpl();
  final List<String> error = [];
  final GlobalKey<FormState> form = GlobalKey<FormState>();
  late TextEditingController firstEditingController;
  late TextEditingController lastEditingController;
  late TextEditingController telefonEditingController;
  late TextEditingController cnamEditingController;
  late FocusNode first;
  late FocusNode last;
  late FocusNode telefon;
  late FocusNode cnam;
  bool loading = false;
  @override
  void onInit() {
    super.onInit();
    firstEditingController = TextEditingController();
    lastEditingController = TextEditingController();
    telefonEditingController = TextEditingController();
    cnamEditingController = TextEditingController();
    first = FocusNode();
    last = FocusNode();
    telefon = FocusNode();
    cnam = FocusNode();
  }

//-------------- validator first name ------------------------ //
  String? validatorFirst(String? value) {
    if (value!.isEmpty && !error.contains(ErrorValidator.eFirstNullError)) {
      error.add(ErrorValidator.eFirstNullError);
      update();
    } else if (value.length <= 3 &&
        !error.contains(ErrorValidator.eFirstLengthError)) {
      error.add(ErrorValidator.eFirstLengthError);
      update();
    }
    return null;
  }

  //-------------- onchange first name ------------------------ //
  void onchangeuFirst(String? value) {
    if (value!.isNotEmpty && error.contains(ErrorValidator.eFirstNullError)) {
      error.remove(ErrorValidator.eFirstNullError);
      update();
    } else if (value.length >= 3 &&
        error.contains(ErrorValidator.eFirstLengthError)) {
      error.remove(ErrorValidator.eFirstLengthError);
      update();
    }
  }

// ------------ onsave First  methode -----------//
  void savefisrt(String? value) {
    firstEditingController.text = value!;
    update();
  }

  //-------------- validator last name ------------------------ //
  String? validatorLast(String? value) {
    if (value!.isEmpty && !error.contains(ErrorValidator.eLastNullError)) {
      error.add(ErrorValidator.eLastNullError);
      update();
    } else if (value.length <= 3 &&
        !error.contains(ErrorValidator.eLastLengthError)) {
      error.add(ErrorValidator.eLastLengthError);
      update();
    }
    return null;
  }

  //-------------- onchange last name ------------------------ //
  void onchangeuLast(String? value) {
    if (value!.isNotEmpty && error.contains(ErrorValidator.eLastNullError)) {
      error.remove(ErrorValidator.eLastNullError);
      update();
    } else if (value.length >= 3 &&
        error.contains(ErrorValidator.eLastLengthError)) {
      error.remove(ErrorValidator.eLastLengthError);
      update();
    }
  }

// ------------ onsave Email  methode -----------//
  void saveulast(String? value) {
    lastEditingController.text = value!;
    update();
  }

  // ------------- phone --------------//
  String? validatorphone(String? value) {
    if (value!.isEmpty && !error.contains(ErrorValidator.efoneNullError)) {
      error.add(ErrorValidator.efoneNullError);
      update();
    } else if (value.length <= 9 &&
        !error.contains(ErrorValidator.efoneValidationError)) {
      error.add(ErrorValidator.efoneValidationError);
      update();
    }
    return null;
  }

  void onchangephone(String? value) {
    if (value!.isNotEmpty && error.contains(ErrorValidator.efoneNullError)) {
      error.remove(ErrorValidator.efoneNullError);
      update();
    } else if (value.length == 8 &&
        error.contains(ErrorValidator.efoneValidationError)) {
      error.remove(ErrorValidator.efoneValidationError);
      update();
    }
  }

// ------------ save phone  methode -----------//

  void savephone(String? value) {
    telefonEditingController.text = value!;
    update();
  }

// ----------- cnam code ------------------//

  void savecnam(String? value) {
    cnamEditingController.text = value!;
    update();
  }

  void clearcontroller() {
    firstEditingController.clear();
    lastEditingController.clear();
    telefonEditingController.clear();
    cnamEditingController.clear();
    update();
  }

//---------------- methode save complet -profil ------------------//

  void completProfil() async {
    try {
      loading = true;
      CompletModel model = CompletModel(
          firstname: firstEditingController.text,
          lastname: lastEditingController.text,
          phone: int.parse(telefonEditingController.text),
          cnam: cnamEditingController.text);
      final result = await repository.complet(model);

      result.fold((ErrorResponse err) {
        error.add(err.error);

        update();
      }, (ResponseComplet r) {
        Get.snackbar(
          "Notification",
          "Profil Completed with succes",
          backgroundColor: Colors.black26,
          snackPosition: SnackPosition.TOP,
          icon: Image.asset("assets/logo/OnePeaceMed.png"),
          duration: const Duration(seconds: 4),
        );
        error.clear();
        loading = false;
        Get.offAllNamed(RoutesName.home);
        update();
      });
    } catch (e) {
      // ignore: avoid_print
      print(e.toString());
    }
  }

  @override
  void onClose() {
    super.onClose();
    firstEditingController.dispose();
    lastEditingController.dispose();
    telefonEditingController.dispose();
    cnamEditingController.dispose();
    first.dispose();
    last.dispose();
    telefon.dispose();
    cnam.dispose();
  }
}
