import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../data/models/chat_session_model.dart';
import '../manager/chatbot_cubit/chatbot_cubit.dart';
import 'chat_sessions_list_tile.dart';

class ChatSessionsListView extends StatelessWidget {
  final List<ChatSessionModel> sessions;
  const ChatSessionsListView({super.key, required this.sessions});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      itemCount: sessions.length,
      separatorBuilder: (_, __) => const SizedBox(height: 8),
      itemBuilder: (context, index) {
        final session = sessions[index];
        return Dismissible(
          key: Key(session.id),
          direction: DismissDirection.endToStart,
          background: Container(
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.only(right: 20),
            decoration: BoxDecoration(
              color: Colors.red.shade400,
              borderRadius: BorderRadius.circular(12),
            ),
            child: const Icon(Icons.delete_outline, color: Colors.white),
          ),
          onDismissed: (_) =>
              context.read<ChatbotCubit>().deleteSession(session.id),
          child: ChatSessionsListTile(session: session),
        );
      },
    );
  }
}
