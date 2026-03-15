import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/extensions/string_extensions.dart';
import '../../../../../core/widgets/app_text_button.dart';
import '../../../../../core/widgets/app_text_form_field.dart';
import '../../../../../core/widgets/custom_circular_progress_indicator.dart';
import '../../../data/models/therapist_review_model.dart';
import '../../manager/therapist_reviews_cubit/therapist_reviews_cubit.dart';
import 'display_anonymously_widget.dart';

class UpdateReviewFormWidget extends StatefulWidget {
  final TherapistReviewModel oldTherapistReviewModel;
  final String therapistId;

  const UpdateReviewFormWidget({
    super.key,
    required this.therapistId,
    required this.oldTherapistReviewModel,
  });

  @override
  State<UpdateReviewFormWidget> createState() => _UpdateReviewFormWidgetState();
}

class _UpdateReviewFormWidgetState extends State<UpdateReviewFormWidget> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late TextEditingController reviewController;

  int selectedAnonymousIndex = 0;

  @override
  void initState() {
    super.initState();
    reviewController = TextEditingController(
      text: widget.oldTherapistReviewModel.review,
    );
  }

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
                current is UpdateTherapistReviewLoadingState ||
                current is UpdateTherapistReviewFailureState ||
                current is UpdateTherapistReviewSuccessState,
            builder: (context, state) {
              return IgnorePointer(
                ignoring: state is UpdateTherapistReviewLoadingState,
                child: SizedBox(
                  width: double.infinity,
                  child: AppTextButton(
                    onPressed: () {
                      validateThenUpdateReview(context);
                    },
                    buttonText: "Update Review",
                    child: state is UpdateTherapistReviewLoadingState
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

  void validateThenUpdateReview(BuildContext context) {
    if (formKey.currentState!.validate()) {
      context.read<TherapistReviewsCubit>().updateReview(
        displayAnonymously: selectedAnonymousIndex == 1,
        reviewModel: widget.oldTherapistReviewModel,
        review: reviewController.text,
      );
    }
  }
}
