// ignore: file_names
import 'package:flutter/material.dart';

class BottomWidget extends StatelessWidget {
  const BottomWidget({
    Key? key,
    required this.text,
    required this.press,
    required this.botton,
  }) : super(key: key);
  final String text;
  final VoidCallback? press;
  final String botton;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(text,
            style: Theme.of(context)
                .textTheme
                .bodySmall!
                .copyWith(color: Colors.black87)),
        TextButton(
          onPressed: press,
          child: Text(
            botton,
          ),
        )
      ],
    );
  }
}
