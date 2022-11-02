import 'package:application_patient/controller/home_controller.dart';
import 'package:application_patient/core/constant/client_dio.dart';
import 'package:application_patient/core/constant/palette_colors.dart';
import 'package:application_patient/view/home_page/drawer/profil_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable
class DrawerWidget extends StatelessWidget {
  DrawerWidget({super.key});
  HomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          DrawerHeader(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Spacer(),
              controller.user == null
                  ? Container()
                  : (controller.user!.urlimage == null
                      ? CircleAvatar(
                          radius: 30,
                          foregroundColor: baseColor,
                          backgroundColor: Colors.black26,
                          child: Center(
                              child: Text(
                                  controller.user!.firstName![0].capitalize!)),
                        )
                      : Container(
                          height: 70,
                          width: 70,
                          decoration:
                              const BoxDecoration(shape: BoxShape.circle),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: Image.network(
                                baseimapath + controller.user!.urlimage!),
                          ),
                        )),
              const Spacer(),
              Row(
                children: [
                  Text(
                    controller.user!.firstName!,
                    style: Theme.of(context).textTheme.subtitle1,
                  ),
                  const Text(" "),
                  Text(
                    controller.user!.lastName!,
                    style: Theme.of(context).textTheme.subtitle1,
                  )
                ],
              ),
              Text(controller.user!.email!),
              const Spacer(),
            ],
          )),
          const Spacer(),
          GetBuilder<HomeController>(builder: (controller) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ListTile(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                leading: const Icon(Icons.calendar_month_outlined),
                title: const Text("Appointment"),
                trailing: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.grey.shade100),
                  child: Text(
                    controller.lenghtapp.toString(),
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2!
                        .copyWith(color: Colors.deepPurple.shade300),
                  ),
                ),
                onTap: () {
                  controller.fetchUsermodel();
                },
              ),
            );
          }),
          GetBuilder<HomeController>(builder: (controller) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ListTile(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                leading: const Icon(Icons.local_drink),
                title: const Text("Activity"),
                trailing: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.grey.shade100),
                  child: Text(
                    controller.activity.length.toString(),
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2!
                        .copyWith(color: Colors.deepPurple.shade300),
                  ),
                ),
                onTap: () {},
              ),
            );
          }),
          GetBuilder<HomeController>(builder: (controller) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: ListTile(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                leading: const Icon(Icons.accessibility),
                title: const Text("Practice"),
                trailing: Container(
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle, color: Colors.grey.shade100),
                  child: Text(
                    controller.meditation.length.toString(),
                    style: Theme.of(context)
                        .textTheme
                        .subtitle2!
                        .copyWith(color: Colors.deepPurple.shade300),
                  ),
                ),
                onTap: () {},
              ),
            );
          }),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ListTile(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              leading: SvgPicture.asset(
                "assets/icons/Settings.svg",
                color: Colors.grey,
              ),
              title: const Text("Setting"),
              onTap: () {},
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: ListTile(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              leading: SvgPicture.asset(
                "assets/icons/User.svg",
                color: Colors.grey,
              ),
              title: const Text("Profil"),
              onTap: () {
                controller.fetchUsermodel();
                Get.to(() => ProfilPage(
                      user: controller.user!,
                      dose: controller.activity,
                    ));
              },
            ),
          ),
          const Spacer(
            flex: 4,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              leading: SvgPicture.asset(
                "assets/icons/Log out.svg",
                color: Colors.grey,
              ),
              title: const Text("Log out"),
              onTap: () {
                controller.signout();
              },
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
