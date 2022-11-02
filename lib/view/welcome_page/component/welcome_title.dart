import 'package:flutter/material.dart';



class WelcomeTitle extends StatelessWidget {
  const WelcomeTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text("Welcome To OnePeace\nPatient",style: Theme.of(context).textTheme.headline6!.copyWith(
        fontWeight: FontWeight.bold
    ),textAlign: TextAlign.center,);
  }
}