part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class GetBestSellerLoading extends HomeState {}

final class GetBestSellerError extends HomeState {
  final String message;

  GetBestSellerError({required this.message});
}

final class GetBestSellerSuccess extends HomeState {
  final List<Products>? products;

  GetBestSellerSuccess(this.products);
}

final class SearchLoading extends HomeState {}

final class SearchError extends HomeState {
  final String message;

  SearchError({required this.message});
}

final class SearchSuccess extends HomeState {
  final List<Products>? products;

  SearchSuccess(this.products);
}

class GetSlidersLoading extends HomeState {}

class GetSlidersSuccess extends HomeState {
  final SliderModels sliderModels;

  GetSlidersSuccess(this.sliderModels);
}

class GetSlidersError extends HomeState {
  final String message;

  GetSlidersError({required this.message});
}
