import 'package:flutter/material.dart';
import '../widgets/chat_sessions_bloc_builder.dart';
import '../widgets/chat_sessions_floating_button.dart';

class ChatSessionsView extends StatelessWidget {
  final bool isPremium;
  const ChatSessionsView({super.key, required this.isPremium});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Color(0xffF5F5F5),
      floatingActionButton: ChatSessionsFloatingButton(),
      body: ChatSessionsBlocBuilder(),
    );
  }
}
