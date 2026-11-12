import 'package:bookia_app/core/error/error_handler.dart';
import 'package:bookia_app/core/error/exceptions.dart';
import 'package:bookia_app/core/networking/api_endpoints.dart';
import 'package:bookia_app/core/networking/dio_factory.dart';
import 'package:bookia_app/features/home/data/models/books_model.dart';
import 'package:bookia_app/features/home/data/models/slider_model.dart';
import 'package:dio/dio.dart';

class HomeRepo {
  // Convert errors into our custom Exceptions
  static Exceptions _convertError(Object error) {
    if (error is DioException) {
      if (error.error is Exceptions) {
        return error.error as Exceptions;
      }

      return ErrorHandler.handleError(error);
    }

    if (error is Exceptions) {
      return error;
    }

    return Exceptions(message: 'Something went wrong. Please try again.');
  }

  static Future<BooksModel?> getBestSellerBooks() async {
    try {
      final response = await DioFactory.dio!.get(ApiEndpoints.bestSeller);

      if (response.statusCode == 200) {
        return BooksModel.fromJson(response.data);
      }

      throw Exceptions(
        message: 'Failed to load books.',
        statusCode: response.statusCode,
      );
    } catch (e) {
      throw _convertError(e);
    }
  }

  static Future<List<Products?>?> search(String text) async {
    try {
      final response = await DioFactory.dio!.get(
        ApiEndpoints.search,
        queryParameters: {"name": text},
      );

      if (response.statusCode == 200) {
        final booksModel = BooksModel.fromJson(response.data);
        return booksModel.data?.products;
      }

      throw Exceptions(
        message: 'Search failed. Please try again.',
        statusCode: response.statusCode,
      );
    } catch (e) {
      throw _convertError(e);
    }
  }

  static Future<SliderModels?> getSliders() async {
    try {
      final response = await DioFactory.dio!.get(ApiEndpoints.sliders);

      if (response.statusCode == 200 && response.data != null) {
        return SliderModels.fromJson(Map<String, dynamic>.from(response.data));
      }

      throw Exceptions(
        message: 'Failed to load sliders.',
        statusCode: response.statusCode,
      );
    } catch (e) {
      throw _convertError(e);
    }
  }
}
