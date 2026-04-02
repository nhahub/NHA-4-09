import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../therapist/presentation/widgets/therapist_details/custom_rating.dart';
import '../../manager/app_rating_cubit/app_rating_cubit.dart';

class FeedbackRating extends StatelessWidget {
  const FeedbackRating({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppRatingCubit, AppRatingState>(
      buildWhen: (prev, curr) => curr is GetAppRatingSuccessState,
      builder: (context, state) {
        int initialRating = 0;

        if (state is GetAppRatingSuccessState) {
          initialRating = state.appRatingModel?.rating ?? 0;
        }
        return CustomRating(
          isEditable: true,
          itemSize: 32,
          userRating: initialRating.toDouble(),
          onRatingUpdate: (value) {
            context.read<AppRatingCubit>().changeRating(
              newRating: value.toInt(),
            );
          },
        );
      },
    );
  }
}
