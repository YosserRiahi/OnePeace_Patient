// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:application_patient/controller/water_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class DetailsPage extends StatefulWidget {
  const DetailsPage({
    Key? key,
  }) : super(key: key);

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  String? text;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple.shade50,
        leading: InkWell(
            borderRadius: BorderRadius.circular(30),
            splashColor: Colors.transparent,
            onTap: () {
              Get.back();
            },
            child: const Icon(
              Icons.arrow_back_ios,
              color: Colors.white,
            )),
        actions: [
          GetBuilder<WaterController>(builder: (controller) {
            return GestureDetector(
              onTap: () {
                showDialog(
                    context: context,
                    barrierDismissible: true,
                    barrierColor: Colors.black26,
                    builder: (context) {
                      return AlertDialog(
                        backgroundColor: Colors.white,
                        actions: [
                          CupertinoButton(
                            onPressed: () {
                              controller.adddose(
                                  double.parse(controller.writedose.text));
                              controller.writedose.clear();
                              Get.back();
                            },
                            child: const Text("Confirm"),
                          ),
                          CupertinoButton(
                            onPressed: () {
                              Get.back();
                            },
                            child: const Text("Skip"),
                          ),
                        ],
                        title: const Text("Add Your dosage"),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SizedBox(
                              height: Get.height * 0.02,
                            ),
                            SizedBox(
                              height: 50,
                              child: TextField(
                                controller: controller.writedose,
                                keyboardType: TextInputType.number,
                                onSubmitted: controller.onchange,
                                decoration: const InputDecoration(
                                    hintText: "add dose ....."),
                              ),
                            ),
                          ],
                        ),
                      );
                    });
              },
              child: Container(
                padding: const EdgeInsets.all(5),
                margin: const EdgeInsets.only(right: 15),
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Colors.grey.shade50),
                child: SvgPicture.asset(
                  "assets/icons/Plus Icon.svg",
                  color: Colors.blueAccent,
                  width: 15,
                  height: 15,
                ),
              ),
            );
          }),
        ],
        title: Text(
          "Current hydration",
          style: Theme.of(context)
              .textTheme
              .headline6!
              .copyWith(color: Colors.deepPurple),
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      body: GetBuilder<WaterController>(builder: (controller) {
        return SafeArea(
            bottom: false,
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(
                    width: double.infinity,
                    height: Get.height * 0.4,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          width: Get.width * 0.55,
                          height: Get.width * 0.55,
                          child: TweenAnimationBuilder<double>(
                              duration: const Duration(milliseconds: 1000),
                              tween: Tween<double>(
                                  begin: 0,
                                  end: (controller.pourcentage / 100)),
                              builder: (context, value, child) {
                                return Card(
                                  elevation: 20,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          Get.width * 0.29)),
                                  child: CircularProgressIndicator(
                                    value: value,
                                    strokeWidth: 10,
                                    color: Colors.deepPurple.shade100,
                                    backgroundColor: Colors.grey.shade200,
                                  ),
                                );
                              }),
                        ),
                        Positioned(
                          top: Get.height * 0.16,
                          child: Column(
                            children: [
                              Text(
                                "${controller.pourcentage} %",
                                style: Theme.of(context).textTheme.headline5,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "quantity drink ${controller.dose} mL",
                                style: Theme.of(context).textTheme.subtitle1,
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              Text(
                                "Rest ${(controller.model!.objective - controller.dose).abs()} Ml",
                                style: Theme.of(context).textTheme.bodyText1,
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  GetBuilder<WaterController>(builder: (controller) {
                    return GridView(
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      padding: const EdgeInsets.all(15),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 10,
                        crossAxisSpacing: 10,
                        childAspectRatio: 1.1,
                      ),
                      children: [
                        CardWidget(
                          color: Colors.grey.shade100,
                          dosage: "250 mL",
                          press: () {
                            controller.adddose(250.0);
                          },
                          animation: "assets/water_assets/8233-water.json",
                        ),
                        CardWidget(
                          color: Colors.grey.shade100,
                          dosage: "500 mL",
                          press: () {
                            controller.adddose(500.0);
                          },
                          animation:
                              "assets/water_assets/80565-water-bottle.json",
                        ),
                        CardWidget(
                          color: Colors.grey.shade100,
                          dosage: "750 mL",
                          press: () {
                            controller.adddose(750.0);
                          },
                          animation:
                              "assets/water_assets/88631-natural-drink.json",
                        ),
                        CardWidget(
                          color: Colors.grey.shade100,
                          dosage: "1000 mL",
                          press: () {
                            controller.adddose(1000.0);
                          },
                          animation:
                              "assets/water_assets/106576-water-drop.json",
                        ),
                      ],
                    );
                  }),
                ],
              ),
            ));
      }),
    );
  }
}

class CardWidget extends StatelessWidget {
  const CardWidget({
    Key? key,
    required this.dosage,
    required this.press,
    required this.color,
    required this.animation,
  }) : super(key: key);
  final String dosage;
  final VoidCallback press;
  final Color color;
  final String animation;

  @override
  Widget build(BuildContext context) {
    return Card(
      color: color,
      elevation: 5,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: InkWell(
        onTap: press,
        borderRadius: BorderRadius.circular(20), //
        child: Column(
          children: [
            Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Lottie.asset(animation),
                )),
            Expanded(
                child: Center(
                    child: Text(
              dosage,
              style: Theme.of(context).textTheme.headline6,
            )))
          ],
        ),
      ),
    );
  }
}

//base de donne local
