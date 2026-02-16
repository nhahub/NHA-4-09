import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moodly/core/theming/app_assets.dart';
import '../../../../../../core/theming/app_colors.dart';
import '../../../../../../core/theming/app_styles.dart';

class BenefitWidget extends StatelessWidget {
  final String benefitText;
  const BenefitWidget({super.key, required this.benefitText});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          AppAssets.checkMark,
          height: 11,
          colorFilter: const ColorFilter.mode(
            AppColors.brandGreen,
            BlendMode.srcIn,
          ),
        ),
        const SizedBox(width: 8),
        Text(benefitText, style: AppStyles.medium15),
      ],
    );
  }
}
