import 'package:flutter/material.dart';
import 'package:moodly/core/constants/constants.dart';
import 'package:moodly/features/home/presentation/widgets/shared/back_button_appbar.dart';
import 'package:moodly/features/mood/data/models/recommendation_model.dart';
import 'package:moodly/features/mood/presentation/widgets/recommendations/active_practice_card.dart';
import 'package:moodly/features/mood/presentation/widgets/recommendations/avoid_card.dart';
import 'package:moodly/features/mood/presentation/widgets/recommendations/suggestion_card.dart';

class RecommendationsView extends StatelessWidget {
  final RecommendationModel recommendationModel;
  const RecommendationsView({super.key, required this.recommendationModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BackButtonAppbar(title: "Recommendations"),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(
          left: kAppHorizontalPadding,
          right: kAppHorizontalPadding,
          bottom: 40,
        ),
        child: Column(
          spacing: 24,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ActivePracticeCard(
              recommendationSection: recommendationModel.sections,
            ),
            AvoidCard(avoid: recommendationModel.avoid),
            SuggestionCard(suggestion: recommendationModel.suggestions),
          ],
        ),
      ),
    );
  }
}
