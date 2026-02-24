import 'package:flutter/material.dart';

import '../../../../core/helpers/get_random_color.dart';
import '../../../../core/widgets/shared/category_container.dart';
import 'custom_details_header.dart';

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
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: nutrients
              .map(
                (nutrient) => CategoryContainer(
                  categoryTitle: nutrient,
                  containerColor: getRandomContainerColor(
                    index: nutrients.indexOf(nutrient),
                  ),
                  textColor: getRandomTextColor(
                    index: nutrients.indexOf(nutrient),
                  ),
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
