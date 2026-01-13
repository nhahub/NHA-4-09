import 'package:flutter/material.dart';

import '../../../../../core/widgets/app_section_header.dart';

class YourDailyRoutineSection extends StatelessWidget {
  const YourDailyRoutineSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const AppSectionHeader(title: "Your daily routine"),
        Container(),
      ],
    );
  }
}
