import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/theming/app_assets.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_styles.dart';

class SessionTimeWidget extends StatelessWidget {
  final String date;
  const SessionTimeWidget({super.key, required this.date});

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 6,
      children: [
        SvgPicture.asset(
          AppAssets.timeIcon,
          width: 16,
          height: 16,
          colorFilter: const ColorFilter.mode(
            AppColors.linkGray,
            BlendMode.srcIn,
          ),
        ),
        Text(
          date,
          style: AppStyles.medium14.copyWith(color: AppColors.bodyGray),
        ),
      ],
    );
  }
}
