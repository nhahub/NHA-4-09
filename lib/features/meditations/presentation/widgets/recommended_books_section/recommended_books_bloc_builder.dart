import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/widgets/custom_error_widget.dart';
import '../../../data/models/book_model.dart';
import '../../../data/models/dummy/dummy_books.dart';
import '../../manager/recommended_books_cubit/recommended_books_cubit.dart';
import 'recommended_books_list_view.dart';

class RecommendedBooksBlocBuilder extends StatelessWidget {
  const RecommendedBooksBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RecommendedBooksCubit, RecommendedBooksState>(
      builder: (context, state) {
        switch (state) {
          case RecommendedBooksLoadingState():
            return RecommendedBooksListView(
              recommendedBooks: DummyBooks.dummyBooks,
              isLoading: true,
            );
          case RecommendedBooksLoadedState(
            recommendedBooks: final List<BookModel> recommendedBooks,
          ):
            return RecommendedBooksListView(recommendedBooks: recommendedBooks);
          case RecommendedBooksFailureState(message: final String message):
            return CustomErrorWidget(message: message);
        }
      },
    );
  }
}
