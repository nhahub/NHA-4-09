import 'package:flutter/material.dart';

import '../../../../core/theming/app_styles.dart';
import '../../../home/presentation/widgets/shared/back_button_appbar.dart';

class ThankYouView extends StatelessWidget {
  const ThankYouView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BackButtonAppbar(title: "Thank You"),
      body: Transform.translate(
        offset: const Offset(0, -16),
        child: const Center(
          child: Text(
            "Your payment was successful",
            textAlign: TextAlign.center,
            style: AppStyles.extraBold20,
          ),
        ),
      ),
    );
  }
}
