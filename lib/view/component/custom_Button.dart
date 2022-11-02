// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    Key? key,
    required this.text,
    required this.press,
    this.color = Colors.white,
  }) : super(key: key);

  final String text;
  final VoidCallback press;
  Color color;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
        minWidth: Get.width * 0.7,
        height: Get.height * 0.06,
        color: Colors.purple.shade100,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        elevation: 25,
        onPressed: press,
        child: Text(
          text,
          style: Theme.of(context)
              .textTheme
              .subtitle1!
              .copyWith(fontWeight: FontWeight.w500, color: color),
        ));
  }
}
