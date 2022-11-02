import 'package:application_patient/core/constant/error_constants.dart';
import 'package:application_patient/data/auth_data_resource/reset_password/model/reset_model.dart';
import 'package:application_patient/data/auth_data_resource/reset_password/model/reset_response.dart';
import 'package:application_patient/data/auth_data_resource/reset_password/reset_repository.dart';
import 'package:application_patient/data/auth_data_resource/sign_up_resource/model/error_response.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ForgetController extends GetxController {
  final IreposiRest repository = IreposiRestImpl();

  final List<String> error = [];
  final GlobalKey<FormState> form = GlobalKey<FormState>();
  late TextEditingController textEditingController;
  late FocusNode node;
  bool loading = false;
  @override
  void onInit() {
    super.onInit();
    textEditingController = TextEditingController();
    node = FocusNode();
  }

// ----------- validator methode ----------//
  String? validator(String? value) {
    if (value!.isEmpty && !error.contains(ErrorValidator.eEmailNullError)) {
      error.add(ErrorValidator.eEmailNullError);
      update();
    } else if (!ErrorValidator.emailvalidatorRexExp.hasMatch(value) &&
        !error.contains(ErrorValidator.eInvalidEmailError)) {
      error.add(ErrorValidator.eInvalidEmailError);
      update();
    }
    update();
    return null;
  }

// ---------------- onchange methode ---------//
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

// ------------ onsave methode -----------//
  void save(String? value) {
    textEditingController.text = value!;
    update();
  }

  // -------------- forget password -------------//

  // ignore: body_might_complete_normally_nullable
  Future<ResetResponse?> resetpassword() async {
    loading = true;

    final model = ResetModel(
      email: textEditingController.text,
    );

    Either<ErrorResponse, ResetResponse> response =
        await repository.reset(model);

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
        duration: const Duration(seconds: 5),
      );
      cleartext();
      loading = false;
      update();
      return r;
    });
    loading = false;
    update();
  }

//--------------------- onclose methode ---------//

  void cleartext() {
    textEditingController.clear();
    update();
  }

  @override
  void onClose() {
    super.onClose();
    textEditingController.dispose();
    node.dispose();
  }
}
