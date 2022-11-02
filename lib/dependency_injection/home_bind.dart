import 'package:application_patient/controller/home_controller.dart';
import 'package:get/get.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    BindingsBuilder(() {
      Get.put(HomeController());
    });
  }
}
