import 'package:flutter/material.dart';
import 'package:moodly/core/theming/app_colors.dart';

import '../../../../../core/theming/app_styles.dart';

class TherapistSpeciality extends StatefulWidget {
  const TherapistSpeciality({super.key, required this.speciality});

  final String speciality;

  @override
  State<TherapistSpeciality> createState() => _TherapistSpecialityState();
}

class _TherapistSpecialityState extends State<TherapistSpeciality> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isExpanded = !isExpanded;
        });
      },
      child: Text(
        maxLines: isExpanded ? null : 1,
        overflow: isExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
        widget.speciality,
        style: AppStyles.bold14.copyWith(color: AppColors.bodyGray),
      ),
    );
  }
}
