// ignore_for_file: avoid_print, unnecessary_brace_in_string_interps

import 'package:application_patient/core/constant/error_constants.dart';
import 'package:application_patient/core/constant/route_name.dart';
import 'package:application_patient/data/auth_data_resource/verificaation_code/model/code_mode.dart';
import 'package:application_patient/data/auth_data_resource/verificaation_code/model/code_response.dart';
import 'package:application_patient/data/auth_data_resource/verificaation_code/verifie_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/auth_data_resource/sign_up_resource/model/error_response.dart';

class VerificationController extends GetxController {
  final IrepoCode repository = IcodeUpimpl();
  late TextEditingController one;
  late TextEditingController two;
  late TextEditingController three;
  late TextEditingController four;
  late TextEditingController five;
  final GlobalKey<FormState> form = GlobalKey<FormState>();
  final List<String> error = [];
  late FocusNode node1;
  late FocusNode node2;
  late FocusNode node3;
  late FocusNode node4;
  late FocusNode node5;
  int codeverifie = 0;
  bool loading = false;

  @override
  void onInit() {
    super.onInit();
    one = TextEditingController();
    two = TextEditingController();
    three = TextEditingController();
    four = TextEditingController();
    five = TextEditingController();
    node1 = FocusNode();
    node2 = FocusNode();
    node3 = FocusNode();
    node4 = FocusNode();
    node5 = FocusNode();
  }

// --------------- error widget -------------- //
//------------------ form one ---------------------//
  String? validatorOne(String? value) {
    if (value!.isEmpty && !error.contains(ErrorValidator.eoneisemty)) {
      error.add(ErrorValidator.eoneisemty);
      update();
    } else if (!ErrorValidator.isvalue.contains(value) &&
        !error.contains(ErrorValidator.eValue)) {
      error.add(ErrorValidator.eValue);
      update();
    }
    return null;
  }

  void onchange(String? value) {
    if (value!.isNotEmpty && error.contains(ErrorValidator.eoneisemty)) {
      error.remove(ErrorValidator.eoneisemty);
      update();
    } else if (ErrorValidator.isvalue.contains(value) &&
        error.contains(ErrorValidator.eValue)) {
      error.remove(ErrorValidator.eValue);
      update();
    }
  }

  void saveone(String? value) {
    one.text = value!;
    update();
  }

//----------------------- form two ---------------------//
  String? validatorTwo(String? value) {
    if (value!.isEmpty && !error.contains(ErrorValidator.etwoisemty)) {
      error.add(ErrorValidator.etwoisemty);
      update();
    } else if (!ErrorValidator.isvalue.contains(value)) {
      error.add(ErrorValidator.eValue);
      update();
    }
    return null;
  }

  void onchangetwo(String? value) {
    if (value!.isNotEmpty && error.contains(ErrorValidator.etwoisemty)) {
      error.remove(ErrorValidator.eoneisemty);
      update();
    } else if (ErrorValidator.isvalue.contains(value) &&
        error.contains(ErrorValidator.eValue)) {
      error.remove(ErrorValidator.eValue);
      update();
    }
  }

  void savetwo(String? value) {
    two.text = value!;
    update();
  }

//---------------------- form three ---------------------//
  String? validatorThree(String? value) {
    if (value!.isEmpty && !error.contains(ErrorValidator.ethreeisemty)) {
      error.add(ErrorValidator.ethreeisemty);
      update();
    } else if (!ErrorValidator.isvalue.contains(value) &&
        !error.contains(ErrorValidator.eValue)) {
      error.add(ErrorValidator.eValue);
      update();
    }
    return null;
  }

  void onchangethree(String? value) {
    if (value!.isNotEmpty && error.contains(ErrorValidator.ethreeisemty)) {
      error.remove(ErrorValidator.ethreeisemty);
      update();
    } else if (ErrorValidator.isvalue.contains(value) &&
        error.contains(ErrorValidator.eValue)) {
      error.remove(ErrorValidator.eValue);
      update();
    }
  }

  void savethree(String? value) {
    three.text = value!;
    update();
  }

//------------------ form four ---------------------//
  String? validatorfour(String? value) {
    if (value!.isEmpty && !error.contains(ErrorValidator.efourisemty)) {
      error.add(ErrorValidator.efourisemty);
      update();
    } else if (!ErrorValidator.isvalue.contains(value) &&
        !error.contains(ErrorValidator.eValue)) {
      error.add(ErrorValidator.eValue);
      update();
    }
    return null;
  }

  void onchangefour(String? value) {
    if (value!.isNotEmpty && error.contains(ErrorValidator.efourisemty)) {
      error.remove(ErrorValidator.efourisemty);
      update();
    } else if (ErrorValidator.isvalue.contains(value) &&
        error.contains(ErrorValidator.eValue)) {
      error.remove(ErrorValidator.eValue);
      update();
    }
  }

  void savefour(String? value) {
    four.text = value!;
    update();
  }

//----------------- form five-----------------//
  String? validatorfive(String? value) {
    if (value!.isEmpty && !error.contains(ErrorValidator.efiveisemty)) {
      error.add(ErrorValidator.efiveisemty);
      update();
    } else if (!ErrorValidator.isvalue.contains(value) &&
        !error.contains(ErrorValidator.eValue)) {
      error.add(ErrorValidator.eValue);
      update();
    }
    return null;
  }

  void onchangefive(String? value) {
    if (value!.isNotEmpty && error.contains(ErrorValidator.efiveisemty)) {
      error.remove(ErrorValidator.efiveisemty);
      update();
    } else if (ErrorValidator.isvalue.contains(value) &&
        error.contains(ErrorValidator.eValue)) {
      error.remove(ErrorValidator.eValue);
      update();
    }
  }

  void savefive(String? value) {
    five.text = value!;
    update();
  }

// ---------------- code verifie ------------//
  void code() {
    try {
      final String value =
          one.text + two.text + three.text + four.text + five.text;
      int code = int.parse(value);
      codeverifie = code;
      print("code verie ${codeverifie}");
      update();
    } on FormatException catch (e) {
      print(e.toString());
      Get.snackbar("error", "invalid input please enter valide value");
    }
  }

  unfocus(BuildContext context) {
    FocusScope.of(context).unfocus();
    update();
  }
  // ------------ verification code backend ---------- //

  // ignore: body_might_complete_normally_nullable
  Future<CodeResponse?> verifiecode() async {
    loading = true;
    error.clear();
    CodeModel model = CodeModel(code: codeverifie);
    Either<ErrorResponse, CodeResponse> response =
        await repository.verifcode(model);
    response.fold((err) {
      error.add(err.error);
      clearcontroller();
    }, (r) {
      clearcontroller();
      Get.snackbar(
        "Notification",
        r.message,
        backgroundColor: Colors.black26,
        snackPosition: SnackPosition.TOP,
        icon: Image.asset("assets/logo/OnePeaceMed.png"),
        duration: const Duration(seconds: 4),
      );
      Get.offNamed(RoutesName.login);
      return r;
    });
    loading = false;
    update();
  }

  // -------------- clear controller --------//
  void clearcontroller() {
    one.clear();
    three.clear();
    two.clear();
    four.clear();
    five.clear();
    update();
  }

// ---------------- request FocusNode ----------------//
  void requestnode(FocusNode node, String? value, BuildContext context) {
    if (value!.length == 1) {
      FocusScope.of(context).requestFocus(node);
    }
    update();
  }

// ------------------ unrequest node --------------//
  void unrequestnode(String? value, BuildContext context) {
    if (value!.length == 1) {
      FocusScope.of(context).unfocus();
    }
    update();
  }

  @override
  void onClose() {
    super.onClose();
    one.dispose();
    two.dispose();
    three.dispose();
    four.dispose();
    five.dispose();
    node1.dispose();
    node2.dispose();
    node3.dispose();
    node4.dispose();
    node5.dispose();
  }
}
