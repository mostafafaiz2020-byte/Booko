import 'package:bookia_app/core/networking/api_endpoints.dart';
import 'package:bookia_app/core/networking/dio_factory.dart';
import 'package:bookia_app/core/services/locale/local_helper.dart';
import 'package:bookia_app/core/utils/app_const.dart';
import 'package:dio/dio.dart';

class AuthRepo {
  static Future<bool> register({
    required String email,
    required String password,
    required String passwordConfirmation,
    required String name,
  }) async {
    try {
      final response = await DioFactory.dio?.post(
        ApiEndpoints.register,
        data: {
          "email": email,
          "password": password,
          "name": name,
          "password_confirmation": passwordConfirmation,
        },
      );
      if (response?.statusCode == 200 || response?.statusCode == 201) {
        String? token = response?.data["data"]["token"];
        saveToken(token);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  static saveToken(String? token) {
    LocalHelper.prefs?.setString(AppConst.userToken, token ?? "");
  }

  static Future<bool> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await DioFactory.dio?.post(
        ApiEndpoints.login,
        data: {"email": email, "password": password},
      );
      if (response?.statusCode == 200 || response?.statusCode == 201) {
        String? token = response?.data["data"]["token"];
        saveToken(token);
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
