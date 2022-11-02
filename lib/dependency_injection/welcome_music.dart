
import 'package:application_patient/controller/welcome_music.dart';
import 'package:get/get.dart';
class WelcomeMusicBinding extends Bindings{
  @override
  void dependencies() {
   Get.put(WelcomeMusicController());
  }

}