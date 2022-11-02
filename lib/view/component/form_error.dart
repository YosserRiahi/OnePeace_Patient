import 'package:application_patient/view/component/icon_error.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';



class FormError extends StatelessWidget {
  const FormError({
    Key? key, required this.erros,
  }) : super(key: key);
  final List<String> erros;

  @override
  Widget build(BuildContext context) {
    return Column(
        children: List.generate(erros.length, (index) => Row(
          children: [
            const SvgErrorForm(),
            SizedBox(width: Get.width*0.04,),
            Text(erros[index],style: Theme.of(context).textTheme.bodyText1,)
          ],
        ),)
    );
  }
}

