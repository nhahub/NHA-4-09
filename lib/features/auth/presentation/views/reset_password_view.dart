import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moodly/core/functions/build_snack_bar.dart';
import 'package:moodly/features/auth/presentation/widgets/reset_password/reset_password_view_body.dart';
import 'package:moodly/features/home/presentation/widgets/shared/back_button_appbar.dart';
import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/functions/error_dialog.dart';
import '../../../../core/routing/routes.dart';
import '../manager/reset_password_cubit/reset_password_cubit.dart';
import '../manager/reset_password_cubit/reset_password_state.dart';

class ResetPasswordView extends StatelessWidget {
  const ResetPasswordView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<ResetPasswordCubit, ResetPasswordState>(
      listener: (context, state) {
        if (state is ResetPasswordSuccessState) {
          successSnackBar(
            context: context,
            message: "Password updated successfully",
          );
          context.pushReplacement(Routes.loginView);
        } else if (state is ResetPasswordFailureState) {
          errorDialog(context: context, message: state.message);
        }
      },
      child: const Scaffold(
        appBar: BackButtonAppbar(title: "Reset Password"),
        body: ResetPasswordViewBody(),
      ),
    );
  }
}
