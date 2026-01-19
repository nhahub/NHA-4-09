import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
 import 'package:moodly/core/widgets/app_text_button.dart';
import 'package:moodly/features/auth/presentation/cubit/authatcation_cubit.dart';
import 'package:moodly/features/auth/presentation/cubit/authatcation_state.dart';
import 'package:moodly/features/auth/presentation/widgets/shared/email_text_field.dart';

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
    return BlocListener<AuthatcationCubit, AuthatcationState>(
      listener: (context, state) {
        if (state is ForgotPasswordSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Reset password link sent to your email'),
            ),
          );
          //  Navigator.pushNamed(context, Routes.resetPasswordView);
        } else if (state is AuthFailure) {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text(state.message)));
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

                  context.read<AuthatcationCubit>().forgotPassword(
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
