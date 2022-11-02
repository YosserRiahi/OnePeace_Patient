


import 'package:get/get.dart';

class OnboardingController extends GetxController{
  int index =0;



  void updateIndex(int? value){
    index =value!;
    update();
  }
}