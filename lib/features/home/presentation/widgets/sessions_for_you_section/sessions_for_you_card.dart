import 'package:flutter/material.dart';

import '../../../../../core/helpers/alpha_from_percent.dart';
import '../../../../../core/theming/app_colors.dart';
import '../../../data/models/sessions_for_you_model.dart';
import 'therapist_cover_info.dart';
import 'therapist_details.dart';

class SessionsForYouCard extends StatelessWidget {
  final SessionsForYouModel sessionsForYouModel;
  const SessionsForYouCard({super.key, required this.sessionsForYouModel});

  @override
  Widget build(BuildContext context) {
    return Container(
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
        children: [
          TherapistCoverInfo(sessionsForYouModel: sessionsForYouModel),
          const SizedBox(height: 4),
          TherapistDetails(sessionsForYouModel: sessionsForYouModel),
        ],
      ),
    );
  }
}
