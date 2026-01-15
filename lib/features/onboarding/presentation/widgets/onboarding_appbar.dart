import 'package:flutter/material.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/theming/app_assets.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_styles.dart';
import '../../../../core/widgets/custom_circle_button.dart';
import 'custom_dots_indicator.dart';

class OnboardingAppbar extends StatelessWidget {
  final int currentPageIndex;
  final int questionsLength;
  final void Function() previousPage;

  const OnboardingAppbar({
    super.key,
    required this.currentPageIndex,
    required this.questionsLength,
    required this.previousPage,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kAppHorizontalPadding),
      child: Row(
        mainAxisAlignment: currentPageIndex == 0
            ? MainAxisAlignment.center
            : MainAxisAlignment.spaceBetween,
        children: [
          if (currentPageIndex != 0)
            CustomCircleButton(
              onTap: previousPage,
              icon: AppAssets.arrowLeftIcon,
            ),
          CustomDotsIndicator(currentPageIndex: currentPageIndex),
          if (currentPageIndex != 0)
            Text(
              "${currentPageIndex + 1}/${questionsLength + 1}",
              style: AppStyles.medium15.copyWith(color: AppColors.bodyGray),
            ),
        ],
      ),
    );
  }
}
