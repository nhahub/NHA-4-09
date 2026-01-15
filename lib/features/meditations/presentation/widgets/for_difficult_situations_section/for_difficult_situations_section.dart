import 'package:flutter/material.dart';

import '../../../../../core/widgets/app_section_header.dart';

class ForDifficultSituationsSection extends StatelessWidget {
  const ForDifficultSituationsSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AppSectionHeader(title: "For difficult situations"),
        Container(),
      ],
    );
  }
}
