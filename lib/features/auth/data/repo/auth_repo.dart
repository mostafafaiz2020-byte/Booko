import 'package:bookia/core/networking/api_endpoints.dart';
import 'package:bookia/core/networking/dio_factory.dart';
import 'package:bookia/core/services/locale/locale_helper.dart';
import 'package:bookia/core/utils/app_constants.dart';
import 'package:dio/dio.dart';

class AuthRepo {
  // static Dio dio = Dio();

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
    } on DioException catch (e) {
      print("Login error: ${e.response?.statusCode}");
      print("Login response: ${e.response?.data}");
      print("Login message: ${e.message}");
      return false;
    } catch (e) {
      print("Login unknown error: $e");
      return false;
    }
  }

  static Future<bool> register({
    required String username,
    required String email,
    required String password,
    required String confirmPassword,
  }) async {
    try {
      final response = await DioFactory.dio?.post(
        ApiEndpoints.register,
        data: {
          "name": username,
          "email": email,
          "password": password,
          "password_confirmation": confirmPassword,
        },
      );
      if (response?.statusCode == 200 || response?.statusCode == 201) {
        String? token = response?.data["data"]["token"];
        saveToken(token);
        return true;
      } else {
        return false;
      }
    } on DioException catch (e) {
      print("Register error: ${e.response?.statusCode}");
      print("Register response: ${e.response?.data}");
      print("Register message: ${e.message}");
      return false;
    } catch (e) {
      print("Register unknown error: $e");
      return false;
    }
  }

  static Future<void> saveToken(String? token) async {
    await LocaleHerper.prefs?.setString(AppConstants.userToken, token ?? "");
  }
}
