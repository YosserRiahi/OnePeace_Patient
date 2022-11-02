import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../core/models/onbording_class.dart';

class LottieWidget extends StatelessWidget {
  const LottieWidget({
    Key? key,
    required this.onboarding,
  }) : super(key: key);

  final Onboarding onboarding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: Lottie.asset(onboarding.pathUrl,
          width: Get.width * 0.8, height: Get.height * 0.4),
    );
  }
}
