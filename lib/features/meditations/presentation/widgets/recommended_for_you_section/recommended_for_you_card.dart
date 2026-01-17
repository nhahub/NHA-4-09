import 'package:flutter/material.dart';
import 'package:moodly/features/meditations/data/recommended_for_you_model.dart';
import 'package:moodly/features/meditations/presentation/widgets/recommended_for_you_section/card_description_container.dart';
import 'package:moodly/features/meditations/presentation/widgets/recommended_for_you_section/category_container.dart';
import 'package:moodly/features/meditations/presentation/widgets/recommended_for_you_section/play_button.dart';

class RecommendedForYouCard extends StatelessWidget {
  final RecommendedForYouModel recommendedForYouModel;
  const RecommendedForYouCard({
    super.key,
    required this.recommendedForYouModel,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 242,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(recommendedForYouModel.imagePath),
          fit: BoxFit.cover,
        ),
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Stack(
        children: [
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: CardDescriptionContainer(
              title: recommendedForYouModel.title,
              duration: recommendedForYouModel.duration,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(22),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CategoryContainer(
                  categoryTitle: recommendedForYouModel.category,
                ),
                SizedBox(height: 35),
                Center(child: PlayButton()),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
