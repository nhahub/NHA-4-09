import 'package:flutter/material.dart';
import 'package:moodly/core/helpers/get_random_color.dart';
import 'package:moodly/core/widgets/shared/category_container.dart';
import 'package:moodly/features/meals_recommendations/presentation/widgets/custom_details_header.dart';

class NutrientsSection extends StatelessWidget {
  final List<String> nutrients;
  const NutrientsSection({super.key, required this.nutrients});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 4,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomDetailsHeader(title: "Nutrients"),
        Row(
          spacing: 8,
          children: nutrients
              .map(
                (nutrient) => TagContainer(
                  categoryTitle: nutrient,
                  color: getRandomColor(index: nutrients.indexOf(nutrient)),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
