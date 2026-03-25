import 'package:flutter/material.dart';

import '../../../../core/constants/constants.dart';
import '../../../home/presentation/widgets/shared/back_button_appbar.dart';
import '../../data/models/recommendation_model.dart';
import '../widgets/recommendations/active_practice_card.dart';
import '../widgets/recommendations/avoid_card.dart';
import '../widgets/recommendations/suggestion_card.dart';

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
