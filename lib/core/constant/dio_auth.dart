import 'package:application_patient/core/constant/error_api.dart';
import 'package:application_patient/service/save_retrive_token.dart';
import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CustomDioAuth {
  late Dio _dio;
  String? accessToken;

  CustomDioAuth() {
    _dio = Dio(BaseOptions(
      baseUrl: "http://192.168.1.14:5000/patient/",
      connectTimeout: 10000,
      receiveTimeout: 10000,
    ));
    _dio.interceptors.add(InterceptorsWrapper(
      onRequest: ((options, handler) async {
        if (!options.path.contains('http')) {
          options.path = "http://192.168.1.14:5000/patient/${options.path}";
        }
        accessToken = await gettoken();
        options.headers["Authorization"] = 'Bearer $accessToken';
        return handler.next(options);
      }),
      onError: (DioError error, handler) async {
        if (error.response?.statusCode == 401 &&
            error.response?.data["msg"] == Error_code_401) {
          await refreshToken();
        } else if (error.response?.statusCode == 422 &&
            error.response?.data["msg"] == Error_code_422) {
          await refreshToken();
        }
        return handler.next(error);
      },
    ));
  }

  Future<String> gettoken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? access = prefs.getString("access");
    return access!;
  }

  Future<void> refreshToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? refresh = prefs.getString("refresh");
    final response = await _dio.post("refresh",
        options: Options(headers: {"Authorization": "Bearer $refresh"}));

    if (response.statusCode == 200) {
      accessToken = response.data["access_token"];
      ConfigToken.addToken(
          access: response.data["access_token"],
          refresh: response.data["access_token"]);
    } else {
      accessToken = null;
      ConfigToken.deteletoken();
    }
  }

  Future<Response> getauth(
    String path,
  ) async {
    final response = await _dio.get(
      path,
    );
    return response;
  }

  Future<Response> postauth(String path, {dynamic data}) async {
    Response response = await _dio.post(path, data: data);
    return response;
  }

  Future<Response> delete(String path, {dynamic data}) async {
    Response response = await _dio.delete(path, data: data);
    return response;
  }

  Future<Response> put(String path, {dynamic data}) async {
    Response response = await _dio.delete(path, data: data);
    return response;
  }
}
