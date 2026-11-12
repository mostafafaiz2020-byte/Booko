import 'package:bookia_app/core/error/exceptions.dart';
import 'package:dio/dio.dart';

class ErrorHandler {
  static Exceptions handleError(DioException error) {
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
      case DioExceptionType.sendTimeout:
      case DioExceptionType.receiveTimeout:
        return Exceptions(message: 'Connection timeout. Please try again.');

      case DioExceptionType.connectionError:
        return Exceptions(
          message: 'No internet connection. Please check your network.',
        );

      case DioExceptionType.badResponse:
        return _handleStatusCode(error);

      case DioExceptionType.cancel:
        return Exceptions(message: 'Request was cancelled.');

      case DioExceptionType.badCertificate:
        return Exceptions(message: 'Secure connection failed.');

      case DioExceptionType.unknown:
        return Exceptions(message: 'Something went wrong. Please try again.');
      case DioExceptionType.transformTimeout:
        return Exceptions(
          message: 'Data processing timeout. Please try again.',
        );
    }
  }

  static Exceptions _handleStatusCode(DioException error) {
    final statusCode = error.response?.statusCode;

    String message;

    switch (statusCode) {
      case 400:
        message = 'Bad request. Please check your data.';
        break;

      case 401:
        message = 'Unauthorized. Please login again.';
        break;

      case 403:
        message = 'You do not have permission.';
        break;

      case 404:
        message = 'Requested data not found.';
        break;

      case 422:
        message = 'Invalid data. Please check your inputs.';
        break;

      case 500:
      case 501:
      case 502:
      case 503:
        message = 'Server error. Please try again later.';
        break;

      default:
        message = 'Something went wrong. Please try again.';
    }

    return Exceptions(message: message, statusCode: statusCode);
  }
}
