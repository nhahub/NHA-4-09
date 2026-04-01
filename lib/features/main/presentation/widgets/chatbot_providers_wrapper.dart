import 'package:flutter/material.dart';

import '../../../chatbot/presentation/views/chatbot_view.dart';

class ChatbotProvidersWrapper extends StatelessWidget {
  final bool isPremium;

  const ChatbotProvidersWrapper({super.key, required this.isPremium});

  @override
  Widget build(BuildContext context) {
    return ChatbotView(isPremium: isPremium);
  }
}
