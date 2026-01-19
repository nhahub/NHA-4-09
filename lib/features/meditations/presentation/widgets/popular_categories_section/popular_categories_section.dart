import 'package:flutter/material.dart';
import 'package:moodly/core/constants/constants.dart';
import 'package:moodly/features/meditations/presentation/widgets/popular_categories_section/popular_categories_list_view.dart';

import '../../../../../core/widgets/app_section_header.dart';

class PopularCategoriesSection extends StatelessWidget {
  const PopularCategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AppSectionHeader(title: "Popular Categories"),
        const SizedBox(height: kAppSectionSpacing),
        const PopularCategoriesListView(),
      ],
    );
  }
}
