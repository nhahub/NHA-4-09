import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../../../../../core/routing/routes.dart';
import '../../../../../core/theming/app_colors.dart';

class TermsAndConditions extends StatelessWidget {
  const TermsAndConditions({super.key});

  @override
  Widget build(BuildContext context) {
    return Text.rich(
      textAlign: TextAlign.center,
      TextSpan(
        text: "By continuing, you agree to Zenspun's ",
        style: const TextStyle(color: AppColors.bodyGray, fontSize: 14),
        children: [
          TextSpan(
            text: "Terms & Conditions",
            style: const TextStyle(
              fontSize: 14,
              color: Color(0xff707480),
              decoration: TextDecoration.underline,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.pushNamed(context, Routes.termsAndConditionsView);
              },
          ),
          const TextSpan(text: " and "),
          TextSpan(
            text: "Privacy Policy",
            style: const TextStyle(
              color: Color(0xff707480),
              decoration: TextDecoration.underline,
            ),
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                Navigator.pushNamed(context, Routes.privacyPolicyView);
              },
          ),
          const TextSpan(text: "."),
        ],
      ),
    );
  }
}
