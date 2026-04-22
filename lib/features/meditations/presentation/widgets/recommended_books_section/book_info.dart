import 'package:flutter/material.dart';
import '../../../../../core/extensions/string_extensions.dart';
import '../../../data/models/book_model.dart';
import 'info_item.dart';
import 'item_divider.dart';

class BookInfo extends StatelessWidget {
  final BookModel book;
  const BookInfo({super.key, required this.book});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: Colors.grey.shade100,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          InfoItem(data: book.accessInfo?.country ?? "N", label: "Country"),
          const ItemDivider(),
          InfoItem(
            data: book.volumeInfo!.pageCount.toString(),
            label: "Number of pages",
          ),
          const ItemDivider(),
          InfoItem(
            data: book.volumeInfo!.language?.capitalize() ?? "N",
            label: "Language",
          ),
        ],
      ),
    );
  }
}
