part of 'book_details_cubit.dart';

@immutable
sealed class BookDetailsState {}

final class BookDetailsInitial extends BookDetailsState {}

final class GetBookDetailsLoading extends BookDetailsState {}

final class GetBookDetailsError extends BookDetailsState {}

final class GetBookDetailsSuccess extends BookDetailsState {
  final Data? details;

  GetBookDetailsSuccess(this.details);
}
