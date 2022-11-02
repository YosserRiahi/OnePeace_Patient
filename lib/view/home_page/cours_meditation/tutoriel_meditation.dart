// ignore_for_file: public_member_api_docs, sort_constructors_first, must_be_immutable
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_typedefs/rx_typedefs.dart';
import 'package:lottie/lottie.dart';

import 'package:application_patient/controller/meditation_controller.dart';
import 'package:application_patient/core/constant/route_name.dart';

class LearnMdetation extends StatelessWidget {
  LearnMdetation({super.key});
  MeditationController controller = Get.put(MeditationController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: Get.width,
        height: Get.height,
        child: SingleChildScrollView(
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Container(
              height: Get.height * 0.4,
              width: Get.width,
              decoration: BoxDecoration(
                color: Colors.deepPurple.shade200,
              ),
              child: Stack(
                fit: StackFit.expand,
                children: [
                  Positioned(
                    right: -100,
                    bottom: 50.0,
                    child: SvgPicture.asset(
                      "assets/icons/meditationHome.svg",
                      width: Get.width * 0.1,
                      height: Get.height * 0.3,
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                      top: Get.height * 0.06,
                      child: Container(
                        padding: const EdgeInsets.only(left: 20, top: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Text(
                                  "Meditation",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline4!
                                      .copyWith(fontWeight: FontWeight.w600),
                                ),
                                SizedBox(
                                  width: Get.width * 0.4,
                                ),
                                GestureDetector(
                                  onTap: () {
                                    Get.back();
                                  },
                                  child: Container(
                                    padding: const EdgeInsets.all(5),
                                    decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color:
                                            Color.fromARGB(255, 225, 205, 255)),
                                    child: const Icon(
                                      Icons.arrow_right,
                                      size: 30,
                                      color: Colors.white,
                                    ),
                                  ),
                                )
                              ],
                            ),
                            SizedBox(
                              height: Get.height * 0.02,
                            ),
                            Text(
                              "3-10 Min of Course",
                              style: Theme.of(context)
                                  .textTheme
                                  .labelLarge!
                                  .copyWith(fontWeight: FontWeight.bold),
                            ),
                            SizedBox(
                              height: Get.height * 0.03,
                            ),
                            Text(
                              "Live happier and healthier by learning\nthe Fundamentals of meditation \nand mindfulness",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyText2!
                                  .copyWith(
                                      letterSpacing: 1.2,
                                      fontWeight: FontWeight.w500),
                            ),
                            SizedBox(
                              height: Get.height * 0.04,
                            ),
                          ],
                        ),
                      ))
                ],
              ),
            ),
            GetBuilder<MeditationController>(builder: (controlle) {
              return GridSaison(controller: controller);
            }),
            SizedBox(
              height: Get.height * 0.02,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 20.0),
              child: Text(
                "Quiz and Practise",
                style: Theme.of(context)
                    .textTheme
                    .headline5!
                    .copyWith(fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(
              height: Get.height * 0.03,
            ),
            GetBuilder<MeditationController>(
              builder: (controller) {
                return QuizButton(
                  controller: controller,
                );
              },
            ),
            SizedBox(
              height: Get.height * 0.01,
            ),
          ]),
        ),
      ),
    );
  }
}

class QuizButton extends StatelessWidget {
  const QuizButton({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final MeditationController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: Get.width,
      height: Get.height * 0.13,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: MaterialButton(
        onPressed: controller.quiz
            ? () {
                Get.toNamed(RoutesName.quiz);
              }
            : () {
                showDialog(
                    context: context,
                    builder: (context) {
                      return const AlertWidget(
                        title:
                            " Your must unlock the last Session Course  level to get the Quiz",
                      );
                    });
              },
        elevation: 5,
        color: Colors.white,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        child: Row(
          children: [
            Expanded(
              child: SvgPicture.asset("assets/animations/meditation.svg"),
            ),
            Expanded(
              flex: 2,
              child: Text(
                "Basic Level of Quiz Meditate",
                style: Theme.of(context).textTheme.bodyText1,
              ),
            ),
            Expanded(child: SvgPicture.asset("assets/icons/Lock.svg")),
          ],
        ),
      ),
    );
  }
}

class GridSaison extends StatelessWidget {
  const GridSaison({Key? key, required this.controller}) : super(key: key);
  final MeditationController controller;

  @override
  Widget build(BuildContext context) {
    return Transform.translate(
      offset: const Offset(0, -50),
      child: GridView.count(
        mainAxisSpacing: 20,
        physics: const NeverScrollableScrollPhysics(),
        padding: const EdgeInsets.symmetric(horizontal: 20),
        crossAxisSpacing: 20,
        crossAxisCount: 2,
        childAspectRatio: 2.5,
        shrinkWrap: true,
        children: [
          SaisonCourse(
            text: "Session 01",
            press: () {
              Get.toNamed(RoutesName.coursone);
            },
            color: Colors.deepPurple.shade400,
            icons: controller.saison1
                ? Icons.pause_circle_outline_sharp
                : Icons.play_circle_sharp,
          ),
          SaisonCourse(
            text: "Session 02",
            icons: controller.saison2
                ? Icons.pause_circle_outline_sharp
                : Icons.play_circle_sharp,
            color: controller.saison2
                ? Colors.deepPurple.shade300
                : Colors.deepPurple.shade50,
            press: controller.saison2
                ? () {
                    Get.toNamed(RoutesName.courstwo);
                  }
                : () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return const AlertWidget(
                            title:
                                " Your must unlock the First level to get this Session",
                          );
                        });
                  },
          ),
          SaisonCourse(
            icons: controller.saison3
                ? Icons.pause_circle_outline_sharp
                : Icons.play_circle_sharp,
            color: controller.saison3
                ? Colors.deepPurple.shade300
                : Colors.deepPurple.shade50,
            text: "Session 03",
            press: controller.saison3
                ? () {
                    Get.toNamed(RoutesName.coursthree);
                  }
                : () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return const AlertWidget(
                            title:
                                " Your must unlock the Second level to get this Session",
                          );
                        });
                  },
          ),
          SaisonCourse(
            icons: controller.saison4
                ? Icons.pause_circle_outline_sharp
                : Icons.play_circle_sharp,
            color: controller.saison4
                ? Colors.deepPurple.shade300
                : Colors.deepPurple.shade50,
            text: "Session 04",
            press: controller.saison4
                ? () {
                    Get.toNamed(RoutesName.coursfour);
                  }
                : () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return const AlertWidget(
                            title:
                                " Your must unlock the Third level to get this Session",
                          );
                        });
                  },
          ),
          SaisonCourse(
            icons: controller.saison5
                ? Icons.pause_circle_outline_sharp
                : Icons.play_circle_sharp,
            color: controller.saison5
                ? Colors.deepPurple.shade300
                : Colors.deepPurple.shade50,
            text: "Session 05",
            press: controller.saison5
                ? () {
                    Get.toNamed(RoutesName.coursfive);
                  }
                : () {
                    showDialog(
                        context: context,
                        builder: (context) {
                          return const AlertWidget(
                            title:
                                " Your must unlock the Fourth level to get this Session",
                          );
                        });
                  },
          ),
        ],
      ),
    );
  }
}

class AlertWidget extends StatelessWidget {
  const AlertWidget({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return CupertinoAlertDialog(
      insetAnimationCurve: Curves.easeIn,
      insetAnimationDuration: const Duration(milliseconds: 700),
      title: Text(
        "Alert Dialog",
        style: Theme.of(context).textTheme.headline6,
      ),
      content: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Text(title),
          ),
          LottieBuilder.asset(
              "assets/animations/50432-notification-animation.json")
        ],
      ),
    );
  }
}

class SaisonCourse extends StatelessWidget {
  const SaisonCourse({
    Key? key,
    required this.text,
    required this.press,
    required this.color,
    required this.icons,
  }) : super(key: key);
  final String text;
  final Callback press;
  final Color color;
  final IconData icons;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: press,
      child: Material(
        elevation: 5,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        color: Colors.grey.shade100,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Row(children: [
            Icon(
              icons,
              color: color,
              size: Get.width * 0.08,
            ),
            SizedBox(
              width: Get.width * 0.03,
            ),
            Text(
              text,
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(fontWeight: FontWeight.w600),
            )
          ]),
        ),
      ),
    );
  }
}

// Lottie.asset("assets/animations/meditation_animation.json"),
