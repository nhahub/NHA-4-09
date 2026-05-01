import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/networking/api_error_handler.dart';
import '../../../data/models/book_model.dart';
import '../../../data/repos/recommended_books_repo.dart';

part 'recommended_books_state.dart';

class RecommendedBooksCubit extends Cubit<RecommendedBooksState> {
  final RecommendedBooksRepo _recommendedBooksRepo;

  RecommendedBooksCubit({required RecommendedBooksRepo recommendedBooksRepo})
    : _recommendedBooksRepo = recommendedBooksRepo,
      super(RecommendedBooksLoadingState());

  void getRecommendedBooks({required String currentMood}) async {
    try {
      final List<BookModel> books = await _recommendedBooksRepo
          .getRecommendedBooks(currentMood: currentMood);
      emit(RecommendedBooksLoadedState(recommendedBooks: books));
    } catch (e) {
      emit(
        RecommendedBooksFailureState(
          message: ApiErrorHandler.handle(error: e).message,
        ),
      );
    }
  }
}
