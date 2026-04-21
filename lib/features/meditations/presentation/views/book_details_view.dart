import 'package:flutter/material.dart';
import 'package:moodly/features/meditations/data/models/book_model.dart';

import '../../../home/presentation/widgets/shared/back_button_appbar.dart';

class BookDetailsView extends StatelessWidget {
  final BookModel book;
  const BookDetailsView({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(appBar: BackButtonAppbar(title: "Book details"));
  }
}
