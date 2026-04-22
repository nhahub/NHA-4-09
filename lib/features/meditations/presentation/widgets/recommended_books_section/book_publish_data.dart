import 'package:flutter/material.dart';
import '../../../../../core/extensions/published_date.dart';
import '../../../data/models/book_model.dart';
import 'book_price.dart';
import 'publish_item.dart';

class BookPublishData extends StatelessWidget {
  final BookModel book;
  const BookPublishData({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          spacing: 4,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PublishItem(
              data: book.volumeInfo?.publisher ?? "N",
              label: "Publisher",
            ),
            PublishItem(
              data: book.volumeInfo?.publishedDate.yearOnly ?? "N",
              label: "Publication Date",
            ),
          ],
        ),
        if (book.saleInfo?.saleability == "FOR_SALE")
          BookPrice(
            price: book.saleInfo?.listPrice?.amount.toString(),
            currency: book.saleInfo?.listPrice?.currencyCode,
          ),
      ],
    );
  }
}
