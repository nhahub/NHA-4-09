import 'package:flutter/material.dart';
import 'package:moodly/core/enums/fade_position.dart';
import 'package:moodly/core/theming/app_assets.dart';
import 'package:moodly/core/widgets/custom_appbar.dart';
import 'package:moodly/core/widgets/fade_scrollable.dart';

class ChatbotView extends StatelessWidget {
  final bool isPremium = false;
  const ChatbotView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: CustomAppbar(
        title: "Chatbot",
        isPremium: isPremium,
        icon: AppAssets.searchIcon,
        onTap: () {},
      ),
      body:const FadeScrollable(
        fadePosition: FadePosition.bottom,
        child: Column(
          children: [
            SizedBox(height: 80),
            Center(child: Text('Welcome to the Chatbot View!')),
          ],
        ),
      ),
    );
  }
}
