// ignore_for_file: avoid_print

import 'package:application_patient/data/local_db/abstract_repository.dart';
import 'package:application_patient/data/local_db/models/pratice_model.dart';
import 'package:application_patient/data/local_db/remote_practise_impl.dart';

import 'package:get/get.dart';
import 'package:application_patient/service/notification_app.dart';

class PractiseController extends GetxController
    with GetTickerProviderStateMixin {
  //--------- duration to practise meditation ------/

  int _duration = 1;
  int get duration => _duration;
  int selectedindex = 5;

  List<int> periode = [1, 5, 10, 15, 20, 25, 30, 35, 40, 45, 50, 55];
  final IrepositoryPractise _repository = ImplPractise();

  void insertpractisetodb(double duration) {
    final Practise practise = Practise(duree: duration, date: DateTime.now());
    _repository.insertpractise(practise).then((value) {});
  }

  static int generateid() {
    return DateTime.now().microsecondsSinceEpoch.remainder(10000);
  }

  updatevalue(int value, int index) {
    _duration = value;
    // ignore: unnecessary_brace_in_string_interps
    print("changement de value ${_duration}");
    selectedindex = index;
    update();
  }

// ----------- animation -------------//

  addschudelPractise(int duration) {
    NotifcationApp.createNotification(
      duration,
      "Congradulation ",
      "your already did a great job practicing meditation",
    );

    print("notification de practise");
  }
}
