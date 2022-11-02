import 'dart:io';

import 'package:application_patient/view/component/profil_form_component.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../controller/complet_controller.dart';
import '../component/custom_Button.dart';
import '../component/form_error.dart';

// ignore: must_be_immutable
class CompletProfil extends StatefulWidget {
  const CompletProfil({super.key});

  @override
  State<CompletProfil> createState() => _CompletProfilState();
}

class _CompletProfilState extends State<CompletProfil> {
  File? imageuploaded;
  CompletController controller = Get.put(CompletController());

  Future pickerImage() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (image == null) return;
      final imagefetch = File(image.path);
      setState(() {
        imageuploaded = imagefetch;
      });
    } on PlatformException catch (e) {
      // ignore: avoid_print
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Complet Your Profil",
            style: Theme.of(context).textTheme.headline6,
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        body: GetBuilder<CompletController>(builder: (controller) {
          return SafeArea(
            bottom: false,
            child: GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: Container(
                width: double.infinity,
                height: Get.height,
                padding: const EdgeInsets.all(10),
                child: SingleChildScrollView(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Text(
                          "Complete your profile in order \nto fully enjoy your \nexperience",
                          style: Theme.of(context).textTheme.headline6,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        height: Get.width * 0.27,
                        width: Get.width * 0.27,
                        padding: const EdgeInsets.only(top: 10),
                        decoration: const BoxDecoration(
                          shape: BoxShape.circle,
                        ),
                        child: Stack(
                          alignment: Alignment.center,
                          fit: StackFit.expand,
                          children: [
                            Positioned(
                              child: imageuploaded != null
                                  ? ClipRRect(
                                      borderRadius: BorderRadius.circular(150),
                                      child: Image.file(
                                        imageuploaded!,
                                        width: Get.width * 0.27,
                                        height: Get.width * 0.27,
                                        fit: BoxFit.cover,
                                      ),
                                    )
                                  : CircleAvatar(
                                      radius: Get.width * 0.27,
                                      backgroundColor: Colors.grey.shade200,
                                    ),
                            ),
                            Align(
                              alignment: Alignment.center,
                              child: GestureDetector(
                                  onTap: () {
                                    pickerImage();
                                  },
                                  child: Container(
                                    padding: EdgeInsets.all(5),
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade200,
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(
                                      Icons.camera_alt_outlined,
                                      color: Colors.deepPurple,
                                    ),
                                  )),
                            )
                          ],
                        ),
                      ),
                      SizedBox(
                        height: Get.height * 0.04,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Form(
                          key: controller.form,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              FormComponent(
                                keyboardType: TextInputType.name,
                                focusNode: controller.first,
                                controller: controller.firstEditingController,
                                onEditingComplete: () {
                                  FocusScope.of(context)
                                      .requestFocus(controller.last);
                                },
                                onchange: controller.onchangeuFirst,
                                onSave: controller.savefisrt,
                                validator: controller.validatorFirst,
                                title: "first name",
                                hinttext: "..........",
                                child: SvgPicture.asset(
                                  "assets/icons/User.svg",
                                  color: Colors.deepPurple.shade200,
                                ),
                              ),
                              SizedBox(
                                height: Get.height * 0.04,
                              ),
                              FormComponent(
                                  keyboardType: TextInputType.name,
                                  focusNode: controller.last,
                                  controller: controller.lastEditingController,
                                  onEditingComplete: () {
                                    FocusScope.of(context)
                                        .requestFocus(controller.telefon);
                                  },
                                  onchange: controller.onchangeuLast,
                                  onSave: controller.saveulast,
                                  validator: controller.validatorLast,
                                  title: "last name",
                                  hinttext: "...........",
                                  child: SvgPicture.asset(
                                    "assets/icons/User Icon.svg",
                                    color: Colors.deepPurple.shade200,
                                  )),
                              SizedBox(
                                height: Get.height * 0.04,
                              ),
                              FormComponent(
                                keyboardType: TextInputType.datetime,
                                focusNode: controller.telefon,
                                controller: controller.telefonEditingController,
                                onEditingComplete: () {
                                  FocusScope.of(context)
                                      .requestFocus(controller.cnam);
                                },
                                onchange: controller.onchangephone,
                                onSave: controller.savephone,
                                validator: controller.validatorphone,
                                title: "Phone Contact",
                                hinttext: "********",
                                child: SvgPicture.asset("assets/icons/Call.svg",
                                    color: Colors.deepPurple.shade200),
                              ),
                              SizedBox(
                                height: Get.height * 0.04,
                              ),
                              FormComponent(
                                  keyboardType: TextInputType.name,
                                  focusNode: controller.cnam,
                                  controller: controller.cnamEditingController,
                                  onEditingComplete: () {
                                    FocusScope.of(context).unfocus();
                                  },
                                  onchange: ((value) {}),
                                  onSave: controller.savecnam,
                                  validator: (value) {},
                                  title: "Cnam code",
                                  hinttext: "************",
                                  child: SvgPicture.asset(
                                    "assets/icons/Flash Icon.svg",
                                    color: Colors.deepPurple.shade200,
                                  )),
                              Padding(
                                padding: const EdgeInsets.only(top: 10.0),
                                child: FormError(
                                  erros: controller.error,
                                ),
                              ),
                              SizedBox(
                                height: Get.height * 0.1,
                              ),
                              controller.loading
                                  ? Image.asset(
                                      "assets/animations/spinner.gif",
                                      width: 70,
                                      height: 70,
                                    )
                                  : CustomButton(
                                      text: "Comfirm",
                                      press: () async {
                                        controller.completProfil();

                                        //
                                      }),
                              SizedBox(
                                height: Get.height * 0.03,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ])),
              ),
            ),
          );
        }));
  }
}
