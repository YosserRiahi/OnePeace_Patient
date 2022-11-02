import 'dart:io';

import 'package:application_patient/core/constant/client_dio.dart';
import 'package:application_patient/core/constant/dio_auth.dart';
import 'package:application_patient/core/constant/error_api.dart';
import 'package:application_patient/data/auth_data_resource/login_resource/models/log_out_response.dart';
import 'package:application_patient/data/auth_data_resource/login_resource/models/login_response.dart';
import 'package:application_patient/data/auth_data_resource/login_resource/models/request_login_mode.dart';
import 'package:application_patient/data/auth_data_resource/login_resource/models/response_complet.dart';
import 'package:application_patient/data/auth_data_resource/login_resource/models/user_model.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../sign_up_resource/model/error_response.dart';
import 'models/complet_request.dart';

abstract class IrepoSignin {
  Future<Either<ErrorResponse, ResponseLogin>> signin(LoginModel model);
  Future<Either<ErrorResponse, Usermodel>> fetchme();
  Future<Either<ErrorResponse, ResponseComplet>> complet(CompletModel model);
  Future<Either<ErrorResponse, LogOutResponse>> logout();
}

class IrespoSinImpl extends IrepoSignin {
  final _dio = CustomDio();
  final _dioauth = CustomDioAuth();
  @override
  Future<Either<ErrorResponse, ResponseLogin>> signin(LoginModel model) async {
    try {
      final response = await _dio.post("auth/login", data: model.toMap());
      return Right(ResponseLogin.fromMap(response.data));
    } on DioError catch (e) {
      if (e.response != null && e.response!.data["message"] == Error_Email) {
        return Left(ErrorResponse("Email or Password are wrong"));
      } else if (e.response != null &&
          e.response!.data["message"] == Error_COMPTE_VERIFIE) {
        return Left(ErrorResponse("Account Not verified"));
      } else {
        return Left(ErrorResponse("please verifie your internet connection"));
      }
    } on SocketException catch (e) {
      // ignore: avoid_print
      print(e.toString());
      return Left(ErrorResponse("connection is failed"));
    }
  }

  @override
  Future<Either<ErrorResponse, Usermodel>> fetchme() async {
    try {
      final response = await _dioauth.getauth(
        "me",
      );
      // ignore: avoid_print
      print("data fetched with succes ${response.data}");
      return Right(Usermodel.fromJson(response.data));
    } on DioError catch (e) {
      if (e.response != null && e.response!.data["message"] == Error_Email) {
        return Left(ErrorResponse("Email or Password are wrong"));
      } else if (e.response != null &&
          e.response!.data["message"] == Error_COMPTE_VERIFIE) {
        return Left(ErrorResponse("Account Not verified"));
      } else {
        return Left(ErrorResponse.fromMap(e.response!.data));
      }
    } on SocketException catch (e) {
      // ignore: avoid_print
      print(e.toString());
      return Left(ErrorResponse("connection is failed"));
    }
  }

  @override
  Future<Either<ErrorResponse, ResponseComplet>> complet(
      CompletModel model) async {
    try {
      final response =
          await _dioauth.postauth("complet-profil", data: model.toMap());
      // ignore: avoid_print
      print("complet data fetched with succes ${response.data}");
      return Right(ResponseComplet.fromMap(response.data));
    } on DioError catch (e) {
      if (e.response != null) {
        return Left(ErrorResponse.fromJson(e.response!.data));
      } else {
        return Left(ErrorResponse.fromMap(e.response!.data));
      }
    } on SocketException catch (e) {
      // ignore: avoid_print
      print(e.toString());
      return Left(ErrorResponse("connection is failed"));
    }
  }

  @override
  Future<Either<ErrorResponse, LogOutResponse>> logout() async {
    try {
      final response = await _dioauth.postauth("auth/logout");
      // ignore: avoid_print
      print("user sign out with succes ${response.data}");
      return Right(LogOutResponse.fromMap(response.data));
    } on DioError catch (e) {
      if (e.response != null) {
        return Left(ErrorResponse.fromJson(e.response!.data));
      } else {
        return Left(ErrorResponse.fromMap(e.response!.data));
      }
    } on SocketException catch (e) {
      // ignore: avoid_print
      print(e.toString());
      return Left(ErrorResponse("connection is failed"));
    }
  }
}
