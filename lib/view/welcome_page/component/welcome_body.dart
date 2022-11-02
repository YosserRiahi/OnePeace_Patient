import 'package:application_patient/view/welcome_page/component/welcome_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../core/constant/route_name.dart';
import '../../component/custom_Button.dart';
import '../../component/custom_Button_Widget.dart';
import 'welcome_subtitle.dart';
import 'welcome_title.dart';

class WelcomeBody extends StatelessWidget {
  const WelcomeBody({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Container(
          width: Get.width,
          height: Get.height,
          color: Colors.white,
          child: Column(
            children: [
              const WelcomeImage(),
              const WelcomeTitle(),
              SizedBox(
                height: Get.height * 0.02,
              ),
              const WelcomeSubtitle(),
              SizedBox(
                height: Get.height * 0.1,
              ),
              CustomButton(
                  text: "Get Started",
                  press: () {
                    Get.toNamed(RoutesName.signup);
                  }),
              SizedBox(
                height: Get.height * 0.02,
              ),
              BottomWidget(
                text: "Already have an Account ? ",
                press: () {
                  Get.toNamed(RoutesName.login);
                },
                botton: "Sign in",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
