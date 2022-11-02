


import 'package:application_patient/controller/signUp_controller.dart';
import 'package:get/get.dart';

class SignUpBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(()=>SignUpController());
  }

}