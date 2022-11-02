// ignore_for_file: unnecessary_brace_in_string_interps

import 'package:application_patient/controller/pratice_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class CountStart extends StatefulWidget {
  const CountStart({Key? key, this.title}) : super(key: key);

  final String? title;

  @override
  State<CountStart> createState() => _CountStartState();
}

class _CountStartState extends State<CountStart> with TickerProviderStateMixin {
  PractiseController controller = Get.put(PractiseController());
  late AnimationController _controller;

  late Animation<double> _animation;
  int second = 0;
  int minute = 0;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    _controller.duration = const Duration(seconds: 60);
    _animation = Tween<double>(begin: 0, end: 60).animate(_controller);

    _controller.addListener(() {
      if (_controller.isCompleted) {
        // ignore: avoid_print
        print("animation completed");

        setState(() {
          minute++;
          if (minute < controller.duration) {
            _controller.reset();
            _controller.forward();
          } else if (_controller.isCompleted && minute == controller.duration) {
            controller.addschudelPractise(controller.duration);
            _controller.reset();
            minute = 0;

            controller.insertpractisetodb(controller.duration.toDouble());
          }
        });
      }
    });
  }

  String min(int minute) {
    if (minute < 10) {
      return "0${minute}";
    } else {
      return "${minute}";
    }
  }

  @override
  void dispose() {
    _controller.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 252, 246),
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Icon(
            Icons.arrow_back_ios_new_rounded,
            color: Colors.deepPurple.shade100,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (context) {
                  return CupertinoAlertDialog(
                    actions: [
                      TextButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: const Text("Back")),
                      TextButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: const Text("confirm"))
                    ],
                    content: Container(
                      padding: const EdgeInsets.all(10),
                      margin: const EdgeInsets.only(top: 10),
                      width: 300,
                      height: 400,
                      child:
                          GetBuilder<PractiseController>(builder: (controller) {
                        return ListView.builder(
                            itemCount: controller.periode.length,
                            itemBuilder: (context, index) {
                              final value = controller.periode[index];
                              return GestureDetector(
                                onTap: () {
                                  controller.updatevalue(value, index);
                                },
                                child: AnimatedOpacity(
                                    opacity: controller.selectedindex == index
                                        ? 1
                                        : 0.6,
                                    duration: const Duration(milliseconds: 00),
                                    child: Text(
                                      value.toString(),
                                      style: controller.selectedindex == index
                                          ? Theme.of(context)
                                              .textTheme
                                              .headline1
                                          : Theme.of(context)
                                              .textTheme
                                              .headline4,
                                    )),
                              );
                            });
                      }),
                    ),
                    title: const Text("select the duration"),
                  );
                },
              );
            },
            child: const IconSetting(),
          )
        ],
        title: Text(
          "Timer Meditate start",
          style: Theme.of(context).textTheme.headline5!.copyWith(
              color: Colors.grey.shade400, fontWeight: FontWeight.w500),
        ),
        elevation: 0.0,
        backgroundColor: const Color.fromARGB(255, 255, 252, 244),
      ),
      body: AnimatedBuilder(
        animation: _controller,
        builder: ((context, child) {
          return Align(
            alignment: Alignment.center,
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  top: Get.height * 0.1,
                  left: 0,
                  child: Lottie.asset("assets/animations/breath_animation.json",
                      alignment: Alignment.centerLeft,
                      fit: BoxFit.cover,
                      width: Get.width * 0.4,
                      height: Get.height * 0.5),
                ),
                Positioned(
                  top: Get.height * 0.39,
                  left: Get.width * 0.35,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        // ignore: prefer_interpolation_to_compose_strings
                        min(minute) + " : " + min((_animation.value).toInt()),
                        style: Theme.of(context).textTheme.headline3!.copyWith(
                            color: Colors.white, fontWeight: FontWeight.w700),
                      )
                    ],
                  ),
                ),
              ],
            ),
          );
        }),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const SizedBox(
            width: 30,
          ),
          _button(
            title: "Start",
            onPressed: () {
              setState(() {
                _controller.forward();
              });
            },
          ),
          const SizedBox(
            width: 10,
          ),
          _button(
            title: "Pause",
            onPressed: () {
              _controller.stop();
            },
          ),
          const SizedBox(
            width: 10,
          ),
          const SizedBox(
            width: 10,
          ),
          _button(
            title: "Restart",
            onPressed: () {
              setState(() {
                _controller.reset();
                minute = 0;
              });
            },
          ),
        ],
      ),
    );
  }

  Widget _button({required String title, VoidCallback? onPressed}) {
    return Expanded(
      child: ElevatedButton(
        style: ButtonStyle(
          elevation: const MaterialStatePropertyAll(20),
          backgroundColor:
              MaterialStateProperty.all(const Color.fromARGB(255, 96, 58, 103)),
        ),
        onPressed: onPressed,
        child: Text(
          title,
          style: const TextStyle(color: Colors.white),
        ),
      ),
    );
  }
}

class IconSetting extends StatelessWidget {
  const IconSetting({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 12.0, right: 15),
      child: SvgPicture.asset(
        "assets/icons/Settings.svg",
        color: Colors.black,
        width: 25,
        height: 25,
      ),
    );
  }
}
