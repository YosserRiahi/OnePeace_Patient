// ignore_for_file: public_member_api_docs, sort_constructors_first, avoid_print
import 'package:application_patient/core/constant/palette_colors.dart';
import 'package:application_patient/core/constant/route_name.dart';
import 'package:application_patient/view/component/password_form.dart';
import 'package:application_patient/view/sign_up/username_form.dart';
import 'package:flutter/material.dart';

import 'package:formwidget/formwidget.dart';
import 'package:get/get.dart';

import 'package:application_patient/controller/signUp_controller.dart';

import 'package:application_patient/view/component/custom_Button.dart';
import 'package:application_patient/view/component/custom_Button_Widget.dart';

import 'package:application_patient/view/component/form_error.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  SignUpController controller = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: baseColor,
        title: Text(
          "Create Account",
          style: Theme.of(context).textTheme.headline5,
        ),
        centerTitle: true,
      ),
      body: GetBuilder<SignUpController>(builder: (controller) {
        return SafeArea(
          bottom: false,
          child: GestureDetector(
            onTap: () {
              setState(() {
                FocusScope.of(context).unfocus();
              });
            },
            child: Container(
              width: Get.width,
              height: Get.height,
              color: baseColor,
              padding: const EdgeInsets.all(15.0),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: Get.height * 0.03,
                    ),
                    Text(
                      "Welcome Back, Start meditate with creating an Account",
                      textAlign: TextAlign.center,
                      style: Theme.of(context)
                          .textTheme
                          .headline6!
                          .copyWith(fontWeight: FontWeight.w300),
                    ),
                    SizedBox(
                      height: Get.height * 0.1,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Form(
                        key: controller.form,
                        child: Column(
                          children: [
                            UserNameForm(
                                focusNode: controller.username,
                                controller:
                                    controller.usernameEditingController,
                                onEditingComplete: () {
                                  FocusScope.of(context)
                                      .requestFocus(controller.email);
                                },
                                onchange: controller.onchangeusername,
                                onSave: controller.saveusername,
                                validator: controller.validatorusername),
                            SizedBox(
                              height: Get.height * 0.04,
                            ),
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
                                controller:
                                    controller.passwordEditingController,
                                onEditingComplete: () {
                                  FocusScope.of(context)
                                      .requestFocus(controller.confirmpass);
                                },
                                onchange: controller.changepassword,
                                onSave: controller.savepassword,
                                validator: controller.validatorpassword,
                                ontap: controller.togglepassword,
                                obscure: controller.obscure,
                                label: "Password",
                                hint: "****************"),
                            SizedBox(
                              height: Get.height * 0.04,
                            ),
                            PasswordForm(
                                focusNode: controller.confirmpass,
                                controller: controller.confirmEditingController,
                                onEditingComplete: () {
                                  FocusScope.of(context).unfocus();
                                },
                                onchange: controller.changepasswordconfirm,
                                onSave: controller.savepasswordconfirm,
                                validator: controller.validatorpasswordconfirm,
                                ontap: controller.toggleconfirmpassword,
                                obscure: controller.obscureConfirm,
                                label: "Confirm Password",
                                hint: "****************"),
                            SizedBox(
                              height: Get.height * 0.02,
                            ),
                            FormError(
                              erros: controller.error,
                            ),
                            SizedBox(
                              height: Get.height * 0.1,
                            ),
                            controller.loading
                                ? Image.asset(
                                    "assets/animations/spinner.gif",
                                    width: 70,
                                    height: 70,
                                  )
                                : CustomButton(
                                    text: "Sign Up",
                                    press: () async {
                                      if (controller.form.currentState!
                                          .validate()) {
                                        controller.form.currentState!.save();
                                        await controller.adduser();
                                        controller.clearcontroller();
                                      }
                                      //
                                    }),
                            SizedBox(
                              height: Get.height * 0.03,
                            ),
                            BottomWidget(
                                text: "if you already have an Account? ",
                                press: () {
                                  Get.offNamed(RoutesName.login);
                                },
                                botton: "Sign In"),
                            SizedBox(
                              height: Get.height * 0.03,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
