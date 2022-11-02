import 'package:flutter/material.dart';

class TextWelcome extends StatelessWidget {
  const TextWelcome({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        "Start your experience with meditation\nTake a breath and ease your mind\nLet's sign in ",
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.bodySmall!.copyWith(
            letterSpacing: 0.5,
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: Colors.black54),
      ),
    );
  }
}
