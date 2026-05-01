import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/extensions/context_extensions.dart';
import '../../../../../core/helpers/alpha_from_percent.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../../core/widgets/shared/category_container.dart';
import '../../../data/models/activity/activity_category_model.dart';
import '../../manager/activities_cubit/activities_cubit.dart';

class ActivityCategoryCard extends StatelessWidget {
  final ActivityCategoryModel activityCategoryModel;

  const ActivityCategoryCard({super.key, required this.activityCategoryModel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        final ActivitiesCubit cubit = context.read<ActivitiesCubit>();
        final String categoryId = activityCategoryModel.id;
        final String categoryName = activityCategoryModel.name;
        context.push(
          Routes.activitiesView,
          args: {
            'categoryId': categoryId,
            'categoryName': categoryName,
            'cubit': cubit,
          },
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
                height: 170,
                imageUrl: activityCategoryModel.imageUrl,
                fadeInDuration: const Duration(milliseconds: 200),
                placeholder: (context, url) => Container(
                  height: 170,
                  color: Colors.grey.shade300,
                  child: const Center(
                    child: CircularProgressIndicator(strokeWidth: 2),
                  ),
                ),

                errorWidget: (context, url, error) => Container(
                  height: 170,
                  color: Colors.grey,
                  child: const Icon(Icons.broken_image),
                ),

                imageBuilder: (context, imageProvider) => Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(image: imageProvider),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
