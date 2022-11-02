import 'package:application_patient/controller/onboarding_controller.dart';
import 'package:application_patient/core/constant/palette_colors.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'component/body_onboard.dart';

// ignore: must_be_immutable
class OnboardingPage extends StatelessWidget {
  OnboardingPage({Key? key}) : super(key: key);

  OnboardingController controller = Get.put(OnboardingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: baseColor,
      body: SafeArea(
        child: Body(controller: controller),
      ),
    );
  }
}
