import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../../../core/constants/static.dart';
import '../../../../../core/theming/app_assets.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_styles.dart';

class SeeMoreWidget extends StatelessWidget {
  final VoidCallback onTap;
  const SeeMoreWidget({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.only(right: kAppHorizontalPadding),
        child: Row(
          children: [
            Text(
              "See more",
              style: AppStyles.extraBold15.copyWith(color: AppColors.linkGray),
            ),
            SizedBox(width: 6),
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
      ),
    );
  }
}
