import 'package:flutter/material.dart';
import '../../../../../core/helpers/alpha_from_percent.dart';

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
  int selectedIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ChoosePaymentType(
          selectedIndex: selectedIndex,
          onSelect: (index) {
            setState(() {
              selectedIndex = index;
            });
          },
        ),
        const SizedBox(height: 20),
        SizedBox(
          width: double.infinity,
          child: IgnorePointer(
            ignoring: selectedIndex == -1,
            child: AppTextButton(
              backgroundColor: selectedIndex == -1
                  ? Colors.white.withAlpha(alphaFromPercentage(60))
                  : Colors.white,
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
        ),
      ],
    );
  }
}
