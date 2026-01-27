import 'package:flutter/material.dart';
import 'package:moodly/features/auth/presentation/widgets/reset_password/reset_password_form_widget.dart';

class ResetPasswordViewBody extends StatelessWidget {
  const ResetPasswordViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16),
      child: ResetPasswordFormWidget(),
    );
  }
}
