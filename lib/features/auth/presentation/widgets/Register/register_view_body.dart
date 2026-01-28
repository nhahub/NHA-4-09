import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:moodly/core/functions/confirm_dialog.dart';
import '../../manager/register_cubit/register_cubit.dart';
import '../../../../../core/extensions/context_extensions.dart';
import '../../../../../core/functions/error_dialog.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../../core/theming/app_assets.dart';
import 'register_form_widget.dart';

class RegisterViewBody extends StatelessWidget {
  const RegisterViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: BlocConsumer<RegisterCubit, RegisterState>(
          listener: (context, state) {
            if (state is RegisterSuccessState) {
              confirmDialog(
                context: context,
                title: "Verify Your Email",
                message:
                    " We have sent verification link to your email.Please check your inbox.",
                onConfirm: () {
                  context.pushAndRemoveUntil(Routes.loginView);
                },
              );
            } else if (state is RegisterFailureState) {
              errorDialog(context: context, message: state.message);
            }
          },
          builder: (context, state) {
            return SingleChildScrollView(
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  minHeight: MediaQuery.of(context).size.height * 0.8,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(height: 50),
                    SvgPicture.asset(
                      AppAssets.moodlyLogo,
                      width: 90,
                      height: 90,
                    ),
                    const SizedBox(height: 80),
                    const RegisterFormWidget(),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
//hazemhamdy135@gamil.com
//Ahmed@1215