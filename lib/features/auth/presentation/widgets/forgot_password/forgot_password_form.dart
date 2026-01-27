import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../manager/forgot_password_cubit/forgot_password_cubit.dart';
import '../../../../../core/functions/build_snack_bar.dart';
import '../../../../../core/functions/error_dialog.dart';
import '../../../../../core/widgets/app_text_button.dart';
import '../../../../../core/widgets/custom_circular_progress_indicator.dart';
import '../shared/email_text_field.dart';

class ForgotPasswordForm extends StatefulWidget {
  const ForgotPasswordForm({super.key});

  @override
  State<ForgotPasswordForm> createState() => _ForgotPasswordFormState();
}

class _ForgotPasswordFormState extends State<ForgotPasswordForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<ForgotPasswordCubit, ForgotPasswordState>(
      listener: (context, state) {
        if (state is ForgotPasswordSuccessState) {
          successSnackBar(
            context: context,
            message: "Reset link sent to your email",
          );
        } else if (state is ForgotPasswordFailureState) {
          errorDialog(context: context, message: state.message);
        }
      },
      child: Form(
        key: formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              EmailTextField(emailController: emailController),
              const SizedBox(height: 16),
              BlocBuilder<ForgotPasswordCubit, ForgotPasswordState>(
                builder: (context, state) {
                  return IgnorePointer(
                    ignoring: state is ForgotPasswordLoadingState,
                    child: AppTextButton(
                      onPressed: () {
                        validateThenSendResetLink(context);
                      },
                      buttonText: "Send Reset Link",
                      child: state is ForgotPasswordLoadingState
                          ? const CustomCircularProgressIndicator()
                          : null,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  void validateThenSendResetLink(BuildContext context) {
    if (formKey.currentState!.validate()) {
      context.read<ForgotPasswordCubit>().forgotPassword(
        emailController.text.trim(),
      );
    }
  }
}
