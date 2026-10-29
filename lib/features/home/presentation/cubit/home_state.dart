part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class GetBestSellerLoading extends HomeState {}

final class GetBestSellerError extends HomeState {}

final class GetBestSellerSuccess extends HomeState {
  final List<Products>? products;
  GetBestSellerSuccess(this.products);
}

final class SearchLoading extends HomeState {}

final class SearchError extends HomeState {}

final class SearchSuccess extends HomeState {
  final List<Products>? products;
  SearchSuccess(this.products);
}

final class SlidersLoading extends HomeState {}

final class SlidersError extends HomeState {}

final class SlidersSuccess extends HomeState {
  final List<Sliders>? slider;
  SlidersSuccess(this.slider);
}
