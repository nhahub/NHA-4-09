import 'package:flutter/material.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_styles.dart';

class EmptyChatSessions extends StatelessWidget {
  const EmptyChatSessions({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.chat_bubble_outline,
            size: 72,
            color: AppColors.brandGreen,
          ),
          const SizedBox(height: 16),
          Text(
            "No conversations yet",
            style: AppStyles.bold14.copyWith(color: Colors.black54),
          ),
          const SizedBox(height: 8),
          Text(
            "Tap + to start chatting with Moodly",
            style: AppStyles.medium14.copyWith(color: Colors.black38),
          ),
        ],
      ),
    );
  }
}
