import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/functions/confirm_dialog.dart';
import '../../../../core/functions/error_dialog.dart';
import '../../../home/presentation/widgets/shared/back_button_appbar.dart';
import '../manager/therapist_cubit/therapist_cubit.dart';
import '../manager/therapist_reviews_cubit/therapist_reviews_cubit.dart';
import '../widgets/therapist_reviews/add_therapist_review_view_body.dart';

class TherapistReviewAddView extends StatelessWidget {
  final String therapistId;

  const TherapistReviewAddView({super.key, required this.therapistId});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BackButtonAppbar(title: "Add Review"),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kAppHorizontalPadding),
        child: BlocListener<TherapistReviewsCubit, TherapistReviewsState>(
          listener: (context, state) {
            if (state.status.isSuccess) {
              context.read<TherapistCubit>().updateReviewsCountAndAverage(
                therapistId: therapistId,
                average: state.average,
                totalCount: state.totalCount!,
              );
              confirmDialog(
                context: context,
                title: "Done!",
                message: "We are very grateful for your review",
                onConfirm: () {
                  context.pop();
                  context.pop();
                },
              );
            } else if (state.status.isFailure) {
              errorDialog(context: context, message: state.error!);
            }
          },
          child: AddTherapistReviewViewBody(therapistId: therapistId),
        ),
      ),
    );
  }
}
