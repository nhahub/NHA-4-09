import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moodly/core/widgets/app_text_button.dart';
import 'package:moodly/core/widgets/custom_circular_progress_indicator.dart';
import 'package:moodly/features/auth/presentation/manager/reset_password_cubit/reset_password_cubit.dart';
import 'package:moodly/features/auth/presentation/manager/reset_password_cubit/reset_password_state.dart';
import 'package:moodly/features/auth/presentation/widgets/shared/password_text_field.dart';

class ResetPasswordFormWidget extends StatefulWidget {
  const ResetPasswordFormWidget({super.key});

  @override
  State<ResetPasswordFormWidget> createState() =>
      _ResetPasswordFormWidgetState();
}

class _ResetPasswordFormWidgetState extends State<ResetPasswordFormWidget> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          PasswordTextField(
            passwordController: _passwordController,
            isPasswordObscureText: true,
          ),
          const SizedBox(height: 16),
          PasswordTextField(
            passwordController: _confirmPasswordController,
            isPasswordObscureText: true,
          ),
          const SizedBox(height: 24),
          BlocBuilder<ResetPasswordCubit, ResetPasswordState>(
            builder: (context, state) {
              return IgnorePointer(
                ignoring: state is ResetPasswordLoadingState,
                child: SizedBox(
                  width: double.infinity,
                  child: AppTextButton(
                    onPressed: () {
                      validateThenResetPassword(context);
                    },
                    buttonText: "Update Password",
                    child: state is ResetPasswordLoadingState
                        ? const CustomCircularProgressIndicator()
                        : null,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  void validateThenResetPassword(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      context.read<ResetPasswordCubit>().resetPassword(
        newPassword: _passwordController.text,
      );
    }
  }
}
