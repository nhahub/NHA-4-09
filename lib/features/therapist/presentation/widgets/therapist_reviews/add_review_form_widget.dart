import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moodly/core/extensions/string_extensions.dart';
import 'package:moodly/core/widgets/app_text_button.dart';
import 'package:moodly/core/widgets/app_text_form_field.dart';
import 'package:moodly/core/widgets/custom_circular_progress_indicator.dart';
import 'package:moodly/features/therapist/presentation/manager/therapist_reviews_cubit/therapist_reviews_cubit.dart';
import 'package:moodly/features/therapist/presentation/widgets/therapist_reviews/display_anonymously_widget.dart';

class AddReviewFormWidget extends StatefulWidget {
  final String therapistId;

  const AddReviewFormWidget({super.key, required this.therapistId});

  @override
  State<AddReviewFormWidget> createState() => _AddReviewFormWidgetState();
}

class _AddReviewFormWidgetState extends State<AddReviewFormWidget> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController reviewController = TextEditingController();
  int selectedAnonymousIndex = 0;
  @override
  void dispose() {
    reviewController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        children: [
          AppTextFormField(
            hintText: "Write your review...",
            controller: reviewController,
            maxLines: 4,
            validator: (value) {
              if (value.isNullOrEmpty()) {
                return "Please enter your review";
              }
            },
          ),
          const SizedBox(height: 30),
          DisplayAnonymouslyWidget(
            onSelectionChanged: (int index) {
              setState(() {
                selectedAnonymousIndex = index;
              });
            },
          ),
          const SizedBox(height: 60),
          BlocBuilder<TherapistReviewsCubit, TherapistReviewsState>(
            buildWhen: (previous, current) =>
                current is AddTherapistRatingsLoadingState,
            builder: (context, state) {
              return IgnorePointer(
                ignoring: state is AddTherapistRatingsLoadingState,
                child: SizedBox(
                  width: double.infinity,
                  child: AppTextButton(
                    onPressed: () {
                      validateThenSubmitReview(context);
                    },
                    buttonText: "Submit",
                    child: state is AddTherapistRatingsLoadingState
                        ? const CustomCircularProgressIndicator()
                        : null,
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  void validateThenSubmitReview(BuildContext context) {
    if (formKey.currentState!.validate()) {
      context.read<TherapistReviewsCubit>().addReview(
        displayAnonymously: selectedAnonymousIndex == 1,
        therapistId: widget.therapistId,
        review: reviewController.text,
      );
    }
  }
}
