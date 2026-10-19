// Feature/auth/data/repo/auth_repo.dart

import 'package:dio/dio.dart';

class AuthRepo {
  Dio dio = Dio();

  Future<bool> login({required String email, required String password}) async {
    try {
      final response = await dio.post(
        'https://codingarabic.erapro.com/login',
        data: {'email': email, 'password': password},
      );

      if (response.statusCode == 200) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }
}
