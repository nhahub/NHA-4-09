import 'package:flutter/material.dart';
import 'package:moodly/core/constants/constants.dart';
import 'package:moodly/core/extensions/context_extensions.dart';
import 'package:moodly/core/routing/routes.dart';
import 'package:moodly/core/theming/app_assets.dart';
import 'package:moodly/core/theming/app_colors.dart';
import 'package:moodly/core/theming/app_styles.dart';
import 'package:moodly/core/widgets/app_text_button.dart';

class RecommendedFoodCard extends StatelessWidget {
  const RecommendedFoodCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: kAppHorizontalPadding),
      width: double.infinity,
      clipBehavior: Clip.hardEdge,
      decoration: BoxDecoration(
        color: AppColors.bgFill,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Stack(
        alignment: Alignment.centerRight,
        children: [
          Transform.translate(
            offset: const Offset(130, 0),
            child: Transform.rotate(
              angle: 1,
              child: Container(
                width: 700,
                height: 160,
                color: AppColors.lightGreen,
              ),
            ),
          ),
          Transform.translate(
            offset: const Offset(-30, 40),
            child: Transform.scale(
              scale: 1.4,
              child: Image.asset(
                AppAssets.meal,
                height: 180,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 14),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              spacing: 20,
              children: [
                SizedBox(
                  width: 140,
                  child: Text(
                    'Discover the perfect food for your mood',
                    style: AppStyles.medium14.copyWith(
                      color: AppColors.linkGray,
                    ),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: AppTextButton(
                    horizontalPadding: 20,
                    verticalPadding: 10,
                    borderRadius: 12,
                    onPressed: () {
                      context.push(Routes.mealsRecommendationsView);
                    },
                    child: Text(
                      'Explore now',
                      style: AppStyles.extraBold12.copyWith(
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
