import 'package:flutter/material.dart';

import '../../../../core/helpers/get_random_color.dart';
import '../../../../core/widgets/shared/category_container.dart';
import 'custom_details_header.dart';

class MealTimeSection extends StatelessWidget {
  final List<String> mealTime;
  const MealTimeSection({super.key, required this.mealTime});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 4,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomDetailsHeader(title: "Meal Time"),
        Row(
          spacing: 8,
          children: mealTime
              .map(
                (nutrient) => CategoryContainer(
                  categoryTitle: nutrient,
                  color: getRandomColor(index: mealTime.indexOf(nutrient)),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
