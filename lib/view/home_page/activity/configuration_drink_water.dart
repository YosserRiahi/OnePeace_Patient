// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:application_patient/core/constant/route_name.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import 'package:application_patient/controller/notification_controller.dart';

class ConfigurationWater extends StatefulWidget {
  const ConfigurationWater({super.key});

  @override
  State<ConfigurationWater> createState() => _ConfigurationWaterState();
}

class _ConfigurationWaterState extends State<ConfigurationWater> {
  NotifController controller = Get.put(NotifController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 228, 238, 255),
      body: GetBuilder<NotifController>(builder: (controller) {
        return SafeArea(
          bottom: false,
          child: Stack(
            fit: StackFit.expand,
            children: [
              Align(
                alignment: Alignment.bottomCenter,
                child: LottieBuilder.asset(
                  "assets/water/dark-waves.json",
                ),
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                  child: Center(
                    child: MaterialButton(
                      minWidth: Get.width * 0.5,
                      height: Get.height * 0.09,
                      color: Colors.black12,
                      animationDuration: const Duration(milliseconds: 300),
                      splashColor: Colors.blue.shade100,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      elevation: 30,
                      onPressed: () {
                        showModalBottomSheet(
                            isDismissible: false,
                            isScrollControlled: true,
                            constraints: BoxConstraints(
                                maxHeight: Get.height * 0.75,
                                minHeight: Get.height * 0.65,
                                minWidth: double.infinity),
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(30),
                                    topRight: Radius.circular(30))),
                            backgroundColor: Colors.black26,
                            barrierColor: Colors.black12,
                            context: context,
                            builder: (context) {
                              return GetBuilder<NotifController>(
                                  builder: (controller) {
                                return Container(
                                  width: double.infinity,
                                  color: Colors.transparent,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 20.0, left: 20, right: 20),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Water Tracker configuration :",
                                          style: Theme.of(context)
                                              .textTheme
                                              .headline6!
                                              .copyWith(color: Colors.white),
                                        ),
                                        const Divider(
                                          thickness: 2,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.symmetric(
                                                      vertical: 8.0,
                                                      horizontal: 10),
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    child: Text(
                                                      "Age :",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headline6!
                                                          .copyWith(
                                                              color:
                                                                  Colors.white),
                                                    ),
                                                  ),
                                                  Text(
                                                    controller.age.toString(),
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .headline6!
                                                        .copyWith(
                                                            color:
                                                                Colors.white),
                                                  ),
                                                  Text(
                                                    " years ",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .headline6!
                                                        .copyWith(
                                                            color: Colors
                                                                .grey.shade400),
                                                  )
                                                ],
                                              ),
                                            ),
                                            Slider(
                                              value: controller.age.toDouble(),
                                              activeColor:
                                                  Colors.deepPurple.shade100,
                                              inactiveColor:
                                                  Colors.grey.shade200,
                                              min: 10,
                                              max: 80,
                                              onChanged: (value) {
                                                controller.updateage(value);
                                              },
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: Get.height * 0.01,
                                        ),
                                        SizedBox(
                                          width: double.infinity,
                                          height: Get.height * 0.16,
                                          child: Row(
                                            children: [
                                              ConfigCard(
                                                title: "Height :",
                                                unit: " cm",
                                                increment:
                                                    controller.incrementheight,
                                                decrement:
                                                    controller.decrementheight,
                                                color: Colors.grey.shade50,
                                                value: controller.height
                                                    .toString(),
                                              ),
                                              ConfigCard(
                                                title: "Weight :",
                                                unit: " Kg",
                                                increment:
                                                    controller.incrementwight,
                                                decrement:
                                                    controller.decrementwight,
                                                color: Colors.grey.shade50,
                                                value:
                                                    controller.wight.toString(),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Container(
                                          margin: const EdgeInsets.all(5.0),
                                          width: double.infinity,
                                          height: Get.height * 0.27,
                                          padding: const EdgeInsets.all(10),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.symmetric(
                                                        vertical: 15.0),
                                                child: Text(
                                                  "Gendre :",
                                                  style: Theme.of(context)
                                                      .textTheme
                                                      .subtitle1!
                                                      .copyWith(
                                                          color: Colors.white),
                                                ),
                                              ),
                                              RadioListTile(
                                                  tileColor: Colors.black26,
                                                  selectedTileColor:
                                                      Colors.grey,
                                                  activeColor:
                                                      Colors.deepPurple,
                                                  shape: RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              20)),
                                                  title: Text(
                                                    "male",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .subtitle2!
                                                        .copyWith(
                                                            color:
                                                                Colors.white),
                                                  ),
                                                  value: TypeUser.male,
                                                  groupValue: controller.sex,
                                                  onChanged:
                                                      controller.updatetype),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              RadioListTile(
                                                  tileColor: Colors.black26,
                                                  activeColor:
                                                      Colors.deepPurple,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                  ),
                                                  title: Text(
                                                    "female",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .subtitle2!
                                                        .copyWith(
                                                            color:
                                                                Colors.white),
                                                  ),
                                                  value: TypeUser.femele,
                                                  groupValue: controller.sex,
                                                  onChanged:
                                                      controller.updatetype)
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: Get.height * 0.015,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            MaterialButton(
                                              elevation: 20,
                                              shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(
                                                  20,
                                                ),
                                              ),
                                              color: Colors.white,
                                              minWidth: Get.width * 0.5,
                                              height: Get.height * 0.055,
                                              onPressed: () {
                                                controller.addconfiguration(
                                                    controller.age,
                                                    controller.wight,
                                                    controller.height,
                                                    controller.sex);
                                                Get.offAllNamed(
                                                    RoutesName.fetchwater);
                                              },
                                              child: controller.send
                                                  ? const CircularProgressIndicator()
                                                  : Text(
                                                      "validate",
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headline6!
                                                          .copyWith(
                                                            color: const Color
                                                                    .fromARGB(
                                                                255,
                                                                0,
                                                                60,
                                                                109),
                                                          ),
                                                    ),
                                            ),
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              });
                            });
                      },
                      child: Text(
                        "Water Tracker ",
                        style: Theme.of(context).textTheme.headline6!.copyWith(
                            color: const Color.fromARGB(255, 0, 60, 109)),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}

class ConfigCard extends StatelessWidget {
  const ConfigCard({
    Key? key,
    required this.title,
    required this.value,
    required this.unit,
    required this.color,
    required this.increment,
    required this.decrement,
  }) : super(key: key);

  final String title;
  final String value;
  final String unit;
  final Color color;
  final VoidCallback increment;
  final VoidCallback decrement;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Card(
        color: color,
        elevation: 20,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(title, style: Theme.of(context).textTheme.headline6!),
            ),
          ),
          Expanded(
              flex: 2,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: decrement,
                    child: const Icon(Icons.remove_circle_outline_outlined),
                  ),
                  Row(
                    children: [
                      Text(
                        value,
                        style: Theme.of(context).textTheme.headline5,
                      ),
                      Text(unit)
                    ],
                  ),
                  GestureDetector(
                    onTap: increment,
                    child: const Icon(Icons.add_circle_outline_outlined),
                  ),
                ],
              ))
        ]),
      ),
    );
  }
}
