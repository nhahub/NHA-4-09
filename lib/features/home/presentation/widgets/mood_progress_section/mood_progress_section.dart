import 'package:flutter/material.dart';

import '../../../../../core/widgets/app_section_header.dart';

class MoodProgressSection extends StatelessWidget {
  const MoodProgressSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const AppSectionHeader(title: "Mood Progress"),
        Container(),
      ],
    );
  }
}
