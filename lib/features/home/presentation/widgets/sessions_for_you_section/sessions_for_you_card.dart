import 'package:flutter/material.dart';

import '../../../../../core/extensions/context_extensions.dart';
import '../../../../../core/helpers/alpha_from_percent.dart';
import '../../../../../core/routing/routes.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../../../therapist/data/models/therapist_model.dart';
import 'therapist_cover_info.dart';
import 'therapist_details.dart';

class SessionsForYouCard extends StatelessWidget {
  final TherapistModel therapistModel;
  const SessionsForYouCard({super.key, required this.therapistModel});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(Routes.therapistDetailsView, args: therapistModel);
      },
      child: Container(
        width: 284.52,
        padding: const EdgeInsets.all(4),
        decoration: BoxDecoration(
          color: AppColors.bgFill,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: AppColors.borderButton.withAlpha(alphaFromPercentage(6)),
          ),
        ),
        child: Column(
          spacing: 4,
          children: [
            TherapistCoverInfo(therapistModel: therapistModel),
            TherapistDetails(therapistModel: therapistModel),
          ],
        ),
      ),
    );
  }
}
