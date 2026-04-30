import 'package:flutter/material.dart';
import '../../../../../core/theming/app_styles.dart';
import '../../../data/models/video_model.dart';
import 'session_details_card.dart';

class SessionDetailsSection extends StatelessWidget {
  final VideoModel videoModel;

  const SessionDetailsSection({super.key, required this.videoModel});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 12,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Session details', style: AppStyles.extraBold18),
        SessionDetailsCard(
          duration: videoModel.duration,
          category: videoModel.category,
        ),
      ],
    );
  }
}
