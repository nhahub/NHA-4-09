import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_styles.dart';
import '../../../data/models/activity/activity_model.dart';
import 'activity_timer.dart';

class ActivityItem extends StatelessWidget {
  final ActivityModel activity;

  const ActivityItem({super.key, required this.activity});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 10),
          SvgPicture.network(activity.imageUrl, width: 240),
          const SizedBox(height: 35),
          Text(
            activity.title,
            style: AppStyles.extraBold27.copyWith(
              color: AppColors.brandGreen,
            ),
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
