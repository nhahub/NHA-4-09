import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/helpers/alpha_from_percent.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/app_assets.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/widgets/shared/category_container.dart';
import '../../data/models/recommended_food_item_model.dart';
import 'recommended_food_card_data_container.dart';

class RecommendedFoodCard extends StatelessWidget {
  final bool withpush;
  final RecommendedFoodItemModel recommendedFoodItemModel;

  const RecommendedFoodCard({
    super.key,
    required this.recommendedFoodItemModel,
    this.withpush = true,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Stack(
        children: [
          Image.asset(
            recommendedFoodItemModel.image,
            fit: BoxFit.fitWidth,
            width: double.infinity,
            frameBuilder: (context, child, frame, wasSynchronouslyLoaded) {
              if (wasSynchronouslyLoaded) return child;
              return AnimatedSwitcher(
                duration: const Duration(milliseconds: 300),
                child: frame != null
                    ? child
                    : Container(
                        width: double.infinity,
                        height: 200,
                        color: Colors.grey[300],
                      ),
              );
            },
          ),
          Padding(
            padding: const EdgeInsets.only(
              left: kAppSectionSpacing,
              top: kAppSectionSpacing,
              right: kAppSectionSpacing,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CategoryContainer(
                  categoryTitle: recommendedFoodItemModel.tags.first,
                ),
                withpush
                    ? InkWell(
                        onTap: () {
                          context.push(
                            Routes.recommendedFoodDetailsView,
                            args: recommendedFoodItemModel,
                          );
                        },
                        child: CircleAvatar(
                          backgroundColor: AppColors.buttonBlack.withAlpha(
                            alphaFromPercentage(50),
                          ),
                          radius: 15,
                          child: SvgPicture.asset(
                            AppAssets.arrowRightIosIcon,
                            width: 15,
                            colorFilter: const ColorFilter.mode(
                              Colors.white,
                              BlendMode.srcIn,
                            ),
                          ),
                        ),
                      )
                    : const SizedBox.shrink(),
              ],
            ),
          ),
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: RecommendedFoodCardDataContainer(
              title: recommendedFoodItemModel.name,
            ),
          ),
        ],
      ),
    );
  }
}
