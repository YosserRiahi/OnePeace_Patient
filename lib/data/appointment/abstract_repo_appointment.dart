// ignore_for_file: unused_local_variable

import 'package:application_patient/core/constant/dio_auth.dart';
import 'package:application_patient/data/appointment/models/appoint_model.dart';
import 'package:application_patient/data/appointment/models/delete_appoint_model.dart';
import 'package:application_patient/data/appointment/models/error_const.dart';
import 'package:application_patient/data/appointment/models/response_appoint_model_one.dart';
import 'package:application_patient/data/auth_data_resource/login_resource/models/user_model.dart';
import 'package:application_patient/data/auth_data_resource/sign_up_resource/model/error_response.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

abstract class IrepoiApp {
  Future<Either<ErrorResponse, AppointmentOne>> insertapp(
      AppointmentModel model);

  Future<Either<ErrorResponse, List<Appointments>>> fetchall();
  Future<Either<ErrorResponse, DeleteAppResponse>> deleteappoint(int id);
}

class IreposiAppImpl extends IrepoiApp {
  final _dio = CustomDioAuth();
  @override
  Future<Either<ErrorResponse, DeleteAppResponse>> deleteappoint(int id) async {
    try {
      final response = await _dio.delete("appointment/$id");
      if (response.statusCode == 200) {
        return Right(DeleteAppResponse.fromMap(response.data));
      }
      return Left(ErrorResponse.fromMap(response.data));
    } on DioError catch (e) {
      if (e.response != null) {
        // ignore: avoid_print
        print(e.response!.data);
        return Left(ErrorResponse.fromMap(e.response!.data));
      } else {
        // ignore: avoid_print
        print(e.response!.data);
        return Left(ErrorResponse.fromMap(e.response!.data));
      }
    }
  }

  @override
  Future<Either<ErrorResponse, List<Appointments>>> fetchall() async {
    try {
      final response = await _dio.getauth("appointments");
      if (response.statusCode == 200) {
        List<Appointments> appoint = [];
        List<dynamic> back = response.data;
        back.map((e) => appoint.add(Appointments.fromJson(e))).toList();

        return Right(appoint);
      }
      return Left(ErrorResponse.fromMap(response.data));
    } on DioError catch (e) {
      if (e.response != null) {
        // ignore: avoid_print
        print(e.response!.data);
        return Left(ErrorResponse.fromMap(e.response!.data));
      } else {
        // ignore: avoid_print
        print(e.response!.data);
        return Left(ErrorResponse.fromMap(e.response!.data));
      }
    }
  }

  @override
  Future<Either<ErrorResponse, AppointmentOne>> insertapp(
      AppointmentModel model) async {
    try {
      final response = await _dio.postauth("appointments", data: model.toMap());
      if (response.statusCode == 200) {
        return Right(AppointmentOne.fromMap(response.data));
      }
      return Left(ErrorResponse.fromMap(response.data));
    } on DioError catch (e) {
      if (e.response != null && e.response!.data["message"] == eALready_exist) {
        // ignore: avoid_print
        print(e.response!.data);
        return Left(ErrorResponse("your already have an appointment"));
      } else {
        // ignore: avoid_print
        print(e.response!.data);
        return Left(ErrorResponse.fromMap(e.response!.data));
      }
    }
  }
}
