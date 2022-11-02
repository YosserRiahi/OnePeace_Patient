import 'dart:async';

import 'package:application_patient/data/local_db/abstract_repository.dart';
import 'package:application_patient/data/local_db/models/config_model.dart';
import 'package:application_patient/data/local_db/remote_config_impl.dart';
import 'package:application_patient/service/notification_app.dart';

import 'package:get/get.dart';

enum TypeUser { male, femele }

class NotifController extends GetxController {
  IrepositoryConfig config = ImplementConfig();
//------- create notif ---------
  @override
  void onInit() {
    super.onInit();
    NotifcationApp.requestpermission();
    verifieallow().then((value) {
      update();
    });
  }

//---------------- variable conffig Table ----------------//
  int age = 25;
  int height = 173;
  int wight = 60;
  TypeUser sex = TypeUser.femele;
  bool send = false;
  // ----------------- update value -------------- //

  // slide for age :
  void updateage(double? value) {
    age = value!.toInt();
    update();
  }

  //------------- height ------------------------// :
  void incrementheight() {
    height++;
    update();
  }

  void decrementheight() {
    if (height > 0) {
      height--;
    } else {
      height = 0;
    }
    update();
  }

  //------------- wight ------------------------// :
  void incrementwight() {
    wight++;
    update();
  }

  void decrementwight() {
    if (wight > 0) {
      wight--;
    } else {
      wight = 0;
    }
    update();
  }
  // ------------------------ type user ----------//

  void updatetype(TypeUser? user) {
    sex = user!;
    update();
  }

  //-------- create unique Id ----------//
  int creadeId() {
    return DateTime.now().millisecondsSinceEpoch.remainder(10000);
  }

  Future<bool> createnotification(String title, String body) {
    return NotifcationApp.createNotification(creadeId(), title, body);
  }

  Future<bool> verifieallow() {
    return NotifcationApp.checkpermession();
  }

  Future<bool> createnotificationSchedule(int hour, int id) {
    return NotifcationApp.createscheduleNotification(
      id: id,
      title: "Alarme of Drink",
      body: "its time to get hydrated, have some water",
      hour: hour,
    );
  }

  //---------------------- configuration for remeinder notification --------- //

  void addalarme() async {
    const List<int> duration = [8, 10, 11, 12, 14, 16, 18, 19, 20];
    duration.map((hour) {
      // ignore: avoid_print

      createnotificationSchedule(hour, hour);
    }).toList();
    update();
  }

  // --------------- add config to database ------------//
  Future<int> addconfiguration(
      int age, int weight, int height, TypeUser sex) async {
    send = true;
    addalarme();
    double objective = calculObjectif(weight);
    ConfigModel model = ConfigModel(
        objective: objective,
        height: height.toDouble(),
        weight: weight.toDouble(),
        sex: sex.name,
        age: age);
    final int value = await config.insertconfig(model);
    send = false;
    update();
    return value;
  }

//----------- calcul objective for drinking water ----------- //
  double calculObjectif(int wigth) {
    return ((wigth - 20) * 15 + 1500);
  }

  String convertenum(TypeUser sex) {
    return TypeUser.values
        .where((element) => element.name == sex.name)
        .toString();
  }
}
