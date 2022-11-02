import 'package:application_patient/core/constant/route_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class QuizMeditation extends StatelessWidget {
  const QuizMeditation({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            Icons.arrow_back_ios_new_outlined,
            color: Colors.black87,
          ),
        ),
      ),
      body: SafeArea(
        child: Center(
          child: MaterialButton(
            minWidth: Get.width * 0.6,
            height: Get.height * 0.07,
            elevation: 20,
            splashColor: Colors.deepPurple.shade700,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            color: const Color.fromARGB(255, 220, 203, 252),
            onPressed: () {
              Get.offAllNamed(RoutesName.startquiz);
            },
            child: Text(
              "Let's Start The Quiz",
              style: Theme.of(context).textTheme.headline6!.copyWith(
                  letterSpacing: 1.0,
                  color: Colors.white,
                  fontWeight: FontWeight.w600),
            ),
          ),
        ),
      ),
    );
  }
}
