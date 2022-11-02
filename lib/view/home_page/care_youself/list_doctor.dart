// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:application_patient/controller/doctor_controller.dart';
import 'package:application_patient/core/constant/client_dio.dart';
import 'package:application_patient/core/constant/palette_colors.dart';
import 'package:application_patient/view/home_page/care_youself/details_doctor.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

import '../../../data/api_doctor/models/response_doctor.dart';

// ignore: must_be_immutable
class ListDoctor extends StatelessWidget {
  ListDoctor({
    Key? key,
  }) : super(key: key);

  DoctorController controller = Get.put(DoctorController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: baseColor,
      appBar: AppBar(
        backgroundColor: baseColor,
        elevation: 0,
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
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 10.0),
            child: LottieBuilder.asset(
              "assets/logo/calender.json",
              width: Get.width * 0.2,
              height: Get.width * 0.2,
            ),
          ),
        ],
      ),
      body: GetBuilder<DoctorController>(builder: (controller) {
        return Container(
          color: baseColor,
          width: double.infinity,
          height: Get.height,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Header(),
                GridView.builder(
                    shrinkWrap: true,
                    itemCount: controller.doctors.length,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisSpacing: 12,
                            childAspectRatio: 0.9,
                            mainAxisSpacing: 12,
                            crossAxisCount: 2),
                    itemBuilder: (context, index) {
                      Doctor doctor = controller.doctors[index];
                      return GestureDetector(
                        onTap: () {
                          Get.to(() => DetailsDoctorView(doctor: doctor),
                              transition: Transition.fade,
                              duration: const Duration(milliseconds: 700));
                        },
                        child: Card(
                          elevation: 5,
                          shadowColor: baseColor,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15)),
                          child: Column(
                            children: [
                              Expanded(
                                flex: 4,
                                child: Container(
                                  padding: const EdgeInsets.all(2),
                                  decoration: BoxDecoration(
                                      color: baseColor,
                                      borderRadius: BorderRadius.circular(30),
                                      border: Border.all(
                                          width: 2, color: Colors.black12)),
                                  child: Hero(
                                    tag: "${doctor.id}",
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(30),
                                      child: CachedNetworkImage(
                                          fit: BoxFit.cover,
                                          width: Get.width * 0.3,
                                          filterQuality: FilterQuality.high,
                                          placeholder: (context, url) {
                                            return Image.asset(
                                                "assets/animations/spinner.gif");
                                          },
                                          imageUrl:
                                              // ignore: unnecessary_brace_in_string_interps
                                              "${baseimapath}${doctor.urlimage!}"),
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Container(
                                  color: Colors.white,
                                  padding:
                                      const EdgeInsets.only(left: 10, top: 10),
                                  child: Column(
                                    children: [
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.end,
                                        children: [
                                          Text(
                                            "Dr.",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyText1,
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Text(doctor.firstName!.capitalize!,
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .subtitle1),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          Expanded(
                                            child: Text(
                                                doctor.lastName!.capitalize!,
                                                overflow: TextOverflow.ellipsis,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .subtitle1),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                              Expanded(
                                  child: Container(
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(15),
                                        bottomRight: Radius.circular(15))),
                                padding: const EdgeInsets.only(left: 10),
                                child: Row(
                                  children: [
                                    Text(
                                      "Reviews: ",
                                      style:
                                          Theme.of(context).textTheme.bodyText1,
                                    ),
                                    SvgPicture.asset(
                                        "assets/icons/Star Icon.svg"),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      doctor.rating!.toDouble().toString(),
                                    ),
                                  ],
                                ),
                              ))
                            ],
                          ),
                        ),
                      );
                    }),
              ],
            ),
          ),
        );
      }),
    );
  }
}

class Header extends StatelessWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height * 0.27,
      width: double.infinity,
      color: baseColor,
      padding: const EdgeInsets.all(15),
      child: Stack(
        children: [
          Positioned(
            right: -20,
            bottom: -20,
            width: Get.width * 0.4,
            height: Get.height * 0.3,
            child: Opacity(
              opacity: 0.3,
              child: SvgPicture.asset(
                "assets/logo/medicine.svg",
                fit: BoxFit.contain,
              ),
            ),
          ),
          Positioned(
            top: Get.height * 0.03,
            child: Text(
              "Welcome, ",
              style: Theme.of(context)
                  .textTheme
                  .headline6!
                  .copyWith(color: const Color.fromARGB(255, 86, 74, 123)),
            ),
          ),
          Positioned(
            top: Get.height * 0.05,
            left: 0,
            child: Padding(
              padding: const EdgeInsets.only(top: 8.0),
              child: Text(
                "What are you seeking?",
                style: Theme.of(context)
                    .textTheme
                    .headline5!
                    .copyWith(color: const Color.fromARGB(255, 80, 46, 173)),
              ),
            ),
          ),
          Positioned(
            top: Get.height * 0.12,
            child: Text(
              '''
Protect your family and environment 
through predicting, changing and
controlling your behavior
''',
              style: Theme.of(context)
                  .textTheme
                  .bodyText2!
                  .copyWith(letterSpacing: 0.8, color: Colors.black45),
            ),
          ),
        ],
      ),
    );
  }
}
