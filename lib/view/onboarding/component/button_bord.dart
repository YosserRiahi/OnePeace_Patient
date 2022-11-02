import 'package:application_patient/controller/onboarding_controller.dart';
import 'package:application_patient/core/constant/palette_colors.dart';
import 'package:application_patient/view/component/custom_Button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/route_name.dart';
import 'animated_bollon.dart';

class ButtonOnbord extends StatelessWidget {
  const ButtonOnbord({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: baseColor,
        child: Column(
          children: [
            GetBuilder<OnboardingController>(
                init: Get.put(OnboardingController()),
                builder: (controller) {
                  return AnimatedBollon(
                    controller: controller,
                  );
                }),
            const Spacer(),
            CustomButton(
                text: "Skip",
                press: () {
                  Get.offAllNamed(RoutesName.welcome);
                }),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}
