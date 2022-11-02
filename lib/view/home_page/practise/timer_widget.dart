import 'package:application_patient/view/component/custom_Button.dart';
import 'package:application_patient/view/home_page/practise/starting_counting.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';

class PractiseCounter extends StatelessWidget {
  const PractiseCounter({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            color: Colors.deepPurple,
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back_ios_new_rounded)),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Lottie.asset(
              "assets/categorie/animation_music.json",
            ),
            const Spacer(),
            Text("Welcome To Meditation Practise",
                textAlign: TextAlign.center,
                style: GoogleFonts.shalimar(
                    color: const Color.fromARGB(255, 113, 154, 225),
                    fontWeight: FontWeight.w700,
                    fontSize: 60)),
            const Spacer(
              flex: 2,
            ),
            CustomButton(
                text: "Start Practicing",
                press: () {
                  Get.to(() => const CountStart());
                }),
            const Spacer()
          ],
        ),
      ),
    );
  }
}
