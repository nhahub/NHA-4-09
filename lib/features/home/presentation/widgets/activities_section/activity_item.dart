import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:skeletonizer/skeletonizer.dart';

import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_styles.dart';
import '../../../data/models/activity/activity_model.dart';
import 'activity_timer.dart';

class ActivityItem extends StatelessWidget {
  final ActivityModel activity;
  final bool isLoading;

  const ActivityItem({
    super.key,
    required this.activity,
    required this.isLoading,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 10),
          CachedNetworkImage(
            imageUrl: activity.imageUrl,
            height: 254,
            width: 242,
            fadeInDuration: const Duration(milliseconds: 200),
            placeholder: (context, url) => Skeletonizer(
              containersColor: Colors.grey.shade50,
              enabled: isLoading,
              child: Container(color: Colors.grey.shade50),
            ),

            errorWidget: (context, url, error) => Container(
              height: 254,
              color: Colors.grey,
              child: const Icon(Icons.broken_image),
            ),

            imageBuilder: (context, imageProvider) => Container(
              height: 254,
              width: 242,
              decoration: BoxDecoration(
                image: DecorationImage(image: imageProvider),
              ),
            ),
          ),
          const SizedBox(height: 35),
          Text(
            activity.title,
            style: AppStyles.extraBold27.copyWith(color: AppColors.brandGreen),
          ),
          const SizedBox(height: 15),
          Text(
            activity.description,
            style: AppStyles.medium20,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 30),
          ActivityTimer(minutes: activity.duration),
        ],
      ),
    );
  }
}
