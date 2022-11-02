// ignore_for_file: must_be_immutable

import 'package:application_patient/core/constant/palette_colors.dart';
import 'package:application_patient/view/component/custom_Button.dart';
import 'package:application_patient/view/home_page/care_youself/list_doctor.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

// ignore: use_key_in_widget_constructors
class DoctorsWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: () {
              Get.back();
            },
            child: const Icon(
              Icons.arrow_back_ios_new_outlined,
              color: Colors.grey,
            ),
          ),
        ),
      ),
      body: SafeArea(
        bottom: false,
        child: Container(
          color: Colors.white,
          width: double.infinity,
          height: Get.height,
          child: Column(children: [
            const Spacer(
              flex: 2,
            ),
            Card(
              elevation: 0,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              color: Colors.white,
              child: LottieBuilder.asset(
                "assets/logo/calender.json",
                width: Get.width * 0.6,
                height: Get.width * 0.6,
              ),
            ),
            Text(
              "Request Appointements \nwith Professional\n Psychologists",
              style: Theme.of(context).textTheme.headline5!.copyWith(
                  letterSpacing: 1.0,
                  color: Colors.black45,
                  fontWeight: FontWeight.w400),
              textAlign: TextAlign.center,
            ),
            const Spacer(
              flex: 4,
            ),
            CustomButton(
                text: "Start ",
                press: () {
                  Get.off(() => ListDoctor());
                }),
            const Spacer(),
          ]),
        ),
      ),
    );
  }
}
