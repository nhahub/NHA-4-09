import 'package:flutter/material.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/functions/user_data_local.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/app_assets.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/widgets/app_text_button.dart';
import '../../../../core/widgets/custom_appbar.dart';

import '../../../../core/theming/app_styles.dart';

class StartChatView extends StatelessWidget {
  final bool isPremium;
  const StartChatView({super.key, required this.isPremium});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppbar(title: "Chat with AI", isPremium: isPremium),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kAppHorizontalPadding),
        child: Column(
          children: [
            Stack(
              alignment: Alignment.topRight,
              children: [
                Positioned(
                  top: 30,
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: const BoxDecoration(
                      color: AppColors.brandGreen,
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                    ),
                    child: Text(
                      "Hey, ${getUser()!.name!.split(' ').first}",
                      style: AppStyles.bold14.copyWith(color: Colors.white),
                    ),
                  ),
                ),
                Image.asset(AppAssets.chatbot),
              ],
            ),
            Text(
              "Welcome to Moodly!",
              style: AppStyles.extraBold21.copyWith(
                color: AppColors.brandGreen,
              ),
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              child: AppTextButton(
                onPressed: () {
                  context.push(Routes.chatbotView);
                },
                buttonText: "Chat Now",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
