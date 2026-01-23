import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moodly/core/extensions/context_extensions.dart';
import 'package:moodly/core/routing/routes.dart';

import '../../../../../core/theming/app_assets.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_styles.dart';

class SeeRecommendationsButton extends StatelessWidget {
  const SeeRecommendationsButton({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(Routes.recommendationsView);
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            "See Recommendations",
            style: AppStyles.extraBold15.copyWith(color: AppColors.linkGray),
          ),
          const SizedBox(width: 7),
          SvgPicture.asset(
            AppAssets.arrowLeftIosIcon,
            width: 16,
            height: 16,
            colorFilter: const ColorFilter.mode(
              AppColors.linkGray,
              BlendMode.srcIn,
            ),
          ),
        ],
      ),
    );
  }
}
