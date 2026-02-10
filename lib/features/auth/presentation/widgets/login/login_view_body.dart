import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import '../../../../onboarding/data/Services/onboarding_local_service.dart';
import '../../../../../core/extensions/context_extensions.dart';
import '../../../../../core/functions/build_snack_bar.dart';
import '../../../../../core/functions/error_dialog.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../../core/theming/app_assets.dart';
import '../../manager/login_cubit/login_cubit.dart';
import 'login_form_widget.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: BlocListener<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is LoginSuccessState) {
              onLoginSuccess(context);
            } else if (state is LoginFailureState) {
              errorDialog(context: context, message: state.message);
            }
          },
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height * 0.8,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: [
                  const SizedBox(height: 50),
                  SvgPicture.asset(AppAssets.moodlyLogo, width: 90, height: 90),
                  const SizedBox(height: 80),
                  const LoginFormWidget(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void onLoginSuccess(BuildContext context) {
    successSnackBar(context: context, message: "Login Success");
    final bool hasSeenOnboarding = OnboardingLocalService.hasSeenOnboarding();
    if (hasSeenOnboarding) {
      context.pushAndRemoveUntil(Routes.mainView);
    } else {
      context.pushAndRemoveUntil(Routes.onboardingView);
    }
  }
}
