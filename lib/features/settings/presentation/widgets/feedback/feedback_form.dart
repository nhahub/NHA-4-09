import 'package:flutter/material.dart';
import '../../helpers/feedback_validator.dart';
import 'rating_error_text.dart';
import 'feedback_rating.dart';
import 'feedback_text_field.dart';
import 'feedback_submit_button.dart';
import 'feedback_cancel.dart';

class FeedbackForm extends StatefulWidget {
  const FeedbackForm({super.key});

  @override
  State<FeedbackForm> createState() => _FeedbackFormState();
}

class _FeedbackFormState extends State<FeedbackForm> {
  final TextEditingController feedbackController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    feedbackController.dispose();
    super.dispose();
  }

  void validateThenSubmit(BuildContext context) {
    if (formKey.currentState!.validate()) {
      submitFeedback(context, feedbackController.text.trim());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text("How was your experience?"),

          const SizedBox(height: 16),

          const FeedbackRating(),

          const SizedBox(height: 16),

          FeedbackTextField(controller: feedbackController),

          const SizedBox(height: 10),

          const RatingErrorText(),

          const SizedBox(height: 20),

          FeedbackSubmitButton(onSubmit: () => validateThenSubmit(context)),

          const FeedbackCancel(),
        ],
      ),
    );
  }
}
