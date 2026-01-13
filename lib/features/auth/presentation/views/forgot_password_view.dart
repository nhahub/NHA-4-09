import 'package:flutter/material.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_styles.dart';
import '../widgets/forgot_password/forgot_password_form.dart';

class ForgotPasswordView extends StatelessWidget {
  const ForgotPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              const SizedBox(height: 80),
              Align(
                alignment: AlignmentDirectional.centerStart,
                child: Text(
                  "Forget Password",
                  style: AppStyles.p.copyWith(color: AppColors.brandGreen),
                ),
              ),
              const SizedBox(height: 15),
              const Expanded(child: ForgotPasswordForm()),
            ],
          ),
        ),
      ),
    );
  }
}
