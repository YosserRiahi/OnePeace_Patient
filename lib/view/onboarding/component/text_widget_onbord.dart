import 'package:application_patient/core/models/onbording_class.dart';
import 'package:flutter/material.dart';

class WidgetText extends StatelessWidget {
  const WidgetText({
    Key? key,
    required this.onboarding,
  }) : super(key: key);

  final Onboarding onboarding;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Text(
        onboarding.title,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.headline6!.copyWith(
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }
}
