import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';



class SvgErrorForm extends StatelessWidget {
  const SvgErrorForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset('assets/icons/Error.svg');
  }
}