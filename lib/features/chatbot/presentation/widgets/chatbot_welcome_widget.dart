import 'package:flutter/material.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_styles.dart';

class ChatbotWelcomeWidget extends StatelessWidget {
  const ChatbotWelcomeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 40,
              backgroundColor: AppColors.brandGreen,
              child: Text(
                'M',
                style: AppStyles.bold36.copyWith(color: Colors.white),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Hi, I\'m Moodly 👋',
              style: AppStyles.extraBold21.copyWith(
                color: AppColors.brandGreen,
              ),
            ),
            const SizedBox(height: 8),
            const Text(
              'Your mental wellness companion.\nHow are you feeling today?',
              textAlign: TextAlign.center,
              style: AppStyles.medium14,
            ),
          ],
        ),
      ),
    );
  }
}
