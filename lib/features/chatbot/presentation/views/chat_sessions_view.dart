import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_styles.dart';
import '../../../../core/widgets/custom_appbar.dart';
import '../manager/chatbot_cubit/chatbot_cubit.dart';

class ChatSessionsView extends StatefulWidget {
  final bool isPremium;
  const ChatSessionsView({super.key, required this.isPremium});

  @override
  State<ChatSessionsView> createState() => _ChatSessionsViewState();
}

class _ChatSessionsViewState extends State<ChatSessionsView> {
  @override
  void initState() {
    super.initState();
    context.read<ChatbotCubit>().loadSessions();
  }

  Future<void> _startNewChat() async {
    final cubit = context.read<ChatbotCubit>();
    final session = await cubit.createNewSession();
    if (session != null && mounted) {
      context.push(Routes.chatbotView, args: session.id);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),
      appBar: CustomAppbar(
        title: 'Chat with Mindy',
        isPremium: widget.isPremium,
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _startNewChat,
        backgroundColor: AppColors.brandGreen,
        icon: const Icon(Icons.add, color: Colors.white),
        label: Text(
          'New Chat',
          style: AppStyles.bold14.copyWith(color: Colors.white),
        ),
      ),
      body: BlocBuilder<ChatbotCubit, ChatbotState>(
        builder: (context, state) {
          if (state is ChatSessionsLoadingState) {
            return const Center(
                child: CircularProgressIndicator(color: AppColors.brandGreen));
          }

          if (state is ChatSessionsFailureState) {
            return Center(child: Text(state.message));
          }

          if (state is ChatSessionsLoadedState) {
            if (state.sessions.isEmpty) {
              return _buildEmpty();
            }
            return _buildList(state);
          }

          return const SizedBox();
        },
      ),
    );
  }

  Widget _buildEmpty() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(Icons.chat_bubble_outline,
              size: 72, color: AppColors.brandGreen),
          const SizedBox(height: 16),
          Text("No conversations yet",
              style: AppStyles.bold14.copyWith(color: Colors.black54)),
          const SizedBox(height: 8),
          Text("Tap + to start chatting with Mindy",
              style: AppStyles.medium14.copyWith(color: Colors.black38)),
        ],
      ),
    );
  }

  Widget _buildList(ChatSessionsLoadedState state) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      itemCount: state.sessions.length,
      separatorBuilder: (_, __) => const SizedBox(height: 8),
      itemBuilder: (context, index) {
        final session = state.sessions[index];
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
          child: ListTile(
            tileColor: Colors.white,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12)),
            leading: const CircleAvatar(
              backgroundColor: AppColors.brandGreen,
              child: Icon(Icons.chat, color: Colors.white, size: 18),
            ),
            title: Text(session.title,
                style: AppStyles.bold14,
                maxLines: 1,
                overflow: TextOverflow.ellipsis),
            subtitle: Text(
              _formatDate(session.updatedAt),
              style: AppStyles.medium15.copyWith(color: Colors.black45),
            ),
            trailing: const Icon(Icons.chevron_right, color: Colors.black38),
            onTap: () =>
                context.push(Routes.chatbotView, args: session.id),
          ),
        );
      },
    );
  }

  String _formatDate(DateTime dt) {
    final now = DateTime.now();
    final diff = now.difference(dt);
    if (diff.inMinutes < 1) return 'Just now';
    if (diff.inHours < 1) return '${diff.inMinutes}m ago';
    if (diff.inDays < 1) return '${diff.inHours}h ago';
    if (diff.inDays == 1) return 'Yesterday';
    return '${dt.day}/${dt.month}/${dt.year}';
  }
}