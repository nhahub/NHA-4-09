import 'package:flutter/material.dart';

import '../../../../../core/widgets/app_section_header.dart';

class PopularCategoriesSection extends StatelessWidget {
  const PopularCategoriesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const AppSectionHeader(title: "Popular Categories"),
        Container(),
      ],
    );
  }
}
