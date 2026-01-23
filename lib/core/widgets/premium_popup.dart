import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moodly/core/constants/constants.dart';
import 'package:moodly/core/helpers/alpha_from_percent.dart';
import 'package:moodly/core/theming/app_assets.dart';
import 'package:moodly/core/theming/app_colors.dart';
import 'package:moodly/core/theming/app_styles.dart';
import 'package:moodly/core/widgets/app_text_button.dart';

class PremiumPopup extends StatelessWidget {
  final double price = 29.99;
  const PremiumPopup({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(kAppSectionSpacing),
      margin: const EdgeInsets.symmetric(horizontal: kAppSectionSpacing * 2),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(
          color: AppColors.borderButton.withAlpha(alphaFromPercentage(6)),
          width: 1,
        ),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 4),
            color: AppColors.shadow.withAlpha(alphaFromPercentage(16)),
            blurRadius: 8,
            spreadRadius: -1,
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                width: 2,
                color: AppColors.borderButton.withAlpha(alphaFromPercentage(6)),
              ),
              gradient: LinearGradient(
                colors: [AppColors.brandGreen, AppColors.lightGreen],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                stops: [0.25, 1.0],
              ),
              boxShadow: [
                BoxShadow(
                  color: AppColors.brandGreen.withAlpha(
                    alphaFromPercentage(10),
                  ),
                  offset: const Offset(0, 0),
                  blurRadius: 0,
                  spreadRadius: 2,
                ),
                BoxShadow(
                  color: Colors.white.withAlpha(alphaFromPercentage(60)),
                  offset: const Offset(0, -4),
                  blurRadius: 6,
                  spreadRadius: -4,
                ),
                BoxShadow(
                  color: AppColors.shadow.withAlpha(alphaFromPercentage(32)),
                  offset: const Offset(0, 3),
                  blurRadius: 6,
                  spreadRadius: -4,
                ),
              ],
            ),
            child: SvgPicture.asset(
              AppAssets.premiumIcon,
              width: 16,
              height: 16,
            ),
          ),
          SizedBox(height: 16),
          Text("Available with Premium", style: AppStyles.extraBold16),
          SizedBox(height: 5),
          Text(
            "Unlock advanced features and get therapy discounts, all for:",
            style: AppStyles.medium14.copyWith(color: AppColors.bodyGray),
          ),
          SizedBox(height: 12),
          Row(
            children: [
              Text("$price USD", style: AppStyles.extraBold21),
              SizedBox(width: 5),
              Text(
                "/ month",
                style: AppStyles.extraBold15.copyWith(
                  color: AppColors.bodyGray,
                ),
              ),
            ],
          ),
          SizedBox(height: kAppSectionSpacing),
          SizedBox(
            width: double.infinity,
            child: AppTextButton(
              onPressed: () {
                // Navigator.push(context, );
              },
              buttonText: "Subscribe",
            ),
          ),
        ],
      ),
    );
  }
}
