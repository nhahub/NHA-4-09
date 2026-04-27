import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moodly/core/helpers/alpha_from_percent.dart';
import 'package:moodly/features/home/data/models/activity/activity_category_model.dart';
import '../../../../../core/extensions/context_extensions.dart';
import '../../../../../core/routing/routes.dart';
import '../../manager/activities_cubit/activities_cubit.dart';
import '../../../../../core/widgets/shared/category_container.dart';

class ActivityCategoryCard extends StatelessWidget {
  final ActivityCategoryModel activityCategoryModel;

  const ActivityCategoryCard({super.key, required this.activityCategoryModel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final cubit = context.read<ActivitiesCubit>();
        final categoryId = activityCategoryModel.id;
        context.push(
          Routes.activitiesView,
          args: {'categoryId': categoryId, 'cubit': cubit},
        );
      },
      child: Container(
        width: 284.52,
        decoration: BoxDecoration(
          color: const Color(0xffCDD8B7).withAlpha(alphaFromPercentage(38)),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(22),
              child: CategoryContainer(
                categoryTitle: activityCategoryModel.name,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 30),
              child: CachedNetworkImage(
                imageUrl: activityCategoryModel.imageUrl,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
