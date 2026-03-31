import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_styles.dart';
import '../../manager/app_rating_cubit/app_rating_cubit.dart';

class RatingErrorText extends StatelessWidget {
  const RatingErrorText({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AppRatingCubit, AppRatingState>(
      builder: (context, state) {
        if (state is AppRatingValidationErrorState && state.showRatingError) {
          return Text(
            "Please enter your rating",
            style: AppStyles.regular14.copyWith(color: AppColors.lighterRed),
          );
        }
        return const SizedBox.shrink();
      },
    );
  }
}
