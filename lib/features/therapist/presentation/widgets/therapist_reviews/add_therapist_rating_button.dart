import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/widgets/custom_floating_action_button.dart';
import '../../../../../core/extensions/context_extensions.dart';
import '../../../../../core/routing/routes.dart';
import '../../manager/therapist_reviews_cubit/therapist_reviews_cubit.dart';

class AddTherapistRatingButton extends StatelessWidget {
  const AddTherapistRatingButton({super.key, required this.therapistId});

  final String therapistId;

  @override
  Widget build(BuildContext context) {
    return CustomFloatingActionButton(
      onTap: () {
        final TherapistReviewsCubit cubit = context
            .read<TherapistReviewsCubit>();
        context.push(
          Routes.therapistRatingAddView,
          args: {'therapistId': therapistId, 'cubit': cubit},
        );
      },
    );
  }
}
