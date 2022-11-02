import 'dart:io';

import 'package:application_patient/core/constant/client_dio.dart';
import 'package:application_patient/data/auth_data_resource/sign_up_resource/model/error_response.dart';
import 'package:application_patient/data/auth_data_resource/sign_up_resource/model/sign_up_response.dart';
import 'package:application_patient/data/auth_data_resource/sign_up_resource/model/sing_up_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

abstract class IrepoSignup {
  Future<Either<ErrorResponse, RegisterResponse>> signup(RegisteModel model);
}

class IsingUpimpl extends IrepoSignup {
  final _dio = CustomDio();
  @override
  Future<Either<ErrorResponse, RegisterResponse>> signup(
      RegisteModel model) async {
    try {
      final response = await _dio.post("auth/sign-up", data: model.toMap());
      return Right(RegisterResponse.fromMap(response.data));
    } on DioError catch (e) {
      if (e.response != null) {
        // ignore: avoid_print
        print(e.response!.data);

        return Left(ErrorResponse.fromMap(e.response!.data));
      } else {
        return Left(ErrorResponse.fromMap(e.response!.data));
      }
    } on SocketException catch (e) {
      return Left(ErrorResponse(e.message));
    }
  }
}
