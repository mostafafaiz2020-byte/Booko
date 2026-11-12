import 'package:bloc/bloc.dart';
import 'package:bookia_app/core/error/exceptions.dart';
import 'package:bookia_app/features/home/data/models/books_model.dart';
import 'package:bookia_app/features/home/data/models/slider_model.dart';
import 'package:bookia_app/features/home/repo/home_repo.dart';
import 'package:meta/meta.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());

  SliderModels? sliderModels;

  // Helper method to get error message
  String getErrorMessage(Object error) {
    if (error is Exceptions) {
      return error.message;
    }

    return 'Something went wrong. Please try again.';
  }

  Future<void> getBestSellerBooks() async {
    if (isClosed) return;

    print('HOME: Started loading books');

    emit(GetBestSellerLoading());

    try {
      final response = await HomeRepo.getBestSellerBooks();

      if (isClosed) return;

      if (response != null) {
        print('HOME: Products count: ${response.data?.products?.length ?? 0}');
        emit(GetBestSellerSuccess(response.data?.products));
      } else {
        emit(GetBestSellerError(message: 'No books found. Please try again.'));
      }
    } catch (e, stackTrace) {
      if (isClosed) return;

      print('HOME ERROR: $e');
      print(stackTrace);

      emit(GetBestSellerError(message: getErrorMessage(e)));
    }
  }

  Future<void> search(String text) async {
    if (isClosed) return;

    emit(SearchLoading());

    try {
      final data = await HomeRepo.search(text);

      if (isClosed) return;

      if (data != null) {
        emit(SearchSuccess(data.whereType<Products>().toList()));
      } else {
        emit(SearchError(message: 'Search failed. Please try again.'));
      }
    } catch (e, stackTrace) {
      if (isClosed) return;

      print('SEARCH ERROR: $e');
      print(stackTrace);

      emit(SearchError(message: getErrorMessage(e)));
    }
  }

  Future<void> getSliders() async {
    if (isClosed) return;

    emit(GetSlidersLoading());

    try {
      final response = await HomeRepo.getSliders();

      if (isClosed) return;

      if (response != null && response.data?.sliders != null) {
        sliderModels = response;

        print('SLIDERS COUNT: ${sliderModels!.data!.sliders!.length}');

        emit(GetSlidersSuccess(response));
      } else {
        emit(
          GetSlidersError(message: 'Failed to load sliders. Please try again.'),
        );
      }
    } catch (e, stackTrace) {
      if (isClosed) return;

      print('SLIDERS ERROR: $e');
      print(stackTrace);

      emit(GetSlidersError(message: getErrorMessage(e)));
    }
  }
}
