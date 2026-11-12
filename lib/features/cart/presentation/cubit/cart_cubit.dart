import 'package:bloc/bloc.dart';
import 'package:bookia_app/features/cart/data/cart_response_model.dart';
import 'package:flutter/foundation.dart';
import 'package:bookia_app/features/cart/repo/cart_repo.dart';

part 'cart_state.dart';

class CartCubit extends Cubit<CartState> {
  CartCubit() : super(CartInitial());

  Future<void> getCartData() async {
    emit(CartLoading());

    try {
      final response = await CartRepo.getCartData();

      if (isClosed) return;

      if (response != null) {
        emit(CartSuccess(response));
      } else {
        emit(CartError('Failed to load cart'));
      }
    } catch (e) {
      debugPrint('CART CUBIT ERROR: $e');

      if (!isClosed) {
        emit(CartError('Something went wrong'));
      }
    }
  }

  Future<bool> addToCart(int productId) async {
    try {
      final success = await CartRepo.addToCart(productId);

      if (success) {
        await getCartData();
        return true;
      }

      return false;
    } catch (e) {
      debugPrint('ADD TO CART CUBIT ERROR: $e');
      return false;
    }
  }

  Future<void> updateCart({
    required int cartItemId,
    required int quantity,
  }) async {
    try {
      final success = await CartRepo.updateCart(
        cartItemId: cartItemId,
        quantity: quantity,
      );

      if (isClosed) return;

      if (success) {
        await getCartData();
      }
    } catch (e) {
      debugPrint('UPDATE CART ERROR: $e');
    }
  }

  Future<void> removeFromCart(int cartItemId) async {
    try {
      final success = await CartRepo.removeFromCart(cartItemId);

      if (isClosed) return;

      if (success) {
        await getCartData();
      } else {
        debugPrint('Failed to remove item from cart');
      }
    } catch (e) {
      debugPrint('REMOVE CART CUBIT ERROR: $e');
    }
  }
}
