import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:bookia_app/features/home/data/models/books_model.dart';
import 'package:bookia_app/features/product_details/repo/product_details_repo.dart';

part 'product_details_state.dart';

class ProductDetailsCubit extends Cubit<ProductDetailsState> {
  ProductDetailsCubit() : super(ProductDetailsInitial());

  Future<void> getProductDetails(int productId) async {
    if (isClosed) return;

    emit(ProductDetailsLoading());

    try {
      final response = await ProductDetailsRepo.getProductDetails(productId);

      if (isClosed) return;

      if (response?.data != null) {
        emit(ProductDetailsSuccess(response!.data));
      } else {
        emit(ProductDetailsError('Failed to load product details'));
      }
    } catch (e) {
      if (isClosed) return;

      debugPrint('PRODUCT DETAILS CUBIT ERROR: $e');
      emit(ProductDetailsError('Something went wrong'));
    }
  }
}
