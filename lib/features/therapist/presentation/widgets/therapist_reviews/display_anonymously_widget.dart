import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moodly/features/therapist/presentation/manager/therapist_reviews_cubit/therapist_reviews_cubit.dart';
import '../../../../../core/theming/app_assets.dart';
import 'display_anonymously_item.dart';

class DisplayAnonymouslyWidget extends StatelessWidget {
  const DisplayAnonymouslyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TherapistReviewsCubit, TherapistReviewsState>(
      builder: (context, state) {
        return Column(
          children: [
            DisplayAnonymouslyItem(
              title: "Display With Your Name",
              icon: AppAssets.humanIcon,
              isSelected: state.selectedAnonymousIndex == 0,
              onTap: () {
                context.read<TherapistReviewsCubit>().updateDisplayAnonymously(
                  displayAnonymously: false,
                  selectedAnonymousIndex: 0,
                );
              },
            ),
            const SizedBox(height: 15),
            DisplayAnonymouslyItem(
              title: "Display Anonymously",
              icon: AppAssets.anonymousIcon,
              isSelected: state.selectedAnonymousIndex == 1,
              onTap: () {
                context.read<TherapistReviewsCubit>().updateDisplayAnonymously(
                  displayAnonymously: true,
                  selectedAnonymousIndex: 1,
                );
              },
            ),
          ],
        );
      },
    );
  }
}
