import 'package:application_patient/controller/meditation_controller.dart';
import 'package:get/get.dart';

class Meditabind extends Bindings {
  @override
  void dependencies() {
    Get.put(() => MeditationController());
  }
}
