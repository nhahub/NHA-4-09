import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moodly/core/constants/constants.dart';
import '../../../../../core/theming/app_assets.dart';
import '../../../../../core/theming/app_colors.dart';
import 'reset_password_form_widget.dart';

class ResetPasswordViewBody extends StatelessWidget {
  const ResetPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: kAppHorizontalPadding,
        vertical: kAppVerticalPadding,
      ),
      child: Column(
        children: [
          const Spacer(),
          SvgPicture.asset(
            AppAssets.resetpasswordIcon,
            width: 100,
            height: 100,
            colorFilter: const ColorFilter.mode(
              AppColors.brandGreen,
              BlendMode.srcIn,
            ),
          ),
          const Spacer(),
          const ResetPasswordFormWidget(),
          const Spacer(flex: 5),
        ],
      ),
    );
  }
}
