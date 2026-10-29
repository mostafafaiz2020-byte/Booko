import 'package:bookia/core/networking/api_endpoints.dart';
import 'package:bookia/core/networking/dio_factory.dart';
import 'package:bookia/features/book_details/data/models/book_details_models.dart';

class BookDetailsRepo {
  static getBookDetails(int id) async {
    try {
      final response = await DioFactory.dio?.get(
        "${ApiEndpoints.bookDetails}$id",
      );
      if (response?.statusCode == 200) {
        BookDetailsModels details = BookDetailsModels.fromJson(response?.data);
        return details;
      } else {
        return null;
      }
    } catch (e) {
      return null;
    }
  }
}
