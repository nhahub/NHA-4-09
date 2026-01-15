import 'package:flutter/material.dart';

import '../../../../../core/theming/app_styles.dart';

class FeelingTodaySection extends StatelessWidget {
  const FeelingTodaySection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("How are you feeling today?", style: AppStyles.extraBold20),
        Container(),
      ],
    );
  }
}
