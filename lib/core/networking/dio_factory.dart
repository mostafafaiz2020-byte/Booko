import 'package:bookia_app/core/error/error_handler.dart';
import 'package:bookia_app/core/networking/api_endpoints.dart';
import 'package:bookia_app/core/services/locale/local_helper.dart';
import 'package:bookia_app/core/utils/app_const.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioFactory {
  static Dio? dio;
  static void inti() {
    dio = Dio(
      BaseOptions(
        baseUrl: ApiEndpoints.baseUrl,
        headers: {
          "accept": "application/json",
          "content-Type": "application/json",
        },
      ),
    );

    dio!.interceptors.add(
      InterceptorsWrapper(
        onRequest: (options, handler) {
          final token = LocalHelper.prefs?.get(AppConst.userToken);

          if (token != null && token.toString().isNotEmpty) {
            options.headers['Authorization'] = 'Bearer $token';
          } else {
            options.headers.remove('Authorization');
            debugPrint('AUTH WARNING: Token is missing');
          }

          handler.next(options);
        },
      ),
    );

    dio!.interceptors.add(
      PrettyDioLogger(
        requestHeader: true,
        requestBody: true,
        responseBody: true,
        responseHeader: false,
        error: true,
        compact: true,
        maxWidth: 90,
        enabled: kDebugMode,
      ),
    );

    //error handling
    dio!.interceptors.add(
      InterceptorsWrapper(
        onError: (error, handler) {
          final appException = ErrorHandler.handleError(error);

          debugPrint('API ERROR: ${appException.message}');

          handler.reject(
            DioException(
              requestOptions: error.requestOptions,
              response: error.response,
              type: error.type,
              error: appException,
              message: appException.message,
            ),
          );
        },
      ),
    );
  }
}
