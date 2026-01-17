import 'package:flutter/material.dart';
import 'package:moodly/features/meditations/data/recommended_for_you_model.dart';
import 'package:moodly/features/meditations/presentation/widgets/recommended_for_you_section/recommended_for_you_card.dart';
import '../../../../../core/widgets/app_section_header.dart';

class RecommendedForYouSection extends StatelessWidget {
  const RecommendedForYouSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const AppSectionHeader(title: "Recommended for you"),
        const SizedBox(height: 21),
        SizedBox(
          height: 254,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: recommendedForYouData.length,
            separatorBuilder: (context, index) => const SizedBox(width: 8),
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  // Handle card tap
                },
                child: RecommendedForYouCard(
                  recommendedForYouModel: recommendedForYouData[index],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
