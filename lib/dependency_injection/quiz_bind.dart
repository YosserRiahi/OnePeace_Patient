import 'package:application_patient/controller/quiz_controller.dart';
import 'package:get/get.dart';

class QuizBind extends Bindings {
  @override
  void dependencies() {
    Get.put(() => QuizController());
  }
}
