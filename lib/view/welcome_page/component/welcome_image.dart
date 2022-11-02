import 'package:flutter/material.dart';
import 'package:get/get.dart';

class WelcomeImage extends StatelessWidget {
  const WelcomeImage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/logo/107901-meditation.gif',
      height: Get.height * 0.5,
    );
  }
}
