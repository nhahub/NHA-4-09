import 'package:flutter/material.dart';
import '../../../../../core/constants/constants.dart';
import 'feedback_form.dart';

class FeedbackBottomSheet extends StatelessWidget {
  const FeedbackBottomSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(
        horizontal: kAppHorizontalPadding,
        vertical: kAppVerticalPadding,
      ),
      child: FeedbackForm(),
    );
  }
}
