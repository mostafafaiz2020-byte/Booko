import 'package:bloc/bloc.dart';
import 'package:bookia/features/book_details/data/models/book_details_models.dart';
import 'package:bookia/features/book_details/data/repo/book_details_repo.dart';
import 'package:meta/meta.dart';

part 'book_details_state.dart';

class BookDetailsCubit extends Cubit<BookDetailsState> {
  BookDetailsCubit() : super(BookDetailsInitial());

  getDetails(int id) async {
    emit(GetBookDetailsLoading());
    final details = await BookDetailsRepo.getBookDetails(id);
    if (details is BookDetailsModels) {
      emit(GetBookDetailsSuccess(details.data));
    } else {
      emit(GetBookDetailsError());
    }
  }
}
