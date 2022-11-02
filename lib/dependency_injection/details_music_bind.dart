



import 'package:application_patient/controller/music_details_controller.dart';
import 'package:get/get.dart';

class DetailsMusicBinding extends Bindings{
  @override
  void dependencies() {
    Get.put(DetailsMusicController());
  }

}