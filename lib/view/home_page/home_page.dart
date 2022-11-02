import 'package:application_patient/controller/home_controller.dart';
import 'package:application_patient/core/constant/route_name.dart';
import 'package:application_patient/view/home_page/drawer/drawe_widget.dart';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeController controller = Get.put(HomeController());
  final GlobalKey<ScaffoldState> _globalKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(builder: (controller) {
      return Scaffold(
        key: _globalKey,
        drawer: DrawerWidget(),
        body: CustomScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          slivers: [
            SliverAppBar(
              expandedHeight: Get.height * 0.3,
              elevation: 0.0,
              pinned: true,
              floating: true,
              backgroundColor: Colors.white,
              centerTitle: false,
              flexibleSpace: FlexibleSpaceBar(
                title: Text(
                  "Meditation",
                  style: Theme.of(context).textTheme.headline5,
                ),
                background: Stack(
                  fit: StackFit.expand,
                  children: [
                    Positioned(
                      right: 0,
                      top: 0,
                      bottom: 0,
                      child: Image.asset(
                        "assets/icons/undraw_pilates_gpdb.png",
                        width: Get.width * 0.6,
                        height: Get.height * 0.3,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                    Positioned(
                        right: 0.0,
                        top: -20.0,
                        child: SvgPicture.asset(
                          "assets/icons/meditationHome.svg",
                          width: Get.width * 0.4,
                          height: Get.height * 0.3,
                          fit: BoxFit.fitWidth,
                        )),
                  ],
                ),
              ),
              leading: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {
                    controller.fetchapp();
                    controller.fetchDrink();
                    controller.pratcise();
                    _globalKey.currentState!.openDrawer();
                  },
                  child: SvgPicture.asset(
                    "assets/icons/menu.svg",
                    height: 5,
                    width: 5,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                color: Colors.white,
                child: GridView(
                  shrinkWrap: true,
                  physics: const ClampingScrollPhysics(),
                  padding: const EdgeInsets.all(20),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    childAspectRatio: 1.2,
                  ),
                  children: [
                    CardWidget(
                      title: "learn Meditation",
                      press: () {
                        Get.toNamed(RoutesName.learnmeditation);
                      },
                      asset: 'assets/animations/meditation_group.json',
                    ),
                    CardWidget(
                      title: "Meditation music",
                      press: () {
                        Get.toNamed(RoutesName.welcomMusic);
                      },
                      asset: 'assets/animations/sound_effect.json',
                    ),
                    GetBuilder<HomeController>(builder: (controller) {
                      return CardWidget(
                        title: "Activity",
                        press: () {
                          controller.addconfig();
                          controller.getPage();
                          controller.fetchDrink();
                          //Get.toNamed(RoutesName.waterConfig);
                        },
                        asset:
                            'assets/animations/89089-work-and-life-balance.json',
                      );
                    }),
                    CardWidget(
                      title: "Care For yourself",
                      press: () {
                        Get.toNamed(RoutesName.doctors);
                      },
                      asset: 'assets/animations/meditation_animation.json',
                    ),
                    CardWidget(
                      title: "Practice",
                      press: () {
                        Get.toNamed(RoutesName.practise);
                        controller.pratcise();
                      },
                      asset: 'assets/animations/breath_animation.json',
                    ),
                    Material(
                      elevation: 10,
                      borderRadius: BorderRadius.circular(20),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(20),
                        onTap: () {},
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: Text(
                                  "Add More ",
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context).textTheme.bodyText1,
                                ),
                              ),
                            ),
                            Expanded(
                              flex: 2,
                              child: Padding(
                                padding: const EdgeInsets.all(10),
                                child: Lottie.asset(
                                    "assets/animations/sleeping.json"),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverToBoxAdapter(
              child: Container(
                height: 300,
                color: Colors.transparent,
              ),
            ),
          ],
        ),
      );
    });
  }
}

class CardWidget extends StatelessWidget {
  const CardWidget({
    Key? key,
    required this.press,
    required this.title,
    required this.asset,
  }) : super(key: key);
  final VoidCallback press;
  final String title;
  final String asset;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 20,
      borderRadius: BorderRadius.circular(20),
      child: InkWell(
        onTap: press,
        splashColor: Colors.black54,
        borderRadius: BorderRadius.circular(20),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
              Expanded(
                  child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Lottie.asset(asset),
              ))
            ],
          ),
        ),
      ),
    );
  }
}
