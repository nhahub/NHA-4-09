import 'package:flutter/material.dart';
import 'package:moodly/core/theming/app_colors.dart';
import 'package:moodly/features/mood/data/models/recommendation_model.dart';

import '../../../../../core/theming/app_styles.dart';

class ExpandableItem extends StatelessWidget {
  final RecommendationSection recommendationSection;

  const ExpandableItem({required this.recommendationSection, super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: AppColors.bgFill,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Theme(
        data: Theme.of(context).copyWith(dividerColor: Colors.transparent),
        child: ExpansionTile(
          title: Text(
            recommendationSection.category,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          children: recommendationSection.items
              .map(
                (item) => Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(width: 16),
                      Transform.translate(
                        offset: const Offset(0, 8),
                        child: const CircleAvatar(
                          backgroundColor: AppColors.lightGrey,
                          radius: 4,
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(child: Text(item, style: AppStyles.medium15)),
                      const SizedBox(width: 16),
                    ],
                  ),
                ),
              )
              .toList(),
        ),
      ),
    );
  }
}
