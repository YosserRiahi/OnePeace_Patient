// ignore_for_file: public_member_api_docs, sort_constructors_first, use_key_in_widget_constructors

import 'package:application_patient/core/constant/palette_colors.dart';
import 'package:flutter/material.dart';
import 'package:formwidget/formwidget.dart';
import 'package:get/get.dart';
import 'package:application_patient/controller/forget_controller.dart';
import 'package:application_patient/view/component/custom_Button.dart';
import 'package:application_patient/view/component/form_error.dart';

// ignore: must_be_immutable
class ForgetPassword extends StatelessWidget {
  ForgetController controller = Get.put(ForgetController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: baseColor,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.black,
          ),
          iconSize: 20,
        ),
      ),
      body: GetBuilder<ForgetController>(builder: (controller) {
        return SafeArea(
          bottom: false,
          child: SingleChildScrollView(
            child: Container(
              width: Get.width,
              height: Get.height,
              color: baseColor,
              padding: const EdgeInsets.all(15.0),
              child: Center(
                child: Column(
                  children: [
                    //  SizedBox(height: Get.height*0.08,),
                    const ForgetTitle(),
                    SizedBox(
                      height: Get.height * 0.05,
                    ),
                    const ForgetBody(),
                    SizedBox(
                      height: Get.height * 0.1,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Form(
                        key: controller.form,
                        child: EmailForm(
                          controller: controller.textEditingController,
                          focusnode: controller.node,
                          onchange: controller.onchange,
                          onsave: controller.save,
                          validator: controller.validator,
                          onEditingComplete: () {
                            FocusScope.of(context).unfocus();
                          },
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 10),
                      child: FormError(
                        erros: controller.error,
                      ),
                    ),
                    SizedBox(
                      height: Get.height * 0.3,
                    ),
                    controller.loading
                        ? Image.asset(
                            "assets/animations/spinner.gif",
                            width: 70,
                            height: 70,
                          )
                        : CustomButton(
                            text: "Send ",
                            press: () {
                              if (controller.form.currentState!.validate()) {
                                controller.form.currentState!.save();
                                controller.resetpassword();
                              } else {
                                controller.form.currentState!.reset();
                              }
                            },
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

class ForgetBody extends StatelessWidget {
  const ForgetBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "Please enter your email address. You will\nreceive a link to create a new \npassword via email",
      textAlign: TextAlign.center,
      style: Theme.of(context)
          .textTheme
          .bodyText2!
          .copyWith(fontWeight: FontWeight.w500, letterSpacing: 0.7),
    );
  }
}

class ForgetTitle extends StatelessWidget {
  const ForgetTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "Forget Password",
      style: Theme.of(context)
          .textTheme
          .headline4!
          .copyWith(fontWeight: FontWeight.bold, color: Colors.black),
      textAlign: TextAlign.center,
    );
  }
}
