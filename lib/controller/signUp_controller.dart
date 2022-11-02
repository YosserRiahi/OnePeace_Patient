// ignore: file_names
// ignore_for_file: body_might_complete_normally_nullable

import 'package:application_patient/core/constant/error_constants.dart';
import 'package:application_patient/core/constant/route_name.dart';
import 'package:application_patient/data/auth_data_resource/sign_up_resource/model/error_response.dart';
import 'package:application_patient/data/auth_data_resource/sign_up_resource/model/sign_up_response.dart';
import 'package:application_patient/data/auth_data_resource/sign_up_resource/model/sing_up_model.dart';
import 'package:application_patient/data/auth_data_resource/sign_up_resource/sign_up_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController {
  final IrepoSignup repository = IsingUpimpl();
  final List<String> error = [];
  final GlobalKey<FormState> form = GlobalKey<FormState>();
  late TextEditingController emailEditingController;
  late TextEditingController passwordEditingController;
  late TextEditingController confirmEditingController;
  late TextEditingController usernameEditingController;
  late FocusNode email;
  late FocusNode username;
  late FocusNode pass;
  late FocusNode confirmpass;
  bool loading = false;
  @override
  void onInit() {
    super.onInit();
    emailEditingController = TextEditingController();
    passwordEditingController = TextEditingController();
    confirmEditingController = TextEditingController();
    usernameEditingController = TextEditingController();
    email = FocusNode();
    username = FocusNode();
    pass = FocusNode();
    confirmpass = FocusNode();
  }

// *****----------------- Username ----------------------******//

//---------------- username validator -----------------------//

  String? validatorusername(String? value) {
    if (value!.isEmpty && !error.contains(ErrorValidator.eUserNullError)) {
      error.add(ErrorValidator.eUserNullError);
      update();
    } else if (value.length <= 4 &&
        !error.contains(ErrorValidator.eUserLengthError)) {
      error.add(ErrorValidator.eUserLengthError);
      update();
    }
    return null;
  }

// -------------- onchange username ------------------------ //
  void onchangeusername(String? value) {
    if (value!.isNotEmpty && error.contains(ErrorValidator.eUserNullError)) {
      error.remove(ErrorValidator.eUserNullError);
      update();
    } else if (value.length >= 4 &&
        error.contains(ErrorValidator.eUserLengthError)) {
      error.remove(ErrorValidator.eUserLengthError);
      update();
    }
  }

  // ------------ onsave Email  methode -----------//
  void saveusername(String? value) {
    usernameEditingController.text = value!;
    update();
  }

// ****** --------------- Email ----------------- *****//
// ----------- validator Email methode ----------//

  String? validator(String? value) {
    if (value!.isEmpty && !error.contains(ErrorValidator.eEmailNullError)) {
      error.add(ErrorValidator.eEmailNullError);
      update();
    } else if (!ErrorValidator.emailvalidatorRexExp.hasMatch(value) &&
        !error.contains(ErrorValidator.eInvalidEmailError)) {
      error.add(ErrorValidator.eInvalidEmailError);
      update();
    }
    return null;
  }

// ---------------- onchange Email methode ---------//
  void onchange(String? value) {
    if (value!.isNotEmpty && error.contains(ErrorValidator.eEmailNullError)) {
      error.remove(ErrorValidator.eEmailNullError);
      update();
    } else if (ErrorValidator.emailvalidatorRexExp.hasMatch(value) &&
        error.contains(ErrorValidator.eInvalidEmailError)) {
      error.remove(ErrorValidator.eInvalidEmailError);
      update();
    }
  }

// ------------ onsave Email  methode -----------//
  void save(String? value) {
    emailEditingController.text = value!;
    update();
  }

  //*******-------------- Password ---------------- **********/
  bool obscure = true;
  // --------------- toggle password ------------- //

  void togglepassword() {
    obscure = !obscure;
    update();
  }

// ----------- validator password methode ----------//
  String? validatorpassword(String? value) {
    if (value!.isEmpty && !error.contains(ErrorValidator.ePassNullError)) {
      error.add(ErrorValidator.ePassNullError);
      update();
    } else if (value.length < 8 &&
        !error.contains(ErrorValidator.eShortPasswordError)) {
      error.add(ErrorValidator.eShortPasswordError);
      update();
    }
    return null;
  }

// --------------- change password ------------------//
  void changepassword(String? value) {
    if (value!.isNotEmpty && error.contains(ErrorValidator.ePassNullError)) {
      error.remove(ErrorValidator.ePassNullError);
      update();
    } else if (value.length > 8 &&
        error.contains(ErrorValidator.eShortPasswordError)) {
      error.remove(ErrorValidator.eShortPasswordError);
      update();
    }
  }

  // ------------ onsave Password  methode -----------//
  void savepassword(String? value) {
    passwordEditingController.text = value!;
    update();
  }

//*******-------------- Confirm Password ---------------- **********/
  bool obscureConfirm = false;

  void toggleconfirmpassword() {
    obscureConfirm = !obscureConfirm;
    update();
  }

// --------------- change confirm password ------------------//
  void changepasswordconfirm(String? value) {
    if (value!.isNotEmpty && error.contains(ErrorValidator.ePassNullError)) {
      error.remove(ErrorValidator.ePassNullError);
      update();
    } else if (value.length > 8 &&
        error.contains(ErrorValidator.eShortPasswordError)) {
      error.remove(ErrorValidator.eShortPasswordError);
      update();
    } else if (value == passwordEditingController.text &&
        error.contains(ErrorValidator.ePassConNonConformError)) {
      error.remove(ErrorValidator.ePassConNonConformError);
      update();
    }
  }

// ----------- validator password confirm methode ----------//
  String? validatorpasswordconfirm(String? value) {
    if (value!.isEmpty && !error.contains(ErrorValidator.ePassNullError)) {
      error.add(ErrorValidator.ePassNullError);
      update();
    } else if (value.length < 8 &&
        !error.contains(ErrorValidator.eShortPasswordError)) {
      error.add(ErrorValidator.eShortPasswordError);
      update();
    } else if (value != passwordEditingController.text &&
        !error.contains(ErrorValidator.ePassConNonConformError)) {
      error.add(ErrorValidator.ePassConNonConformError);
      update();
    }
    return null;
  }

  // ------------ onsave Password  methode -----------//
  void savepasswordconfirm(String? value) {
    confirmEditingController.text = value!;
    update();
  }
  // -------------- Add user Account -------------//

  Future<RegisterResponse?> adduser() async {
    loading = true;

    final model = RegisteModel(
        username: usernameEditingController.text,
        email: emailEditingController.text,
        password: passwordEditingController.text);
    Either<ErrorResponse, RegisterResponse> response =
        await repository.signup(model);

    response.fold((err) {
      error.add(err.error);
    }, (r) {
      error.clear();
      Get.snackbar(
        "Notification",
        r.message,
        backgroundColor: Colors.black26,
        snackPosition: SnackPosition.TOP,
        icon: Image.asset("assets/logo/OnePeaceMed.png"),
        duration: const Duration(seconds: 4),
      );
      Get.offNamed(RoutesName.code);
      return r;
    });
    loading = false;
    update();
  }

//--------------------- onclose methode ---------//
  void clearcontroller() {
    emailEditingController.clear();
    passwordEditingController.clear();
    confirmEditingController.clear();
    usernameEditingController.clear();
    update();
  }

  @override
  void onClose() {
    super.onClose();
    emailEditingController.dispose();
    passwordEditingController.dispose();
    confirmEditingController.dispose();
    usernameEditingController.dispose();
    username.dispose();
    email.dispose();
    pass.dispose();
    confirmpass.dispose();
  }
}
