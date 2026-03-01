import 'package:flutter/material.dart';
import 'package:moodly/features/therapist/presentation/widgets/therapist_details/therapist_speciality.dart';
import '../../../../../core/theming/app_styles.dart';

class TherapistHeader extends StatelessWidget {
  final String name;
  final String speciality;

  const TherapistHeader({
    super.key,
    required this.name,
    required this.speciality,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(name, style: AppStyles.extraBold20),
        const SizedBox(height: 4),
        TherapistSpeciality(speciality: speciality),
      ],
    );
  }
}
