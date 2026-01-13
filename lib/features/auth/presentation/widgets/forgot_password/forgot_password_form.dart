import 'package:flutter/material.dart';

import '../../../../../core/widgets/app_text_button.dart';


class ForgotPasswordForm extends StatefulWidget {
  const ForgotPasswordForm({super.key});

  @override
  State<ForgotPasswordForm> createState() => _PinInputFormState();
}

class _PinInputFormState extends State<ForgotPasswordForm> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController phoneNumberController = TextEditingController();
  @override
  void dispose() {
    phoneNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            const Spacer(),
            // PhoneTextField(phoneNumberController: phoneNumberController),
            const Spacer(),
            AppTextButton(
              onPressed: () {
                validateThenVerifyCode(context);
              },
              buttonText: "Send Code",
            ),
            const Spacer(flex: 2),
          ],
        ),
      ),
    );
  }

  void validateThenVerifyCode(BuildContext context) {
    if (formKey.currentState!.validate()) {
      // context.push(Routes.otpVerificationView, extra: true);
    }
  }
}
