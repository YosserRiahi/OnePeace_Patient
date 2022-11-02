

import 'package:application_patient/controller/onboarding_controller.dart';
import 'package:get/get.dart';

class OnboardingBind extends Bindings{
  @override
  void dependencies() {
     Get.put(() => OnboardingController());
  }

}