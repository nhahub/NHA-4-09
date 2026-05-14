import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/widgets/custom_circular_progress_indicator.dart';
import '../../../../core/widgets/custom_error_widget.dart';
import '../manager/chatbot_cubit/chatbot_cubit.dart';
import 'chat_sessions_list_view.dart';
import 'empty_chat_sessions.dart';

class ChatSessionsBlocBuilder extends StatelessWidget {
  const ChatSessionsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatbotCubit, ChatbotState>(
      builder: (context, state) {
        if (state is ChatSessionsLoadingState) {
          return const Center(
            child: CustomCircularProgressIndicator(color: AppColors.brandGreen),
          );
        }

        if (state is ChatSessionsFailureState) {
          return CustomErrorWidget(message: state.message);
        }

        if (state is ChatSessionsLoadedState) {
          if (state.sessions.isEmpty) {
            return const EmptyChatSessions();
          }
          return ChatSessionsListView(sessions: state.sessions);
        }

        return const SizedBox.shrink();
      },
    );
  }
}
