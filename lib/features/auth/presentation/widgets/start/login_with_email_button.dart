import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/extensions/context_extensions.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../../core/theming/app_assets.dart';
import '../../../../../core/theming/app_styles.dart';
import '../../../../../core/widgets/app_text_button.dart';

class LoginWithEmailButton extends StatelessWidget {
  const LoginWithEmailButton({super.key});

  @override
  Widget build(BuildContext context) {
    return AppTextButton(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(AppAssets.emailIcon, width: 27),
          const SizedBox(width: 10),
          Text(
            'Log in with email',
            style: AppStyles.extraBold15.copyWith(
              color: Colors.white,
              shadows: [
                Shadow(
                  color: const Color(
                    0xff0B1324,
                  ).withAlpha((255 * 0.24).toInt()),
                  offset: const Offset(0, 2),
                  blurRadius: 4,
                ),
              ],
            ),
          ),
        ],
      ),
      onPressed: () {
        context.pushReplacement(Routes.loginView);
      },
    );
  }
}
