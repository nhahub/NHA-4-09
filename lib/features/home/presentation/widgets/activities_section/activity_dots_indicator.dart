import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

import '../../../../../core/theming/app_colors.dart';
import 'activities_page_view.dart';

class ActivityDotsIndicator extends StatelessWidget {
  final ActivitiesPageView widget;
  final int currentIndex;
  const ActivityDotsIndicator({
    super.key,
    required this.widget,
    required this.currentIndex,
  });

  @override
  Widget build(BuildContext context) {
    return DotsIndicator(
      dotsCount: widget.activities.length,
      position: currentIndex.toDouble(),
      decorator: DotsDecorator(
        spacing: const EdgeInsets.symmetric(horizontal: 2),
        color: AppColors.borderButton.withAlpha((255 * 0.1).toInt()),
        activeColor: AppColors.brandGreen,
        shape: const StadiumBorder(),
        size: const Size(8, 8),
        activeSize: const Size(20, 8),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      animate: true,
    );
  }
}
