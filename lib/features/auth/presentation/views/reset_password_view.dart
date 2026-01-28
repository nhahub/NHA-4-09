import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moodly/core/functions/confirm_dialog.dart';
import '../../../../core/theming/app_styles.dart';
import '../widgets/reset_password/reset_password_view_body.dart';
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
          confirmDialog(
            context: context,
            title: "Password Updated",
            message: "Your password has been updated successfully.Please login",
            onConfirm: () {
              context.pushReplacement(Routes.loginView);
            },
          );
        } else if (state is ResetPasswordFailureState) {
          errorDialog(context: context, message: state.message);
        }
      },
      child: Scaffold(
        appBar: AppBar(
          centerTitle: false,
          title: const Padding(
            padding: EdgeInsets.only(left: 15),
            child: Text("Reset Password", style: AppStyles.extraBold21),
          ),
        ),
        body: const ResetPasswordViewBody(),
      ),
    );
  }
}
