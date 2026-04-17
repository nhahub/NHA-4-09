import 'package:flutter/material.dart';

import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_styles.dart';
import '../../../../../core/widgets/expandable_text.dart';

class TherapistAboutSection extends StatelessWidget {
  final String about;

  const TherapistAboutSection({super.key, required this.about});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("About", style: AppStyles.extraBold20),
        const SizedBox(height: 4),
        ExpandableText(
          text: about,
          style: AppStyles.medium15.copyWith(color: AppColors.lightGrey),
        ),
      ],
    );
  }
}
