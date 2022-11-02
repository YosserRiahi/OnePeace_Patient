import 'package:application_patient/view/reset_password/reset_password.dart';
import 'package:get/get.dart';

class ForgetBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ForgetPassword());
  }
}
