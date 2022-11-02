// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:clay_containers/clay_containers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:application_patient/core/constant/palette_colors.dart';
import 'package:application_patient/data/auth_data_resource/login_resource/models/user_model.dart';

import '../../../core/constant/client_dio.dart';
import '../../../data/local_db/models/dose_model.dart';

class ProfilPage extends StatefulWidget {
  const ProfilPage({
    Key? key,
    required this.user,
    required this.dose,
  }) : super(key: key);

  final Usermodel user;
  final List<Dose> dose;

  @override
  State<ProfilPage> createState() => _ProfilPageState();
}

class _ProfilPageState extends State<ProfilPage> with TickerProviderStateMixin {
  late TabController tabController;
  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    tabController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text(
          "My Profil ",
          style: Theme.of(context).textTheme.headline6!.copyWith(
              fontWeight: FontWeight.w600, color: Colors.deepPurple.shade300),
        ),
        centerTitle: true,
        backgroundColor: baseColor,
      ),
      body: SafeArea(
        bottom: false,
        child: Container(
          height: Get.height,
          width: double.infinity,
          color: baseColor,
          padding: const EdgeInsets.all(15),
          child: SingleChildScrollView(
            child: Column(children: [
              ClayContainer(
                width: Get.width * 0.4,
                height: Get.width * 0.4,
                borderRadius: 100,
                depth: 10,
                color: baseColor,
                curveType: CurveType.none,
                child: ClipRRect(
                    borderRadius: BorderRadius.circular(100),
                    child: widget.user.urlimage == null
                        ? Center(
                            child: Text(
                              widget.user.firstName![0].capitalize ?? "",
                              style: Theme.of(context).textTheme.headline3,
                            ),
                          )
                        : Image.network(baseimapath + widget.user.urlimage!)),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    widget.user.firstName!.capitalizeFirst!,
                    style: Theme.of(context).textTheme.headline5,
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    widget.user.lastName!.capitalizeFirst!,
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text(
                  widget.user.email!,
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Text(
                  widget.user.numberPhone.toString(),
                  style: Theme.of(context).textTheme.subtitle1,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Cnam Code :",
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                    Text(
                      widget.user.cnamCode!,
                      style: Theme.of(context).textTheme.subtitle1,
                    ),
                  ],
                ),
              ),
              Container(
                height: 50,
                margin: const EdgeInsets.only(top: 20),
                width: double.infinity,
                child: TabBar(
                    controller: tabController,
                    indicator: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    labelColor: Colors.deepPurple.shade300,
                    onTap: (value) {},
                    indicatorColor: baseColor,
                    unselectedLabelColor: Colors.black54,
                    tabs: [
                      Tab(
                        text: "Appointment",
                        icon: Container(),
                      ),
                      Tab(
                        text: "Activity",
                        icon: Container(),
                      ),
                    ]),
              ),
              Container(
                width: double.infinity,
                height: 400,
                child: TabBarView(controller: tabController, children: [
                  Container(
                    width: double.infinity,
                    height: 300,
                    child: ListView.builder(
                      itemCount: widget.user.appointments!.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: ((context, index) {
                        Appointments point = widget.user.appointments![index];
                        return Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  width: 1, color: Colors.grey.shade100),
                              color: baseColor),
                          margin: const EdgeInsets.only(bottom: 5),
                          height: 100,
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(children: [
                                Row(
                                  children: [
                                    Text(point.validation!),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(point.dateAppoint!),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(point.hourAppoint!),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(point.description!),
                                  ],
                                ),
                              ]),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: 300,
                    child: ListView.builder(
                      itemCount: widget.dose.length,
                      scrollDirection: Axis.vertical,
                      itemBuilder: ((context, index) {
                        Dose activity = widget.dose[index];
                        return Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              border: Border.all(
                                  width: 1, color: Colors.grey.shade100),
                              color: baseColor),
                          margin: const EdgeInsets.only(bottom: 5),
                          height: 80,
                          child: Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Column(children: [
                                Row(
                                  children: [
                                    Text("Date : "),
                                    Text(activity.time),
                                  ],
                                ),
                                Padding(
                                  padding:
                                      const EdgeInsets.symmetric(vertical: 8.0),
                                  child: Row(
                                    children: [
                                      Text("Quantity drank : "),
                                      Text(activity.dose.toString()),
                                    ],
                                  ),
                                ),
                              ]),
                            ),
                          ),
                        );
                      }),
                    ),
                  ),
                ]),
              )
            ]),
          ),
        ),
      ),
    );
  }
}
