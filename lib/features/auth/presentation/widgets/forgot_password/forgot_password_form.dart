import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/extensions/context_extensions.dart';
import '../../../../../core/functions/confirm_dialog.dart';
import '../../manager/forgot_password_cubit/forgot_password_cubit.dart';
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
          confirmDialog(
            context: context,
            title: "Reset Link Sent",
            message:
                "We have sent reset link to your email. Please check your inbox.",
            onConfirm: () {
              context.pop();
            },
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
              const SizedBox(height: 30),
              BlocBuilder<ForgotPasswordCubit, ForgotPasswordState>(
                builder: (context, state) {
                  return IgnorePointer(
                    ignoring: state is ForgotPasswordLoadingState,
                    child: SizedBox(
                      width: double.infinity,
                      child: AppTextButton(
                        onPressed: () {
                          validateThenSendResetLink(context);
                        },
                        buttonText: "Send Reset Link",
                        child: state is ForgotPasswordLoadingState
                            ? const CustomCircularProgressIndicator()
                            : null,
                      ),
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
      emailController.clear();
    }
  }
}
