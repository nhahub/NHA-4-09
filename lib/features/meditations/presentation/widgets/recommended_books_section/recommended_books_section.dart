import 'package:flutter/material.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/widgets/app_section_header.dart';
import 'recommended_books_bloc_builder.dart';

class RecommendedBooksSection extends StatelessWidget {
  const RecommendedBooksSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppSectionHeader(title: "Recommended books"),
        SizedBox(height: kAppSectionSpacing),
        RecommendedBooksBlocBuilder(),
      ],
    );
  }
}
