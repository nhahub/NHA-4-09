import 'package:flutter/material.dart';
import 'package:moodly/core/extensions/context_extensions.dart';
import 'package:moodly/core/routing/routes.dart';
import 'package:moodly/features/meditations/data/models/book_model.dart';
import '../../../../../core/widgets/shared/adaptive_image.dart';
import '../../../../../core/widgets/shared/card_description_container.dart';

class BookCard extends StatelessWidget {
  final BookModel book;
  const BookCard({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    const double width = 242;
    return GestureDetector(
      onTap: () {
        context.push(Routes.bookDetailsView, args: book);
      },
      child: Container(
        width: width,
        decoration: BoxDecoration(
          color: Colors.grey.shade300,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Stack(
          children: [
            AdaptiveImage(
              imageUrl: book.volumeInfo!.imageLinks!.thumbnail!,
              width: width,
              height: double.infinity,
              borderRadius: BorderRadius.circular(16),
              fit: BoxFit.fill,
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: CardDescriptionContainer(
                title: book.volumeInfo!.title!,
                withDuration: false,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
