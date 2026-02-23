import 'package:flutter/material.dart';
import 'package:moodly/core/theming/app_colors.dart';
import 'package:moodly/core/theming/app_styles.dart';
import 'package:moodly/features/meals_recommendations/presentation/widgets/custom_details_header.dart';

class EffectsSection extends StatelessWidget {
  final String effects;
  const EffectsSection({super.key, required this.effects});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomDetailsHeader(title: "Effects on mood"),
        Text(
          effects,
          style: AppStyles.medium15.copyWith(color: AppColors.bodyGray),
        ),
      ],
    );
  }
}
