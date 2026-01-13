import 'package:flutter/material.dart';

import '../../../../../core/widgets/app_section_header.dart';

class RecommendedForYouSection extends StatelessWidget {
  const RecommendedForYouSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const AppSectionHeader(title: "Recommended for you"),
        Container(),
      ],
    );
  }
}
