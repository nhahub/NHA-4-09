import 'package:flutter/material.dart';
import '../../../../../core/widgets/horizontal_padding_list.dart';
import '../../../data/mock_data/activity_category_data.dart';
import '../../../data/models/activity/activity_category_model.dart';
import 'activity_category_card.dart';

class ActivitiesCategoriesListView extends StatelessWidget {
  final List<ActivityCategoryModel> activityCategories;
  final bool isLoading;
  const ActivitiesCategoriesListView({
    super.key,
    required this.activityCategories,
    this.isLoading = false,
  });

  @override
  Widget build(BuildContext context) {
    return HorizontalPaddingList(
      isLoading: isLoading,
      height: 254,
      itemCount: activityCategoryModelData.length,
      itemBuilder: (context, index) {
        return ActivityCategoryCard(
          activityCategoryModel: activityCategoryModelData[index],
        );
      },
    );
  }
}
