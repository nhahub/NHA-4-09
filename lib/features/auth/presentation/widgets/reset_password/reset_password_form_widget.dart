import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/constants/constants.dart';
import '../../../../../core/helpers/confirm_password_validator.dart';
import '../../../../../core/widgets/app_text_button.dart';
import '../../../../../core/widgets/custom_circular_progress_indicator.dart';
import '../../manager/reset_password_cubit/reset_password_cubit.dart';
import '../../manager/reset_password_cubit/reset_password_state.dart';
import '../shared/password_text_field.dart';

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
            text: "New Password",
            hintText: "Enter Your New Password",
          ),
          const SizedBox(height: kAppSectionSpacing),
          PasswordTextField(
            passwordController: _confirmPasswordController,
            isPasswordObscureText: true,
            text: "Repeat Password",
            hintText: "Repeat Your Password",
            validator: (value) => validateConfirmPassword(
              value: value,
              password: _passwordController.text,
            ),
          ),
          const SizedBox(height: 20),
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
