import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moodly/core/functions/build_snack_bar.dart';
import 'package:moodly/core/helpers/logger.dart';
import '../../../../../core/extensions/context_extensions.dart';
import '../../../../../core/functions/error_dialog.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../../core/theming/app_assets.dart';
import '../../manager/auth_cubit/auth_cubit.dart';
import 'login_form_widget.dart';

class LoginViewBody extends StatelessWidget {
  const LoginViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: BlocListener<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthSuccess) {
              successSnackBar(context: context, message: "Login Success");
              context.pushAndRemoveUntil(Routes.mainView);
            } else if (state is AuthFailure) {
              errorDialog(context: context, message: state.message);
              Logger.log(state.message);
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
}
