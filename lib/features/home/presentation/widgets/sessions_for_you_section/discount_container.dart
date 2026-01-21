import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moodly/core/theming/app_assets.dart';
import 'package:moodly/core/theming/app_colors.dart';
import 'package:moodly/core/theming/app_styles.dart';
import 'package:moodly/features/home/data/models/sessions_for_you_model.dart';

class DiscountContainer extends StatelessWidget {
  final bool isPaidUser = true;
  const DiscountContainer({super.key, required this.sessionsForYouModel});

  final SessionsForYouModel sessionsForYouModel;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 5),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(8)),
        gradient: LinearGradient(
          colors: [AppColors.lightGreen, AppColors.brandGreen],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          stops: [0.25, 1.0],
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          if (isPaidUser == false) ...[
            Text(
              "-${sessionsForYouModel.discount}%",
              style: AppStyles.extraBold15.copyWith(color: Colors.white),
            ),
            const SizedBox(width: 5),
          ],
          SvgPicture.asset(AppAssets.premiumIcon, width: 12),
        ],
      ),
    );
  }
}
