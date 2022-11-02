import 'package:application_patient/core/constant/client_dio.dart';
import 'package:application_patient/data/auth_data_resource/verificaation_code/model/code_mode.dart';
import 'package:application_patient/data/auth_data_resource/verificaation_code/model/code_response.dart';
import 'package:application_patient/data/auth_data_resource/sign_up_resource/model/error_response.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

abstract class IrepoCode {
  Future<Either<ErrorResponse, CodeResponse>> verifcode(CodeModel model);
}

class IcodeUpimpl extends IrepoCode {
  final _dio = CustomDio();
  @override
  Future<Either<ErrorResponse, CodeResponse>> verifcode(CodeModel model) async {
    try {
      final response =
          await _dio.post("/auth/verify-account", data: model.toMap());
      return Right(CodeResponse.fromMap(response.data));
    } on DioError catch (e) {
      if (e.response != null) {
        return Left(ErrorResponse.fromMap(e.response!.data));
      } else {
        return Left(ErrorResponse.fromMap(e.response!.data));
      }
    }
  }
}
