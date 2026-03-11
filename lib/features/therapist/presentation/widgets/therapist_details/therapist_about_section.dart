import 'package:flutter/material.dart';

import '../../../../../core/theming/app_colors.dart';
import '../../../../../core/theming/app_styles.dart';

class TherapistAboutSection extends StatefulWidget {
  final String about;

  const TherapistAboutSection({super.key, required this.about});

  @override
  State<TherapistAboutSection> createState() => _TherapistAboutSectionState();
}

class _TherapistAboutSectionState extends State<TherapistAboutSection> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text("About", style: AppStyles.extraBold20),
        const SizedBox(height: 4),
        GestureDetector(
          onTap: () {
            setState(() {
              isExpanded = !isExpanded;
            });
          },
          child: Text(
            widget.about,
            maxLines: isExpanded ? null : 2,
            overflow: isExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
            style: AppStyles.medium15.copyWith(color: AppColors.lightGrey),
          ),
        ),

        const SizedBox(height: 4),

        GestureDetector(
          onTap: () {
            setState(() {
              isExpanded = !isExpanded;
            });
          },
          child: Text(
            isExpanded ? "See less" : "See more",
            style: AppStyles.extraBold15.copyWith(
              color: isExpanded ? AppColors.orange : AppColors.lightGreen,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
