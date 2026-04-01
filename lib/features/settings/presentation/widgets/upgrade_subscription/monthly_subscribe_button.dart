import 'package:flutter/material.dart';
import 'package:moodly/core/extensions/context_extensions.dart';
import 'package:moodly/core/routing/routes.dart';
import 'package:moodly/core/widgets/app_text_button.dart';

class MonthlySubscribeButton extends StatelessWidget {
  const MonthlySubscribeButton({super.key, required this.finalYearlyPrice});

  final double finalYearlyPrice;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: AppTextButton(
        onPressed: () {
          context.pushReplacement(
            Routes.subscribeView,
            args: {"price": finalYearlyPrice, "type": "yearly"},
          );
        },
        buttonText: "Upgrade to Yearly",
      ),
    );
  }
}
