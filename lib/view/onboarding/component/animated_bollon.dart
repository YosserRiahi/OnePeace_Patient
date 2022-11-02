import 'package:flutter/material.dart';

import '../../../controller/onboarding_controller.dart';
import '../../../data/onboarding_data/data_ui_onboarding.dart';

class AnimatedBollon extends StatelessWidget {
  const AnimatedBollon({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final OnboardingController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        listOnboarding.length,
        (id) => AnimatedContainer(
          width: id == controller.index ? 40 : 10,
          height: 10,
          margin: const EdgeInsets.only(right: 5),
          decoration: BoxDecoration(
              color: id == controller.index ? Colors.black : Colors.grey,
              borderRadius: BorderRadius.circular(10)),
          duration: const Duration(milliseconds: 400),
          curve: Curves.easeIn,
        ),
      ),
    );
  }
}
