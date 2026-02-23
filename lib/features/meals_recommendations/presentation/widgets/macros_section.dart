import 'package:flutter/material.dart';
import 'package:moodly/features/meals_recommendations/data/models/macros_model.dart';
import 'package:moodly/features/meals_recommendations/presentation/widgets/calories_details.dart';
import 'package:moodly/features/meals_recommendations/presentation/widgets/custom_details_header.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_styles.dart';

class MacrosSection extends StatelessWidget {
  final MacrosModel macros;

  const MacrosSection({super.key, required this.macros});

  @override
  Widget build(BuildContext context) {
    final macroItems = [
      {
        "title": "Carbohydrates",
        "value": macros.carbohydrates,
        "color": const Color(0xffb4d76e),
      },
      {
        "title": "Proteins",
        "value": macros.proteins,
        "color": const Color(0xffdfdc3f),
      },
      {"title": "Fats", "value": macros.fats, "color": const Color(0xffac595f)},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const CustomDetailsHeader(title: "Macros"),
        Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 8,
              children: macroItems
                  .map(
                    (item) => CaloriesDetails(
                      title: item["title"] as String,
                      value: item["value"] as double,
                      color: item["color"] as Color,
                    ),
                  )
                  .toList(),
            ),
            const Spacer(),
            Column(
              children: [
                Text(
                  "kcal",
                  style: AppStyles.semiBold17.copyWith(
                    color: AppColors.bodyGray,
                  ),
                ),
                Text(macros.kcal.toString(), style: AppStyles.extraBold27),
              ],
            ),
            const Spacer(),
          ],
        ),
      ],
    );
  }
}
