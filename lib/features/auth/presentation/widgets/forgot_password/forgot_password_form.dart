import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/helpers/snackbar_service.dart';
import '../../../../../core/widgets/app_text_button.dart';
import '../../manager/auth_cubit/auth_cubit.dart';
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
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is ForgotPasswordSuccess) {
          CustomSnackbar.show(context, "Reset link sent to your email");
        } else if (state is AuthFailure) {
          CustomSnackbar.show(context, state.message, isError: true);
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
              AppTextButton(
                onPressed: () {
                  if (!formKey.currentState!.validate()) return;

                  context.read<AuthCubit>().forgotPassword(
                    emailController.text.trim(),
                  );
                },
                buttonText: "Send Reset Link",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
