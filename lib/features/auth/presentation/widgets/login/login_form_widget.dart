import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/routing/routes.dart';
import '../../../../../core/widgets/app_text_button.dart';
import 'create_an_account.dart';
import 'email_text_field.dart';
import 'forgot_password.dart';
import 'password_text_field.dart';

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
    return Form(
      key: formKey,
      child: Expanded(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            EmailTextField(emailController: emailController),
            const SizedBox(height: 20),
            PasswordTextField(passwordController: passwordController),
            const ForgotPassword(),
            const SizedBox(height: 20),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: AppTextButton(
                onPressed: () {
                  validateThenLogin(context);
                },
                buttonText: "Login",
              ),
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
      GoRouter.of(context).pushReplacement(Routes.homeView);
    }
  }
}
