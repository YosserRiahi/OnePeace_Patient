import 'package:application_patient/controller/verification_controller.dart';
import 'package:application_patient/view/component/custom_Button.dart';
import 'package:application_patient/view/component/form_error.dart';
import 'package:application_patient/view/verifie_code/form_value.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class Verification extends StatelessWidget {
  Verification({super.key});

  VerificationController controller = Get.put(VerificationController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        title: Text(
          "Verification Code",
          style: Theme.of(context).textTheme.headline5,
        ),
      ),
      body: GetBuilder<VerificationController>(builder: (controller) {
        return SafeArea(
            child: GestureDetector(
          onTap: () {
            controller.unfocus(context);
          },
          child: SizedBox(
            width: double.infinity,
            height: Get.height,
            child: SingleChildScrollView(
              child: Column(
                children: [
                  SizedBox(
                    height: Get.height * 0.08,
                  ),
                  Text(
                    "Almost There, Verifie your  Account",
                    textAlign: TextAlign.center,
                    style: Theme.of(context)
                        .textTheme
                        .headline5!
                        .copyWith(fontWeight: FontWeight.w300),
                  ),
                  SizedBox(
                    height: Get.height * 0.01,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Text(
                      "check your email account, we aleardy send to you a code verification ,please enter the code",
                      style: Theme.of(context).textTheme.bodyText1!.copyWith(
                          color: Colors.grey.shade600, letterSpacing: 0.6),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  SizedBox(
                    height: Get.height * 0.1,
                  ),
                  Container(
                    height: 100,
                    width: double.infinity,
                    margin: const EdgeInsetsDirectional.all(10),
                    child: Form(
                      key: controller.form,
                      child: ListView(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        children: [
                          FormValue(
                            controller: controller.one,
                            node: controller.node1,
                            validator: controller.validatorOne,
                            onsave: controller.saveone,
                            onchange: (value) {
                              controller.onchange(value);
                              controller.requestnode(
                                  controller.node2, value, context);
                            },
                          ),
                          FormValue(
                            node: controller.node2,
                            controller: controller.two,
                            onsave: controller.savetwo,
                            validator: controller.validatorTwo,
                            onchange: (value) {
                              controller.onchangetwo(value);
                              controller.requestnode(
                                  controller.node3, value, context);
                            },
                          ),
                          FormValue(
                            controller: controller.three,
                            node: controller.node3,
                            onsave: controller.savethree,
                            validator: controller.validatorThree,
                            onchange: (value) {
                              controller.onchangethree(value);
                              controller.requestnode(
                                  controller.node4, value, context);
                            },
                          ),
                          FormValue(
                            controller: controller.four,
                            node: controller.node4,
                            onsave: controller.savefour,
                            validator: controller.validatorfour,
                            onchange: (value) {
                              controller.onchangefour(value);
                              controller.requestnode(
                                  controller.node5, value, context);
                            },
                          ),
                          FormValue(
                            controller: controller.five,
                            node: controller.node5,
                            onsave: controller.savefive,
                            validator: controller.validatorfive,
                            onchange: (value) {
                              controller.onchangefive(value);
                              controller.unrequestnode(value, context);
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15.0),
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
                          text: "send",
                          press: () async {
                            if (controller.form.currentState!.validate()) {
                              controller.form.currentState!.save();
                              controller.code();

                              await controller.verifiecode();
                            }
                          }),
                ],
              ),
            ),
          ),
        ));
      }),
    );
  }
}
