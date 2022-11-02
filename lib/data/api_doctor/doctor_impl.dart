import 'package:application_patient/core/constant/dio_auth.dart';
import 'package:application_patient/data/api_doctor/models/response_doctor.dart';
import 'package:dio/dio.dart';

abstract class Irepositorydoctor {
  Future<List<Doctor>> fetchdoctorfromapi();
}

class IreposidoctorImpl extends Irepositorydoctor {
  final _dio = CustomDioAuth();
  @override
  Future<List<Doctor>> fetchdoctorfromapi() async {
    List<Doctor> doctors = [];
    try {
      final response = await _dio.getauth("doctors");
      if (response.statusCode == 200) {
        List<dynamic> result = response.data;
        result.map((e) => doctors.add(Doctor.fromJson(e))).toList();
        return doctors;
      }
      return doctors;
    } on DioError catch (e) {
      if (e.response != null) {
        // ignore: avoid_print
        print(e.response!.data);
      } else {
        // ignore: avoid_print
        print(e.response!.data);
      }
      return doctors;
    }
  }
}
