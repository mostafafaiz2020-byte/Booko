import 'package:bookia_app/core/networking/api_endpoints.dart';
import 'package:bookia_app/core/networking/dio_factory.dart';
import 'package:bookia_app/features/cart/data/cart_response_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class CartRepo {
  static Future<CartData?> getCartData() async {
    try {
      final response = await DioFactory.dio?.get(ApiEndpoints.cart);

      if (response?.statusCode == 200) {
        final cartResponse = CartResponseModel.fromJson(
          Map<String, dynamic>.from(response!.data),
        );

        return cartResponse.data;
      }

      return null;
    } catch (e) {
      debugPrint('CART API ERROR: $e');
      return null;
    }
  }

  static Future<bool> addToCart(int productId) async {
    try {
      final response = await DioFactory.dio?.post(
        ApiEndpoints.addToCart,
        data: {'product_id': productId},
      );

      debugPrint('ADD TO CART STATUS: ${response?.statusCode}');
      debugPrint('ADD TO CART DATA: ${response?.data}');

      return response?.statusCode == 200 || response?.statusCode == 201;
    } on DioException catch (e) {
      debugPrint('ADD TO CART ERROR: ${e.message}');
      debugPrint('ADD TO CART STATUS: ${e.response?.statusCode}');
      debugPrint('ADD TO CART RESPONSE: ${e.response?.data}');
      debugPrint('ADD TO CART URL: ${e.requestOptions.uri}');

      return false;
    } catch (e) {
      debugPrint('ADD TO CART UNKNOWN ERROR: $e');
      return false;
    }
  }

  static Future<bool> updateCart({
    required int cartItemId,
    required int quantity,
  }) async {
    try {
      final response = await DioFactory.dio?.post(
        ApiEndpoints.updateCart,
        data: {'cart_item_id': cartItemId, 'quantity': quantity},
      );

      debugPrint('UPDATE CART STATUS: ${response?.statusCode}');
      debugPrint('UPDATE CART RESPONSE: ${response?.data}');

      return response?.statusCode == 200 || response?.statusCode == 201;
    } on DioException catch (e) {
      debugPrint('UPDATE CART ERROR: ${e.response?.data}');
      return false;
    } catch (e) {
      debugPrint('UPDATE CART UNKNOWN ERROR: $e');
      return false;
    }
  }

  static Future<bool> removeFromCart(int cartItemId) async {
    try {
      final response = await DioFactory.dio?.post(
        ApiEndpoints.removeFromCart,
        data: {'cart_item_id': cartItemId},
      );

      debugPrint('REMOVE CART STATUS: ${response?.statusCode}');
      debugPrint('REMOVE CART RESPONSE: ${response?.data}');

      return response?.statusCode == 200 || response?.statusCode == 201;
    } on DioException catch (e) {
      debugPrint('REMOVE CART ERROR: ${e.response?.data}');
      return false;
    } catch (e) {
      debugPrint('REMOVE CART UNKNOWN ERROR: $e');
      return false;
    }
  }
}
