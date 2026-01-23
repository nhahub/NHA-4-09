import 'package:flutter/material.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/widgets/app_section_header.dart';
import 'popular_categories_list_view.dart';

class PopularCategoriesSection extends StatelessWidget {
  const PopularCategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppSectionHeader(title: "Popular Categories"),
        SizedBox(height: kAppSectionSpacing),
        PopularCategoriesListView(),
      ],
    );
  }
}
