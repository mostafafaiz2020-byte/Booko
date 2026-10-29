import 'package:bookia/core/networking/api_endpoints.dart';
import 'package:bookia/core/networking/dio_factory.dart';
import 'package:bookia/features/home/data/model/books_model.dart';
import 'package:bookia/features/home/data/model/sliders_model.dart';
// import 'package:dio/dio.dart';
// import 'package:dio/dio.dart';

class HomeRepo {
  // static Dio dio = Dio();
  static Future<BooksModel?> getBestSellerBooks() async {
    try {
      final response = await DioFactory.dio?.get(
        ApiEndpoints.productsBestseller,
      );
      if (response?.statusCode == 200) {
        BooksModel books = BooksModel.fromJson(response?.data);
        return books;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  static Future<List<Products?>?> search(String text) async {
    try {
      final response = await DioFactory.dio?.get(
        ApiEndpoints.search,
        queryParameters: {"name": text},
      );
      if (response?.statusCode == 200) {
        BooksModel booksModel = BooksModel.fromJson(response?.data);
        return booksModel.data?.products;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }

  static Future<SlidersModel?> getSlidets() async {
    try {
      final response = await DioFactory.dio?.get(ApiEndpoints.sliders);
      if (response?.statusCode == 200) {
        SlidersModel slider = SlidersModel.fromJson(response?.data);
        return slider;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
