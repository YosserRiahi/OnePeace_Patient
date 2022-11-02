import 'package:flutter/material.dart';



class WelcomeSubtitle extends StatelessWidget {
  const WelcomeSubtitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text("Boost your life\n Enhance the world",style: Theme.of(context).textTheme.bodyText1!.copyWith(
        fontWeight: FontWeight.w500,
        color: Colors.black45,
        letterSpacing: 0.6
    ),textAlign: TextAlign.center,);
  }
}