// ignore: file_names
import 'package:application_patient/core/constant/route_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import 'package:lottie/lottie.dart';

import '../../../controller/water_controller.dart';

class FetchWidget extends StatefulWidget {
  const FetchWidget({super.key});

  @override
  State<FetchWidget> createState() => _FetchWidgetState();
}

class _FetchWidgetState extends State<FetchWidget>
    with TickerProviderStateMixin {
  WaterController watercontroller = Get.put(WaterController());

  late AnimationController _controller;

  late AnimationController _controllerbutton;

  late Animation _animation;

  late Animation _animationbutton;

  bool _istared = true;

  @override
  void dispose() {
    super.dispose();
    _controllerbutton.dispose();
    _controller.dispose();
  }

  @override
  void initState() {
    super.initState();

    watercontroller.fetchConfig();
    watercontroller.fetchdosetoday();

    // ignore: avoid_print
    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 3));
    _controllerbutton = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 900));
    _animation = Tween<double>(begin: 0.0, end: 1.0)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeIn))
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          setState(() {});
        }
      });
    _animationbutton = Tween<double>(begin: 1.0, end: 30.0).animate(
        CurvedAnimation(parent: _controllerbutton, curve: Curves.easeInExpo))
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _controllerbutton.reset();
          setState(() {
            _istared = false;
          });
          Get.toNamed(RoutesName.addwater);
        }
      });
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 240, 248, 255),
        elevation: 0.0,
        leading: IconButton(
            onPressed: () {
              Get.offNamed(RoutesName.home);
            },
            icon: const Icon(Icons.arrow_back_ios_new)),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: GetBuilder<WaterController>(builder: (controller) {
        return AnimatedBuilder(
          animation: _controller,
          builder: (context, widget) {
            return Opacity(
              opacity: _animation.value,
              child: AnimatedBuilder(
                  animation: _controllerbutton,
                  builder: (context, child) {
                    return Transform.scale(
                      scale: _animationbutton.value,
                      child: FloatingActionButton(
                        onPressed: () {
                          setState(() {
                            // _controllerbutton.forward();
                            //_istared = false;
                          });
                          //controller.adddose();
                          Get.toNamed(RoutesName.addwater);
                        },
                        child: _istared ? const Icon(Icons.add) : Container(),
                      ),
                    );
                  }),
            );
          },
          child: widget,
        );
      }),
      body: GetBuilder<WaterController>(builder: (controller) {
        return controller.isloeading
            ? Center(
                child: Image.asset(
                  "assets/animations/ripple.gif",
                  width: 200,
                  height: 200,
                ),
              )
            : SafeArea(
                bottom: false,
                child: AnimatedBuilder(
                    animation: _controller,
                    builder: (context, child) {
                      return Opacity(
                        opacity: _animation.value,
                        child: SizedBox(
                          height: Get.height,
                          width: double.infinity,
                          child: Stack(
                            children: [
                              AnimatedPositioned(
                                duration: const Duration(seconds: 3),
                                bottom: 0.0,
                                child: SvgPicture.asset(
                                  "assets/water_assets/undraw_energizer_re_vhjv.svg",
                                  fit: BoxFit.contain,
                                  height: Get.height * 0.6,
                                ),
                              ),
                              AnimatedPositioned(
                                duration: const Duration(seconds: 3),
                                bottom: 0.0,
                                left: 0.0,
                                right: 0.0,
                                child: Opacity(
                                  opacity: 0.7,
                                  child: Lottie.asset(
                                    "assets/water_assets/dark-waves.json",
                                    width: double.infinity,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              AnimatedPositioned(
                                duration: const Duration(seconds: 3),
                                top: Get.height * 0.7,
                                left: 100,
                                child: Text(
                                  "pourcentage ${controller.pourcentage.toString()} %",
                                  style: Theme.of(context).textTheme.headline5,
                                ),
                              ),
                              Positioned(
                                top: 0,
                                left: 0,
                                right: 0,
                                child: Column(
                                  children: [
                                    SizedBox(height: Get.height * 0.08),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Text(
                                          "Objective For Today",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline5,
                                        ),
                                        SizedBox(
                                          height: Get.height * 0.03,
                                        ),
                                        controller.model == null
                                            ? const Text("")
                                            : Text(
                                                "${controller.model!.objective} mL",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .headline4,
                                              ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        Text(
                                          "Quantity drank today ${controller.dose} mL",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline6,
                                        ),
                                        const SizedBox(
                                          height: 50,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
              );
      }),
    );
  }
}
