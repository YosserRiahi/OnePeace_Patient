import 'package:application_patient/core/constant/client_dio.dart';
import 'package:application_patient/data/auth_data_resource/reset_password/model/reset_model.dart';
import 'package:application_patient/data/auth_data_resource/reset_password/model/reset_response.dart';
import 'package:application_patient/data/auth_data_resource/sign_up_resource/model/error_response.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

abstract class IreposiRest {
  Future<Either<ErrorResponse, ResetResponse>> reset(ResetModel model);
}

class IreposiRestImpl extends IreposiRest {
  final _dio = CustomDio();
  @override
  Future<Either<ErrorResponse, ResetResponse>> reset(ResetModel model) async {
    try {
      final response =
          await _dio.post("/auth/reset-password", data: model.toMap());
      return Right(ResetResponse.fromMap(response.data));
    } on DioError catch (e) {
      if (e.response != null) {
        return Left(ErrorResponse.fromMap(e.response!.data));
      } else {
        return Left(ErrorResponse.fromMap(e.response!.data));
      }
    }
  }
}
