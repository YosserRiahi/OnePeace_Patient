import 'package:application_patient/core/constant/palette_colors.dart';
import 'package:flutter/material.dart';

import '../../../controller/onboarding_controller.dart';
import '../../../data/onboarding_data/data_ui_onboarding.dart';
import 'lottie_image.dart';
import 'text_widget_onbord.dart';

class PageViewComponent extends StatelessWidget {
  const PageViewComponent({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final OnboardingController controller;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        flex: 4,
        child: Container(
          color: baseColor,
          child: PageView.builder(
              itemCount: listOnboarding.length,
              onPageChanged: (value) {
                controller.updateIndex(value);
              },
              itemBuilder: (context, index) {
                final onboarding = listOnboarding[index];
                return Column(
                  children: [
                    const Spacer(),
                    WidgetText(onboarding: onboarding),
                    const Spacer(),
                    LottieWidget(onboarding: onboarding),
                    const Spacer(
                      flex: 2,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Text(
                        onboarding.message,
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .bodyText1!
                            .copyWith(color: Colors.black87),
                      ),
                    ),
                  ],
                );
              }),
        ));
  }
}
