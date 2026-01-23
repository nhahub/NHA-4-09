import 'package:flutter/material.dart';
import 'package:flutter_inner_shadow/flutter_inner_shadow.dart';

import '../../../../../core/helpers/alpha_from_percent.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_styles.dart';
import '../../../data/models/category_enum.dart';

class ActiveCategoryButton extends StatelessWidget {
  const ActiveCategoryButton({
    super.key,
    required this.category,
    required this.onTap,
  });
  final VoidCallback onTap;
  final Category category;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: InnerShadow(
        shadows: [
          Shadow(
            color: Colors.white.withAlpha(alphaFromPercentage(60)),
            offset: const Offset(0, -3.34),
            blurRadius: 1,
          ),
        ],
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          decoration: BoxDecoration(
            color: AppColors.brandGreen,
            borderRadius: BorderRadius.circular(333),
            border: Border.all(color: const Color(0xff5dbf76), width: 4),
            boxShadow: const [
              // BoxShadow(
              //   color: AppColors.shadow.withAlpha(alphaFromPercentage(10)),
              //   offset: const Offset(0, 0.67),
              //   blurRadius: 0.33,
              //   spreadRadius: 0,
              // ),
              // BoxShadow(
              //   color: AppColors.shadow.withAlpha(alphaFromPercentage(32)),
              //   offset: const Offset(0, 1.34),
              //   blurRadius: 4.01,
              //   spreadRadius: 0,
              // ),
              // BoxShadow(
              //   color: AppColors.brandGreen,
              //   offset: const Offset(0, 0),
              //   blurRadius: 0,
              //   spreadRadius: 1.34,
              // ),
              // BoxShadow(
              //   color:Colors.white.withAlpha(alphaFromPercentage(60)),
              //   offset: const Offset(0, 1.34),
              //   blurRadius: 1,
              //   spreadRadius: 0,
              // ),
            ],
          ),
          child: Center(
            child: Text(
              category.title,
              style: AppStyles.extraBold14.copyWith(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }
}
