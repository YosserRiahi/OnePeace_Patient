// ignore_for_file: unnecessary_null_comparison, avoid_function_literals_in_foreach_calls

import 'package:application_patient/core/constant/route_name.dart';
import 'package:application_patient/data/appointment/abstract_repo_appointment.dart';
import 'package:application_patient/data/auth_data_resource/login_resource/models/log_out_response.dart';
import 'package:application_patient/data/auth_data_resource/login_resource/models/user_model.dart';
import 'package:application_patient/data/local_db/abstract_repository.dart';
import 'package:application_patient/data/local_db/models/dose_model.dart';
import 'package:application_patient/data/local_db/models/pratice_model.dart';
import 'package:application_patient/data/local_db/remote_practise_impl.dart';
import 'package:application_patient/service/save_config_water.dart';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';

import '../data/auth_data_resource/login_resource/auth_log_contract.dart';
import '../data/auth_data_resource/sign_up_resource/model/error_response.dart';
import '../data/local_db/remote_Irepository_water.dater.dart';

class HomeController extends GetxController {
  final IrepoSignin repository = IrespoSinImpl();
  final IrepoiApp reposyapp = IreposiAppImpl();
  final IrepositoryWater water = ImplementWater();
  final IrepositoryPractise reposPractise = ImplPractise();
  bool config = false;

  bool loaduser = false;

  int lenghtapp = 0;

  List<Appointments> app = [];

  List<Dose> activity = [];
  List<Practise> meditation = [];

  Usermodel? user;
  @override
  void onInit() {
    super.onInit();
    fetchUsermodel();
    fetchapp();
    pratcise();
    fetchDrink();
    fetch().then((value) {
      config = value;
    });
    update();
  }

// ---------------- practise meditation --------//

  pratcise() async {
    List<Practise> prac = await reposPractise.fetchall();
    meditation.clear();
    prac.forEach((element) {
      meditation.add(element);
      update();
    });

    update();
  }

// ----------------- fetch activity -----------------//

  fetchDrink() async {
    List<Dose> dose = await water.fetchall();
    activity.clear();
    activity.addAll(dose);

    update();
  }

//------------------- user model ----------------//
  void fetchUsermodel() async {
    loaduser = true;
    Either<ErrorResponse, Usermodel> resultfetch = await repository.fetchme();
    resultfetch.fold((err) {
      user = null;

      update();
    }, (model) {
      user = model;

      updateListapp(model.appointments);

      update();
    });
    loaduser = false;
    update();
  }
//------------------- Appointment ---------------//

  void fetchapp() async {
    loaduser = true;
    Either<ErrorResponse, List<Appointments>> result =
        await reposyapp.fetchall();

    result.fold((l) {
      app = [];
      update();
    }, (r) {
      updateListapp(r);
    });
  }

  updateListapp(List<Appointments>? appoint) {
    app = [];
    appoint!.forEach((element) {
      app.add(element);
    });
    lenghtapp = app.length;

    update();
  }

//--------------- log out ------------------//
  void signout() async {
    loaduser = true;
    Either<ErrorResponse, LogOutResponse> resultfetch =
        await repository.logout();
    resultfetch.fold((err) {
      // ignore: avoid_print
      print("user Failed to log out");
      update();
    }, (model) {
      if (!model.session) {
        Get.offAllNamed(RoutesName.login);
      }
      update();
    });
    loaduser = false;
    update();
  }

// -------------- water and add config ----------//

  void addconfig() {
    ConfigWater.add();
  }

  Future<bool> fetch() async {
    bool? value = await ConfigWater.fetch();
    if (value == null) {
      return false;
    }
    return value;
  }

  getPage() {
    if (config) {
      Get.toNamed(RoutesName.fetchwater);
    } else {
      Get.toNamed(RoutesName.waterConfig);
    }
  }
}
