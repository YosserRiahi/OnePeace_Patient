// ignore_for_file: file_names, unnecessary_brace_in_string_interps

import 'package:application_patient/core/constant/error_constants.dart';
import 'package:application_patient/core/constant/route_name.dart';
import 'package:application_patient/data/auth_data_resource/login_resource/auth_log_contract.dart';
import 'package:application_patient/data/auth_data_resource/login_resource/models/login_response.dart';
import 'package:application_patient/data/auth_data_resource/login_resource/models/request_login_mode.dart';
import 'package:application_patient/service/save_retrive_token.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../data/auth_data_resource/login_resource/models/user_model.dart';
import '../data/auth_data_resource/sign_up_resource/model/error_response.dart';

class LoginController extends GetxController {
  final IrepoSignin repository = IrespoSinImpl();
  final List<String> error = [];
  final GlobalKey<FormState> formlogin = GlobalKey<FormState>();
  late TextEditingController emailEditingController;
  late TextEditingController passwordEditingController;
  late FocusNode email;
  late FocusNode pass;
  bool obscure = true;
  bool saveradio = false;
  bool validate = false;
  bool loading = false;

  @override
  void onInit() {
    super.onInit();
    emailEditingController = TextEditingController();
    passwordEditingController = TextEditingController();
    email = FocusNode();
    pass = FocusNode();
  }

  void toggleradio(bool? value) {
    saveradio = value!;
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

// ----------- validator password methode ----------//
  String? validatorpassword(String? value) {
    if (value!.isEmpty && !error.contains(ErrorValidator.ePassNullError)) {
      error.add(ErrorValidator.ePassNullError);
      update();
    } else if (value.length < 7 &&
        !error.contains(ErrorValidator.eShortPasswordError)) {
      error.add(ErrorValidator.eShortPasswordError);
      update();
    } else if (passwordEditingController.text == "" &&
        !error.contains(ErrorValidator.ePassNullError)) {
      error.add(ErrorValidator.ePassNullError);
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

  void togglepassword() {
    obscure = !obscure;
    update();
  }

  // ---------------- sign in methode --------------- //
  // ignore: body_might_complete_normally_nullable
  Future<ResponseLogin?> login() async {
    loading = true;

    final model = LoginModel(
        email: emailEditingController.text,
        password: passwordEditingController.text);
    Either<ErrorResponse, ResponseLogin> response =
        await repository.signin(model);

    response.fold((ErrorResponse err) {
      if ((!error.contains(err.error) &&
          err.error == "Email or Password are wrong")) {
        error.add("Email or Password are wrong");
        update();
      } else if ((!error.contains(err.error) &&
          err.error == "Account Not verified")) {
        error.add("Account Not verified");
        update();
      } else if ((!error.contains(err.error) &&
          err.error == "please verifie your internet connection")) {
        error.add("please verifie your internet connection");
        update();
      } else {
        error.remove("Email or Password are wrong");
        error.remove("Account Not verified");
        error.remove("please verifie your internet connection");
        update();
      }
    }, (ResponseLogin login) async {
      // ignore: avoid_print
      addTokens(login.access, login.refresh);
      Either<ErrorResponse, Usermodel> resultfetch = await repository.fetchme();

      resultfetch.fold((ErrorResponse error) {
        // ignore: avoid_print
        print(error.error);
      }, (Usermodel user) {
        if (user.firstName == null) {
          Get.offAllNamed(RoutesName.complet);
        } else {
          Get.offAllNamed(RoutesName.home);
        }
      });

      // ignore: avoid_print

      Get.snackbar(
        "Notification",
        "user logged with succes",
        backgroundColor: Colors.black26,
        snackPosition: SnackPosition.TOP,
        icon: Image.asset("assets/logo/OnePeace.png"),
        duration: const Duration(seconds: 4),
      );
      error.clear();

      return login;
    });
    loading = false;
    update();
  }

  void addTokens(String access, String refresh) {
    ConfigToken.addToken(access: access, refresh: refresh);
    update();
  }

  @override
  void onClose() {
    super.onClose();
    emailEditingController.dispose();
    passwordEditingController.dispose();
    email.dispose();
    pass.dispose();
  }
}
