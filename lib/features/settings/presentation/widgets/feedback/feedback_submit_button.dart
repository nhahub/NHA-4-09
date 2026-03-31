import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/widgets/app_text_button.dart';
import '../../../../../core/widgets/custom_circular_progress_indicator.dart';
import '../../../../../core/extensions/context_extensions.dart';
import '../../../../../core/functions/confirm_dialog.dart';
import '../../../../../core/functions/error_dialog.dart';
import '../../manager/app_rating_cubit/app_rating_cubit.dart';

class FeedbackSubmitButton extends StatelessWidget {
  final VoidCallback onSubmit;

  const FeedbackSubmitButton({super.key, required this.onSubmit});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppRatingCubit, AppRatingState>(
      listener: (context, state) {
        if (state is AppRatingSubmittedState) {
          confirmDialog(
            context: context,
            title: "Thank you",
            message: "Your feedback has been submitted",
            onConfirm: () {
              context.pop();
              context.pop();
            },
          );
        } else if (state is AppRatingFailureState) {
          errorDialog(context: context, message: state.message);
        }
      },
      builder: (context, state) {
        return IgnorePointer(
          ignoring: state is AppRatingLoadingState,
          child: SizedBox(
            width: double.infinity,
            child: AppTextButton(
              onPressed: onSubmit,
              buttonText: "Submit",
              child: state is AppRatingLoadingState
                  ? const CustomCircularProgressIndicator()
                  : null,
            ),
          ),
        );
      },
    );
  }
}
