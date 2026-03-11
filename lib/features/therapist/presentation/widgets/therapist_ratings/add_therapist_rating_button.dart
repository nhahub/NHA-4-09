import 'package:flutter/material.dart';
import 'package:moodly/core/extensions/context_extensions.dart';
import 'package:moodly/core/routing/routes.dart';
import 'package:moodly/core/theming/app_colors.dart';

class AddTherapistRatingButton extends StatelessWidget {
  const AddTherapistRatingButton({super.key, required this.therapistId});

  final String therapistId;

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: AppColors.lightGreen,
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(555)),
      onPressed: () {
        context.push(Routes.addtherapistRatingView, args: therapistId);
      },
      child: const Icon(Icons.add, color: Colors.white),
    );
  }
}
