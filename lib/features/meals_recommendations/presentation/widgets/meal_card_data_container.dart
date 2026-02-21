import 'dart:ui';
import 'package:flutter/material.dart';

import '../../../../core/helpers/alpha_from_percent.dart';
import '../../../../core/theming/app_styles.dart';

class MealCardDataContainer extends StatelessWidget {
  final String title;
  const MealCardDataContainer({super.key, required this.title});

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
          child: BackdropFilter(
            filter: ImageFilter.blur(
              sigmaX: 3.0,
              sigmaY: 10.0,
              tileMode: TileMode.decal,
            ),
            child: Opacity(
              opacity: 0.0,
              child: Text(
                title,
                style: AppStyles.extraBold15WithShadow.copyWith(
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ),
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
            style: AppStyles.extraBold15WithShadow.copyWith(
              color: Colors.white,
            ),
          ),
        ),
      ],
    );
  }
}
