import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moodly/core/widgets/custom_circular_progress_indicator.dart';
import '../../../../../core/widgets/app_text_button.dart';
import '../../manager/auth_cubit/auth_cubit.dart';
import '../shared/email_text_field.dart';
import '../shared/password_text_field.dart';
import 'create_an_account.dart';
import 'forgot_password.dart';

class LoginFormWidget extends StatefulWidget {
  const LoginFormWidget({super.key});

  @override
  State<LoginFormWidget> createState() => _LoginFormWidgetState();
}

class _LoginFormWidgetState extends State<LoginFormWidget> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Form(
        key: formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            EmailTextField(emailController: emailController),
            const SizedBox(height: 20),
            PasswordTextField(
              text: "Enter Your Password",
              passwordController: passwordController,
            ),
            const ForgotPassword(),
            const SizedBox(height: 20),
            BlocBuilder<AuthCubit, AuthState>(
              builder: (context, state) {
                return IgnorePointer(
                  ignoring: state is AuthLoading,
                  child: SizedBox(
                    width: double.infinity,
                    child: AppTextButton(
                      onPressed: () {
                        validateThenLogin(context);
                      },
                      buttonText: "Login",
                      child: state is AuthLoading
                          ? const CustomCircularProgressIndicator()
                          : null,
                    ),
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
            const CreateAnAccount(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  void validateThenLogin(BuildContext context) {
    if (formKey.currentState!.validate()) {
      context.read<AuthCubit>().login(
        email: emailController.text,
        password: passwordController.text,
      );
    }
  }
}
