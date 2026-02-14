import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../../core/extensions/context_extensions.dart';
import '../../../../../core/functions/build_snack_bar.dart';
import '../../../../../core/functions/error_dialog.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../../core/theming/app_assets.dart';
import '../../../../../core/theming/app_styles.dart';
import '../../../../../core/widgets/app_text_button.dart';
import '../../../../onboarding/data/Services/onboarding_local_service.dart';
import '../../manager/login_cubit/login_cubit.dart';

class LoginWithGoogleButton extends StatelessWidget {
  const LoginWithGoogleButton({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginState>(
      listener: (context, state) {
        if (state is LoginSuccessState) {
          onLoginSuccess(context, isOldUser: state.isOldUser);
        } else if (state is LoginFailureState) {
          errorDialog(context: context, message: state.message);
        }
      },
      child: AppTextButton(
        withGradient: false,
        shadowColor: const Color(0xff07112E).withAlpha((255 * 0.06).toInt()),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(AppAssets.googleIcon, width: 20, height: 20),
            const SizedBox(width: 16),
            Text(
              'Continue with Google',
              style: AppStyles.extraBold15.copyWith(color: Colors.black),
            ),
          ],
        ),
        onPressed: () {
          context.read<LoginCubit>().loginWithGoogle();
        },
      ),
    );
  }

  void onLoginSuccess(BuildContext context, {required bool? isOldUser}) {
    successSnackBar(context: context, message: "Login Success");
    final bool hasSeenOnboarding = OnboardingLocalService.hasSeenOnboarding();
    if (hasSeenOnboarding) {
      context.pushAndRemoveUntil(Routes.mainView);
    } else if (isOldUser == true) {
      OnboardingLocalService.setSeenOnboarding();
      context.pushAndRemoveUntil(Routes.mainView);
    } else {
      context.pushAndRemoveUntil(Routes.onboardingView);
    }
  }
}
