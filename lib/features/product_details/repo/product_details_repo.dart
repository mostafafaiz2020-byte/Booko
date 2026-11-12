import 'package:bookia_app/core/networking/api_endpoints.dart';
import 'package:bookia_app/core/networking/dio_factory.dart';
import 'package:bookia_app/features/product_details/data/models/product_details_model.dart';
import 'package:flutter/foundation.dart';

class ProductDetailsRepo {
  static Future<ProductDetailsModel?> getProductDetails(int productId) async {
    try {
      final response = await DioFactory.dio?.get(
        '${ApiEndpoints.productDetails}$productId',
      );

      if (response?.statusCode == 200) {
        return ProductDetailsModel.fromJson(
          Map<String, dynamic>.from(response!.data),
        );
      }

      return null;
    } catch (e) {
      debugPrint('PRODUCT DETAILS ERROR: $e');
      return null;
    }
  }
}
