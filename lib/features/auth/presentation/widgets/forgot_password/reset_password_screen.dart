import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moodly/core/routing/routes.dart';
import 'package:moodly/core/widgets/app_text_button.dart';
import 'package:moodly/features/auth/presentation/cubit/reset_password_cubit.dart';
import 'package:moodly/features/auth/presentation/cubit/reset_password_state.dart';
import 'package:moodly/features/auth/presentation/widgets/shared/password_text_field.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
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
    return BlocProvider(
      create: (_) => ResetPasswordCubit(),
      child: BlocListener<ResetPasswordCubit, ResetPasswordState>(
        listener: (context, state) {
          if (state is ResetPasswordSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Password updated successfully')),
            );
            Navigator.of(context).pushReplacementNamed(Routes.loginView);
          } else if (state is ResetPasswordFailure) {
            ScaffoldMessenger.of(
              context,
            ).showSnackBar(SnackBar(content: Text(state.message)));
          }
        },
        child: Scaffold(
          appBar: AppBar(
            title: const Text('Reset Password'),
            centerTitle: true,
          ),
          body: Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  PasswordTextField(
                    passwordController: _passwordController,
                    isPasswordObscureText: true,
                  ),

                  // EmailTextField(
                  //   controller: _passwordController,
                  //   obscureText: true,
                  //   decoration: const InputDecoration(
                  //     labelText: 'New Password',
                  //   ),
                  //   validator: (value) {
                  //     if (value == null || value.length < 8) {
                  //       return 'Password must be at least 8 characters';
                  //     }
                  //     return null;
                  //   },
                  // ),
                  const SizedBox(height: 16),
                  PasswordTextField(
                    passwordController: _confirmPasswordController,
                    isPasswordObscureText: true,
                  ),

                  // TextFormField(
                  //    obscureText: true,
                  //   decoration: const InputDecoration(
                  //     labelText: 'Confirm Password',
                  //   ),
                  //   validator: (value) {
                  //     if (value != _passwordController.text) {
                  //       return 'Passwords do not match';
                  //     }
                  //     return null;
                  //   },
                  // ),
                  const SizedBox(height: 24),

                  BlocBuilder<ResetPasswordCubit, ResetPasswordState>(
                    builder: (context, state) {
                      final isLoading = state is ResetPasswordLoading;

                      return SizedBox(
                        width: double.infinity,
                        child: AppTextButton(
                          onPressed: updatePassword(isLoading)
                              ? null
                              : () {
                                  if (!_formKey.currentState!.validate()) {
                                    return;
                                  }

                                  context
                                      .read<ResetPasswordCubit>()
                                      .resetPassword(
                                        _passwordController.text.trim(),
                                      );
                                },
                          buttonText: isLoading
                              ? 'Updating...'
                              : 'Update Password',
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  bool updatePassword(bool isLoading) => isLoading;
}
