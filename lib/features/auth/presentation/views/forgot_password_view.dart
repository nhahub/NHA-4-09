import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/theming/app_assets.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_styles.dart';
import '../../../home/presentation/widgets/shared/back_button_appbar.dart';
import '../widgets/forgot_password/forgot_password_form.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BackButtonAppbar(title: "Forget Password"),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: kAppHorizontalPadding,
          ),
          child: Column(
            children: [
              const Spacer(),
              SvgPicture.asset(
                AppAssets.forgotPasswordIcon,
                width: 100,
                height: 100,
                colorFilter: const ColorFilter.mode(
                  AppColors.brandGreen,
                  BlendMode.srcIn,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                "Forgot password",
                style: AppStyles.extraBold21,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              const Text(
                "Please enter your email address to reset your password",
                style: AppStyles.medium15,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              const ForgotPasswordForm(),
              const Spacer(flex: 3),
            ],
          ),
        ),
      ),
    );
  }
}
