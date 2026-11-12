import 'package:bloc/bloc.dart';
import 'package:bookia_app/features/wishlist/data/models/wishlist_model.dart';
import 'package:flutter/foundation.dart';
import 'package:bookia_app/features/wishlist/repo/wishlist_repo.dart';

part 'wishlist_state.dart';

class WishlistCubit extends Cubit<WishlistState> {
  WishlistCubit() : super(WishlistInitial());

  Future<void> getWishlist() async {
    if (isClosed) return;

    emit(WishlistLoading());

    try {
      final response = await WishlistRepo.getWishlist();

      if (isClosed) return;

      if (response != null) {
        emit(WishlistSuccess(response));
      } else {
        emit(WishlistError('Failed to load wishlist'));
      }
    } catch (e) {
      if (isClosed) return;

      debugPrint('WISHLIST ERROR: $e');
      emit(WishlistError('Something went wrong'));
    }
  }

  Future<bool> addToWishlist(int productId) async {
    try {
      final success = await WishlistRepo.addToWishlist(productId);

      if (isClosed) return false;

      if (success) {
        await getWishlist();
        return true;
      }

      return false;
    } catch (e) {
      debugPrint('ADD WISHLIST CUBIT ERROR: $e');
      return false;
    }
  }

  Future<bool> removeFromWishlist(int productId) async {
    try {
      final success = await WishlistRepo.removeFromWishlist(productId);

      if (isClosed) return false;

      if (success) {
        await getWishlist();
        return true;
      }

      return false;
    } catch (e) {
      debugPrint('REMOVE WISHLIST CUBIT ERROR: $e');
      return false;
    }
  }
}
