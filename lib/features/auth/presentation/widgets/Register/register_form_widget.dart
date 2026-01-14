import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'already_have_an_account.dart';
import '../shared/email_text_field.dart';
import '../shared/password_text_field.dart';
import '../../../../../core/widgets/app_text_button.dart';

class RegisterFormWidget extends StatefulWidget {
  const RegisterFormWidget({super.key});

  @override
  State<RegisterFormWidget> createState() => _RegisterFormWidgetState();
}

class _RegisterFormWidgetState extends State<RegisterFormWidget> {
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
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: AppTextButton(
                onPressed: () {
                  validateThenRegister(context);
                },
                buttonText: "Register",
              ),
            ),
            const SizedBox(height: 20),
            const AlreadyHaveAnAccount(),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  void validateThenRegister(BuildContext context) {
    if (formKey.currentState!.validate()) {
      context.pop();
    }
  }
}
