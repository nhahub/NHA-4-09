import 'package:flutter/material.dart';

import '../../../../../core/widgets/horizontal_padding_list.dart';
import '../../../data/models/book_model.dart';
import 'book_card.dart';

class RecommendedBooksListView extends StatelessWidget {
  final List<BookModel> recommendedBooks;
  final bool isLoading;

  const RecommendedBooksListView({
    super.key,
    this.isLoading = false,
    required this.recommendedBooks,
  });
  @override
  Widget build(BuildContext context) {
    return HorizontalPaddingList(
      isLoading: isLoading,
      height: 254,
      itemCount: recommendedBooks.length,
      itemBuilder: (context, index) {
        return BookCard(book: recommendedBooks[index]);
      },
    );
  }
}
