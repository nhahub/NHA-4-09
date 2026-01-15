import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/theming/app_assets.dart';
import '../../../../../core/theming/app_styles.dart';
import '../../../../../core/widgets/app_text_button.dart';

class LoginWithFacebookButton extends StatelessWidget {
  const LoginWithFacebookButton({super.key});

  @override
  Widget build(BuildContext context) {
    return AppTextButton(
      withGradient: false,
      shadowColor: const Color(0xff07112E).withAlpha((255 * 0.06).toInt()),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(
            AppAssets.facebookIcon,
            width: 20,
            height: 20,
            colorFilter: const ColorFilter.mode(Colors.blue, BlendMode.srcIn),
          ),
          const SizedBox(width: 16),
          Text(
            'Continue with Facebook',
            style: AppStyles.extraBold15.copyWith(color: Colors.black),
          ),
        ],
      ),
      onPressed: () {},
    );
  }
}
