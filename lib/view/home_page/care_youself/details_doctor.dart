// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:application_patient/controller/appointment_controller.dart';
import 'package:application_patient/controller/home_controller.dart';
import 'package:application_patient/core/constant/palette_colors.dart';
import 'package:application_patient/data/api_doctor/models/response_doctor.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

import '../../../core/constant/client_dio.dart';

class DetailsDoctorView extends StatelessWidget {
  AppointmentController controller = Get.put(AppointmentController());
  DetailsDoctorView({
    Key? key,
    required this.doctor,
  }) : super(key: key);
  final Doctor doctor;

  void fetchDateAppointment(BuildContext context) async {
    DateTime? fetch = await showDatePicker(
        context: context,
        builder: (context, child) {
          return Theme(
              data: ThemeData().copyWith(
                  colorScheme: ColorScheme.light(
                primary: Colors.deepPurple.shade200,
              )),
              child: child ?? const Text(""));
        },
        initialDate: DateTime.now(),
        firstDate: DateTime.now(),
        lastDate: DateTime(2024));
    if (fetch != null) {
      controller.updateTime(fetch);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: baseColor,
      floatingActionButton: FloatingActionButton.extended(
          elevation: 15,
          backgroundColor: Colors.deepPurple.shade300,
          onPressed: () {
            showDialog(
                context: context,
                builder: (context) {
                  return GetBuilder<AppointmentController>(
                      builder: (controller) {
                    return AlertDialog(
                      alignment: Alignment.topCenter,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      backgroundColor: baseColor,
                      actions: [
                        MaterialButton(
                          color: Colors.grey.shade300,
                          onPressed: () {
                            Get.back();
                          },
                          child: Text(
                            "cancel",
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1!
                                .copyWith(color: Colors.white),
                          ),
                        ),
                        MaterialButton(
                          color: Colors.deepPurple.shade200,
                          onPressed: () {
                            controller.addAppointment(doctor.id!);
                            Get.find<HomeController>().fetchapp();
                            Get.back();
                          },
                          child: Text(
                            "confirm",
                            style: Theme.of(context)
                                .textTheme
                                .subtitle1!
                                .copyWith(color: Colors.white),
                          ),
                        )
                      ],
                      title: const Text("Request Appointment"),
                      content: Container(
                        width: 400,
                        height: 400,
                        child: SingleChildScrollView(
                          child: Column(
                              mainAxisSize: MainAxisSize.min,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      border:
                                          Border.all(color: Colors.black26)),
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "choose a date : ",
                                            style: Theme.of(context)
                                                .textTheme
                                                .subtitle2,
                                          ),
                                          GestureDetector(
                                            onTap: () {
                                              fetchDateAppointment(context);
                                            },
                                            child: Icon(Icons.calendar_month,
                                                color:
                                                    Colors.deepPurple.shade200),
                                          )
                                        ],
                                      ),
                                      Text(controller.date ?? ""),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Padding(
                                            padding:
                                                const EdgeInsets.only(top: 8.0),
                                            child: Text(
                                              "Schudle hour :",
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .headline6,
                                            ),
                                          ),
                                        ],
                                      ),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        margin: const EdgeInsets.only(top: 10),
                                        width: 400,
                                        height: 70,
                                        child: ListView.builder(
                                            itemCount: controller.hour.length,
                                            scrollDirection: Axis.horizontal,
                                            itemBuilder: ((context, index) {
                                              return GestureDetector(
                                                onTap: () {
                                                  controller.updateindex(index,
                                                      controller.hour[index]);
                                                },
                                                child: Card(
                                                  color: controller
                                                              .selectedindex ==
                                                          index
                                                      ? Colors
                                                          .deepPurple.shade200
                                                      : Colors.white,
                                                  child: Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            10),
                                                    child: Center(
                                                        child: Text(
                                                      controller.hour[index],
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .headline6!
                                                          .copyWith(
                                                              color: controller
                                                                          .selectedindex ==
                                                                      index
                                                                  ? Colors.white
                                                                  : Colors.grey
                                                                      .shade600),
                                                    )),
                                                  ),
                                                ),
                                              );
                                            })),
                                      ),
                                    ],
                                  ),
                                ),
                                Container(
                                  height: 70,
                                  width: 400,
                                  margin: const EdgeInsets.only(top: 20),
                                  child: TextField(
                                    controller: controller.description,
                                    autocorrect: false,
                                    keyboardType: TextInputType.name,
                                    maxLines: 1,
                                    onSubmitted: controller.onsubmit,
                                    decoration: InputDecoration(
                                        hintText: "description.....",
                                        floatingLabelBehavior:
                                            FloatingLabelBehavior.always,
                                        enabledBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        focusedBorder: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10)),
                                        border: OutlineInputBorder(
                                            borderRadius:
                                                BorderRadius.circular(10))),
                                  ),
                                ),
                              ]),
                        ),
                      ),
                    );
                  });
                });
          },
          label: Row(
            children: const [
              Icon(Icons.calendar_month_outlined),
              SizedBox(
                width: 5,
              ),
              Text("Get Appointment"),
            ],
          )),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: baseColor,
      ),
      body: SafeArea(
        // ignore: sized_box_for_whitespace
        bottom: false,
        child: Container(
          width: double.infinity,
          height: Get.height,
          color: baseColor,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: Get.height * 0.45,
                  color: baseColor,
                  child: Stack(
                    children: [
                      Positioned(
                          bottom: 0,
                          right: 0,
                          left: 0,
                          top: Get.height * 0.25,
                          // height: Get.height * 0.3,
                          child: Container(
                            color: Colors.white,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                SizedBox(
                                  height: 10,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      ...List.generate(5, (index) {
                                        if (doctor.rating! > index) {
                                          return const Icon(
                                            Icons.star,
                                            color: Colors.amber,
                                          );
                                        } else {
                                          return Icon(
                                            Icons.star,
                                            color: Colors.grey.shade200,
                                          );
                                        }
                                      }),
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Dr. ",
                                      style:
                                          Theme.of(context).textTheme.headline6,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      doctor.firstName!.capitalizeFirst!,
                                      style:
                                          Theme.of(context).textTheme.headline6,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      doctor.lastName!.capitalizeFirst!,
                                      style:
                                          Theme.of(context).textTheme.headline6,
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        doctor.about!.capitalizeFirst!,
                                        overflow: TextOverflow.ellipsis,
                                        style: Theme.of(context)
                                            .textTheme
                                            .subtitle1,
                                      ),
                                    ],
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "Price :",
                                      style:
                                          Theme.of(context).textTheme.subtitle1,
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      doctor.price.toString(),
                                      style:
                                          Theme.of(context).textTheme.headline6,
                                    ),
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "Dinars",
                                      style:
                                          Theme.of(context).textTheme.headline6,
                                    )
                                  ],
                                ),
                                const Padding(
                                  padding: EdgeInsets.symmetric(horizontal: 40),
                                  child: Divider(
                                    thickness: 1,
                                  ),
                                ),
                              ],
                            ),
                          )),
                      Align(
                        alignment: Alignment.topCenter,
                        child: Hero(
                          tag: "${doctor.id}",
                          child: Card(
                            elevation: 10,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30)),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: CachedNetworkImage(
                                  fit: BoxFit.cover,
                                  width: Get.width * 0.6,
                                  height: Get.width * 0.6,
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
                    ],
                  ),
                ),
                Container(
                  width: double.infinity,
                  color: Colors.white,
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Office :",
                          style: Theme.of(context)
                              .textTheme
                              .headline5!
                              .copyWith(
                                  color: Colors.black,
                                  fontWeight: FontWeight.w500),
                        ),
                        Container(
                          width: double.infinity,
                          height: Get.height * 0.19,
                          padding: const EdgeInsets.only(top: 10),
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: doctor.cabinets!.length,
                            itemBuilder: ((context, index) {
                              Cabinets office = doctor.cabinets![index];
                              return SizedBox(
                                width: Get.width,
                                child: Card(
                                  elevation: 0.0,
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: [
                                              const Icon(
                                                Icons.add_home,
                                                color: Colors.grey,
                                                size: 30,
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                office.cabinetAddress!,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .subtitle1,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            children: [
                                              SvgPicture.asset(
                                                "assets/icons/Call.svg",
                                                color: Colors.grey,
                                              ),
                                              const SizedBox(
                                                width: 10,
                                              ),
                                              Text(
                                                office.cabinetContact!,
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .subtitle1,
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                children: [
                                                  const Icon(
                                                    Icons.lock_clock_outlined,
                                                    size: 30,
                                                  ),
                                                  const SizedBox(
                                                    width: 10,
                                                  ),
                                                  Text(
                                                    office.timeOpenning!,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .subtitle1,
                                                  ),
                                                  const Text(" - "),
                                                  Text(
                                                    office.timeClosed!,
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .subtitle1,
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            }),
                          ),
                        ),
                        SizedBox(
                          width: double.infinity,
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Experience :",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headline5!
                                      .copyWith(
                                          color: Colors.black,
                                          fontWeight: FontWeight.w500),
                                ),
                                Container(
                                  width: double.infinity,
                                  height: Get.height * 0.5,
                                  padding: const EdgeInsets.only(top: 10),
                                  child: ListView.builder(
                                      itemCount: doctor.experiences!.length,
                                      itemBuilder: ((context, value) {
                                        Experiences experience =
                                            doctor.experiences![value];
                                        return SizedBox(
                                          width: Get.width,
                                          child: Card(
                                            elevation: 5.0,
                                            child: SingleChildScrollView(
                                              scrollDirection: Axis.horizontal,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Text(
                                                        "Experience ${value + 1} :"),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                          "Job Occuped :",
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .subtitle2,
                                                        ),
                                                        Text(
                                                          experience
                                                              .jobOccuped!,
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .subtitle1,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                          "Description: ",
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .subtitle2,
                                                        ),
                                                        Text(
                                                          experience
                                                              .description!,
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .subtitle1,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Row(
                                                      children: [
                                                        Text(
                                                          "Establishement ",
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .subtitle2,
                                                        ),
                                                        Text(
                                                          experience.society!,
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .subtitle1,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                        );
                                      })),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
