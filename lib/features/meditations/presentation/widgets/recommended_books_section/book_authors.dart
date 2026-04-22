import 'package:flutter/material.dart';

import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_styles.dart';

class BookAuthors extends StatelessWidget {
  final List<String> authors;
  const BookAuthors({super.key, required this.authors});

  @override
  Widget build(BuildContext context) {
    return Wrap(
      alignment: WrapAlignment.center,
      children: List.generate(authors.length, (index) {
        final author = authors[index];
        final isLast = index == authors.length - 1;

        return Text(
          isLast ? author : "$author, ",
          style: AppStyles.semiBold16.copyWith(color: AppColors.bodyGray),
        );
      }),
    );
  }
}
