import 'package:flutter/material.dart';
import '../../../../../core/theming/app_assets.dart';
import '../../../data/models/therapist_model.dart';
import 'info_card.dart';

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
