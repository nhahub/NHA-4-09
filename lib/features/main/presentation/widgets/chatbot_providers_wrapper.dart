import 'package:flutter/material.dart';

import '../../../chatbot/presentation/views/start_chat_view.dart';

class ChatbotProvidersWrapper extends StatelessWidget {
  final bool isPremium;

  const ChatbotProvidersWrapper({super.key, required this.isPremium});

  @override
  Widget build(BuildContext context) {
    return StartChatView(isPremium: isPremium,);
  }
}
