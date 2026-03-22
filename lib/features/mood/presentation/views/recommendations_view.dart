import 'package:flutter/material.dart';
import 'package:moodly/core/constants/constants.dart';
import 'package:moodly/features/home/presentation/widgets/shared/back_button_appbar.dart';
import 'package:moodly/features/mood/data/models/mock_recommendation.dart';
import 'package:moodly/features/mood/data/models/recommendation.dart';
import 'package:moodly/features/mood/presentation/widgets/recommendations/expandable_section.dart';

class RecommendationsView extends StatelessWidget {
  const RecommendationsView({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Recommendation> recommendations = recommendationsData;

    final bodyItems = recommendations
        .where((r) => r.category == "Body")
        .toList();
    final mentalItems = recommendations
        .where((r) => r.category == "Mental")
        .toList();
    final avoidItems = recommendations
        .where((r) => r.category == "Avoid")
        .toList();

    return Scaffold(
      appBar: const BackButtonAppbar(title: "Recommendations"),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: kAppHorizontalPadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ExpandableSection(
              title: "Body Reset",
              icon: Icons.fitness_center,
              items: bodyItems,
            ),
            ExpandableSection(
              title: "Mental Reset",
              icon: Icons.psychology,
              items: mentalItems,
            ),
            ExpandableSection(
              title: "Avoid Right Now",
              icon: Icons.warning,
              items: avoidItems,
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}
