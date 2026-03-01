import 'package:flutter/material.dart';
import 'package:moodly/core/theming/app_assets.dart';
import 'package:moodly/features/home/data/models/therapist_model.dart';
import 'package:moodly/features/therapist/presentation/widgets/therapist_details/info_card.dart';

class TherapistInfoSection extends StatelessWidget {
  final TherapistModel therapistModel;
  const TherapistInfoSection({super.key, required this.therapistModel});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Wrap(
        spacing: 16,
        alignment: WrapAlignment.center,
        children: [
          InfoCard(
            infoIcon: AppAssets.officeBag,
            infoValue: "${therapistModel.yearsOfExperience} Years",
            infoTitle: "Experience",
          ),
          InfoCard(
            infoIcon: AppAssets.language,
            infoValue: therapistModel.language,
            infoTitle: "Language",
          ),
          InfoCard(
            infoIcon: AppAssets.location,
            infoValue: therapistModel.location,
            infoTitle: "Location",
          ),
        ],
      ),
    );
  }
}
