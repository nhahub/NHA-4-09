import 'package:flutter/material.dart';

import '../../../../../core/extensions/context_extensions.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../../core/theming/app_styles.dart';
import '../../../../../core/widgets/app_text_button.dart';
import 'choose_payment_type.dart';

class SubscribeSection extends StatefulWidget {
  const SubscribeSection({super.key});

  @override
  State<SubscribeSection> createState() => _SubscribeSectionState();
}

class _SubscribeSectionState extends State<SubscribeSection> {
  double selectedPrice = 0.0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ChoosePaymentType(
          onChanged: (price) {
            setState(() {
              selectedPrice = price;
            });
          },
        ),
        const SizedBox(height: 20),
        SizedBox(
          width: double.infinity,
          child: AppTextButton(
            backgroundColor: Colors.white,
            withGradient: false,
            onPressed: () {
              context.pushReplacement(
                Routes.subscribeView,
                args: selectedPrice,
              );
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
