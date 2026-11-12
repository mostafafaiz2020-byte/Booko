import 'package:bookia_app/core/networking/api_endpoints.dart';
import 'package:bookia_app/core/networking/dio_factory.dart';
import 'package:bookia_app/features/wishlist/data/models/wishlist_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class WishlistRepo {
  static Future<WishlistData?> getWishlist() async {
    try {
      final response = await DioFactory.dio?.get(ApiEndpoints.wishlist);

      if (response?.statusCode == 200 || response?.statusCode == 201) {
        final wishlistResponse = WishlistModel.fromJson(
          Map<String, dynamic>.from(response!.data),
        );

        return wishlistResponse.data;
      }

      return null;
    } on DioException catch (e) {
      debugPrint('GET WISHLIST ERROR: ${e.response?.data}');
      return null;
    } catch (e) {
      debugPrint('GET WISHLIST UNKNOWN ERROR: $e');
      return null;
    }
  }

  static Future<bool> addToWishlist(int productId) async {
    try {
      final response = await DioFactory.dio?.post(
        ApiEndpoints.addToWishlist,
        data: {'product_id': productId},
      );

      debugPrint('ADD WISHLIST STATUS: ${response?.statusCode}');
      debugPrint('ADD WISHLIST RESPONSE: ${response?.data}');

      return response?.statusCode == 200 || response?.statusCode == 201;
    } on DioException catch (e) {
      debugPrint('ADD WISHLIST ERROR: ${e.response?.data}');
      return false;
    } catch (e) {
      debugPrint('ADD WISHLIST UNKNOWN ERROR: $e');
      return false;
    }
  }

  static Future<bool> removeFromWishlist(int productId) async {
    try {
      final response = await DioFactory.dio?.post(
        ApiEndpoints.removeFromWishlist,
        data: {'product_id': productId},
      );

      debugPrint('REMOVE WISHLIST STATUS: ${response?.statusCode}');
      debugPrint('REMOVE WISHLIST RESPONSE: ${response?.data}');

      return response?.statusCode == 200 || response?.statusCode == 201;
    } on DioException catch (e) {
      debugPrint('REMOVE WISHLIST ERROR: ${e.response?.data}');
      return false;
    } catch (e) {
      debugPrint('REMOVE WISHLIST UNKNOWN ERROR: $e');
      return false;
    }
  }
}
