import 'package:flutter/material.dart';

import '../../../../core/helpers/alpha_from_percent.dart';
import '../../../../core/theming/app_styles.dart';

class RecommendedFoodCardDataContainer extends StatelessWidget {
  final String title;
  const RecommendedFoodCardDataContainer({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      alignment: Alignment.bottomLeft,
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
            bottomLeft: Radius.circular(16),
            bottomRight: Radius.circular(16),
          ),
          child: Container(
            height: 110,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  Colors.black.withAlpha(alphaFromPercentage(90)),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 16, bottom: 25),
          child: Text(
            title,
            softWrap: true,
            style: AppStyles.extraBold17WithShadow.copyWith(
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
