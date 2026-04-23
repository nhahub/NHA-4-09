import 'package:flutter/material.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/widgets/app_section_header.dart';
import 'articles_grid_view.dart';

class ArticlesSection extends StatelessWidget {
  const ArticlesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        AppSectionHeader(title: "Articles"),
        SizedBox(height: kAppSectionSpacing),
        ArticlesGridView(),
      ],
    );
  }
}
