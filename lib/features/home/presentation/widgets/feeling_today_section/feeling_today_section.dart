import 'package:flutter/material.dart';

import '../../../../../core/theming/app_styles.dart';

class FeelingTodaySection extends StatelessWidget {
  const FeelingTodaySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("How are you feeling today?", style: AppStyles.h2),
        Container(),
      ],
    );
  }
}
