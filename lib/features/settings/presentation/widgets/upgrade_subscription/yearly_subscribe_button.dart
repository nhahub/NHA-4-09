import 'package:flutter/material.dart';
import 'package:moodly/core/extensions/context_extensions.dart';
import 'package:moodly/core/routing/routes.dart';
import 'package:moodly/core/widgets/app_text_button.dart';

class YearlySubscribeButton extends StatelessWidget {
  const YearlySubscribeButton({super.key, required this.finalMonthlyPrice});

  final double finalMonthlyPrice;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: AppTextButton(
        onPressed: () {
          context.pushReplacement(
            Routes.subscribeView,
            args: {"price": finalMonthlyPrice, "type": "monthly"},
          );
        },
        buttonText: "Back to Monthly",
      ),
    );
  }
}
