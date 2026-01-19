import 'package:flutter/material.dart';
import 'package:moodly/core/constants/constants.dart';
import 'package:moodly/features/meditations/presentation/widgets/recommended_for_you_section/recommended_for_you_list_view.dart';
import '../../../../../core/widgets/app_section_header.dart';

class RecommendedForYouSection extends StatelessWidget {
  const RecommendedForYouSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AppSectionHeader(title: "Recommended for you"),
        const SizedBox(height: kAppSectionSpacing),
        const RecommendedForYouListView(),
      ],
    );
  }
}
