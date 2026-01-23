import 'package:flutter/material.dart';
import 'package:moodly/core/extensions/context_extensions.dart';

import '../../../../../core/routing/routes.dart';
import '../../../../../core/theming/app_styles.dart';
import '../../../../../core/widgets/app_text_button.dart';
import 'choose_payment_type.dart';

class SubscribeSection extends StatelessWidget {
  const SubscribeSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const ChoosePaymentType(),
        const SizedBox(height: 20),
        SizedBox(
          width: double.infinity,
          child: AppTextButton(
            backgroundColor: Colors.white,
            withGradient: false,
            onPressed: () {
              context.pushReplacement(Routes.subscribeView);
            },
            child: const Text(
              "Subscribe",
              textAlign: TextAlign.center,
              style: AppStyles.extraBold15,
            ),
          ),
        ),
      ],
    );
  }
}
