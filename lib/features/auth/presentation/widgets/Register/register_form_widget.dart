import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/helpers/confirm_password_validator.dart';
import '../../../../../core/widgets/app_text_button.dart';
import '../../../../../core/widgets/custom_circular_progress_indicator.dart';
import '../../manager/register_cubit/register_cubit.dart';
import '../shared/email_text_field.dart';
import '../shared/password_text_field.dart';
import 'already_have_an_account.dart';
import 'name_text_field.dart';

class RegisterFormWidget extends StatefulWidget {
  const RegisterFormWidget({super.key});

  @override
  State<RegisterFormWidget> createState() => _RegisterFormWidgetState();
}

class _RegisterFormWidgetState extends State<RegisterFormWidget> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          NameTextField(nameController: _nameController),
          const SizedBox(height: 20),
          EmailTextField(emailController: _emailController),
          const SizedBox(height: 20),

          PasswordTextField(
            text: "Password",
            hintText: "Enter Your Password",
            passwordController: _passwordController,
          ),
          const SizedBox(height: 20),

          PasswordTextField(
            text: "Repeat Password",
            hintText: "Repeat Your Password",
            passwordController: _confirmPasswordController,
            validator: (value) => validateConfirmPassword(
              value: value,
              password: _passwordController.text,
            ),
          ),

          const SizedBox(height: 20),

          BlocBuilder<RegisterCubit, RegisterState>(
            builder: (context, state) {
              return IgnorePointer(
                ignoring: state is RegisterLoadingState,
                child: SizedBox(
                  width: double.infinity,
                  child: AppTextButton(
                    onPressed: () {
                      validateThenRegister(context);
                    },
                    buttonText: "Register",
                    child: state is RegisterLoadingState
                        ? const CustomCircularProgressIndicator()
                        : null,
                  ),
                ),
              );
            },
          ),
          const SizedBox(height: 20),

          const AlreadyHaveAnAccount(),
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  void validateThenRegister(BuildContext context) {
    if (formKey.currentState!.validate()) {
      context.read<RegisterCubit>().register(
        email: _emailController.text.trim(),
        name: _nameController.text.trim(),
        password: _passwordController.text,
      );
    }
  }
}
