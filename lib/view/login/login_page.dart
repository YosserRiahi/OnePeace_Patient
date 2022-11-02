// ignore_for_file: prefer_final_fields, must_be_immutable

import 'package:application_patient/controller/login_controller.dart';
import 'package:application_patient/core/constant/palette_colors.dart';

import 'package:application_patient/core/constant/route_name.dart';
import 'package:application_patient/view/component/custom_Button.dart';
import 'package:application_patient/view/component/custom_Button_Widget.dart';

import 'package:application_patient/view/component/form_error.dart';
import 'package:application_patient/view/component/password_form.dart';
import 'package:application_patient/view/login/logo_widget.dart';
import 'package:application_patient/view/login/text_welcome.dart';

import "package:flutter/material.dart";
import 'package:formwidget/formwidget.dart';

import 'package:get/get.dart';

class LoginPage extends StatelessWidget {
  LoginController controller = Get.put(LoginController());

  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: baseColor,
        title: Text(
          "OnePeace Patient",
          style: Theme.of(context)
              .textTheme
              .headline6!
              .copyWith(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios),
          iconSize: Get.width * 0.05,
        ),
      ),
      body: GetBuilder<LoginController>(builder: (controller) {
        return SafeArea(
          bottom: false,
          child: SingleChildScrollView(
            child: Container(
              color: baseColor,
              width: double.infinity,
              height: Get.height,
              padding: const EdgeInsets.all(15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: Get.height * 0.05,
                  ),
                  const Logo(),
                  SizedBox(
                    height: Get.height * 0.02,
                  ),
                  const TextWelcome(),
                  SizedBox(
                    height: Get.height * 0.05,
                  ),
                  SizedBox(
                    height: Get.height * 0.05,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Form(
                      key: controller.formlogin,
                      child: Column(
                        children: [
                          EmailForm(
                              controller: controller.emailEditingController,
                              onEditingComplete: () {
                                FocusScope.of(context)
                                    .requestFocus(controller.pass);
                              },
                              validator: controller.validator,
                              onsave: controller.save,
                              onchange: controller.onchange,
                              focusnode: controller.email),
                          SizedBox(
                            height: Get.height * 0.04,
                          ),
                          PasswordForm(
                              focusNode: controller.pass,
                              controller: controller.passwordEditingController,
                              onEditingComplete: () {
                                FocusScope.of(context).unfocus();
                              },
                              onchange: controller.changepassword,
                              onSave: controller.savepassword,
                              validator: controller.validatorpassword,
                              ontap: controller.togglepassword,
                              obscure: controller.obscure,
                              label: "Password",
                              hint: "**************"),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Checkbox(
                                      activeColor: Colors.deepPurple.shade500,
                                      value: controller.saveradio,
                                      onChanged: controller.toggleradio),
                                  const Text("Remember me")
                                ],
                              ),
                              TextButton(
                                  onPressed: () {
                                    Get.toNamed(RoutesName.forget);
                                  },
                                  child: const Text("Forget Password ?"))
                            ],
                          ),
                          FormError(
                            erros: controller.error,
                          ),
                          SizedBox(
                            height: Get.height * 0.06,
                          ),
                          controller.loading
                              ? Image.asset(
                                  "assets/animations/spinner.gif",
                                  width: 70,
                                  height: 70,
                                )
                              : CustomButton(
                                  text: "Sign In",
                                  press: () {
                                    if (controller.formlogin.currentState!
                                        .validate()) {
                                      controller.formlogin.currentState!.save();
                                      controller.login();
                                      //
                                    }
                                  }),
                          SizedBox(
                            height: Get.height * 0.03,
                          ),
                          BottomWidget(
                              text: "if you don't have an Account? ",
                              press: () {
                                Get.toNamed(RoutesName.signup);
                              },
                              botton: "Sign Up"),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        );
      }),
    );
  }
}
