import 'package:application_patient/controller/onboarding_controller.dart';
import 'package:application_patient/core/constant/palette_colors.dart';
import 'package:application_patient/view/onboarding/component/page_view_component.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'button_bord.dart';

class Body extends StatelessWidget {
  const Body({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final OnboardingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.height,
      color: baseColor,
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          PageViewComponent(controller: controller),
          const ButtonOnbord(),
        ],
      ),
    );
  }
}
