import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';

import '../../../../core/theming/app_colors.dart';
// import 'page_view_item.dart';

class CustomDotsIndicator extends StatelessWidget {
  const CustomDotsIndicator({
    super.key,
    // required this.pages,
    required this.currentPageIndex,
    this.unactivesize,
    this.activesize,
    this.spacing,
  });

  // final List<PageViewItem> pages;
  final int currentPageIndex;
  final Size? activesize;
  final Size? unactivesize;
  final double? spacing;

  @override
  Widget build(BuildContext context) {
    return DotsIndicator(
      dotsCount: 4,
      position: currentPageIndex.toDouble(),
      decorator: DotsDecorator(
        spacing: EdgeInsets.symmetric(horizontal: spacing ?? 3),
        color: AppColors.borderButton.withAlpha((255 * 0.1).toInt()),
        activeColor: AppColors.brandGreen,
        shape: const StadiumBorder(),
        size: unactivesize ?? const Size(50, 5),
        activeSize: activesize ?? const Size(50, 5),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      animate: true,
    );
  }
}
