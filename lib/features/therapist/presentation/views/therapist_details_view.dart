import 'package:flutter/material.dart';
import '../widgets/therapist_details/therapist_info_section.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/theming/app_colors.dart';
import '../../data/models/therapist_model.dart';
import '../../../home/presentation/widgets/shared/back_button_appbar.dart';
import '../widgets/therapist_details/therapist_about_section.dart';
import '../widgets/therapist_details/therapist_contact_section.dart';
import '../widgets/therapist_details/therapist_header.dart';
import '../widgets/therapist_details/therapist_image.dart';
import '../widgets/therapist_details/therapist_rating_section.dart';

class TherapistDetailsView extends StatelessWidget {
  final TherapistModel therapistModel;

  const TherapistDetailsView({super.key, required this.therapistModel});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const BackButtonAppbar(title: "Therapist Details"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: kAppHorizontalPadding,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 105),
              TherapistImage(therapistModel: therapistModel),
              const SizedBox(height: 20),
              TherapistHeader(
                name: therapistModel.name,
                speciality: therapistModel.speciality,
              ),
              const SizedBox(height: 4),
              TherapistRatingSection(
                rating: therapistModel.ratingSummary.rating,
                ratingCount: therapistModel.ratingSummary.totalCount,
              ),
              const Divider(color: AppColors.lightGrey, height: 30),
              TherapistInfoSection(therapistModel: therapistModel),
              const SizedBox(height: 16),
              TherapistAboutSection(about: therapistModel.about),
              const SizedBox(height: 16),
              TherapistContactSection(therapistModel: therapistModel),
              const SizedBox(height: 30),
            ],
          ),
        ),
      ),
    );
  }
}
