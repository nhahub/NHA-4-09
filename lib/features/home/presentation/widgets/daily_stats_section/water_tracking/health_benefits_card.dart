import 'package:flutter/material.dart';
import 'package:moodly/core/theming/app_styles.dart';
import 'package:moodly/features/home/presentation/widgets/daily_stats_section/shared/app_custom_card.dart';
import 'package:moodly/features/home/presentation/widgets/daily_stats_section/water_tracking/benefit_widget.dart';

class HealthBenefitsCard extends StatelessWidget {
  const HealthBenefitsCard({super.key});

  @override
  Widget build(BuildContext context) {
    return const AppCustomCard(
      child: Column(
        spacing: 8,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("Health Benefits", style: AppStyles.extraBold16),
          BenefitWidget(benefitText: "Improves brain function"),
          BenefitWidget(benefitText: "Boosts energy levels"),
          BenefitWidget(benefitText: "Supports healthy skin"),
          BenefitWidget(benefitText: "Aids digestion"),
        ],
      ),
    );
  }
}
