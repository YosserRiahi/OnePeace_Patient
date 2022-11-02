import 'package:application_patient/data/api_doctor/doctor_impl.dart';
import 'package:application_patient/data/api_doctor/models/response_doctor.dart';
import 'package:get/get.dart';

class DoctorController extends GetxController {
  Irepositorydoctor repos = IreposidoctorImpl();

  @override
  onInit() {
    super.onInit();

    fetchallDoctor();
  }

  List<Doctor> doctors = [];
  bool loading = false;

  fetchallDoctor() async {
    loading = true;
    try {
      List<Doctor> response = await repos.fetchdoctorfromapi();

      update();
      return response.map((e) => doctors.add(e)).toList();
    } catch (e) {
      update();
      return [];
    }
  }
}
