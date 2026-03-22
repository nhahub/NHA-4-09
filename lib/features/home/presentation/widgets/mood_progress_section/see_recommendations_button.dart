import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../../core/extensions/context_extensions.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../../core/theming/app_assets.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_styles.dart';
import '../../../../mood/data/models/recommendation_model.dart';

class SeeRecommendationsButton extends StatelessWidget {
  final RecommendationModel recommendationModel;

  const SeeRecommendationsButton({
    super.key,
    required this.recommendationModel,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(Routes.recommendationsView, args: recommendationModel);
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
            AppAssets.arrowRightIosIcon,
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
