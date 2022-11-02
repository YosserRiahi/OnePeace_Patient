import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../core/constant/palette_colors.dart';

class Logo extends StatelessWidget {
  const Logo({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ClayContainer(
          width: Get.width * 0.3,
          height: Get.width * 0.3,
          borderRadius: Get.width * 0.15,
          color: baseColor,
          depth: 30,
          curveType: CurveType.none,
          child: Image.asset(
            "assets/logo/OnePeace.png",
            width: Get.width * 0.3,
            height: Get.width * 0.3,
          )),
    );
  }
}
