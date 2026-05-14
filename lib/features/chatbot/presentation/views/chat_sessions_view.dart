import 'package:flutter/material.dart';
import '../../../../core/widgets/custom_appbar.dart';
import '../widgets/chat_sessions_bloc_builder.dart';
import '../widgets/chat_sessions_floating_button.dart';

class ChatSessionsView extends StatelessWidget {
  final bool isPremium;
  const ChatSessionsView({super.key, required this.isPremium});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),
      appBar: CustomAppbar(title: 'Chat with Moodly', isPremium: isPremium),
      floatingActionButton: const ChatSessionsFloatingButton(),
      body: const ChatSessionsBlocBuilder(),
    );
  }
}
