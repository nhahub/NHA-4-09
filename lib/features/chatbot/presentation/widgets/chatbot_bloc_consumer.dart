import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/widgets/custom_circular_progress_indicator.dart';
import '../../../../core/widgets/custom_error_widget.dart';
import '../manager/chatbot_cubit/chatbot_cubit.dart';
import 'chatbot_input_field.dart';
import 'chatbot_messages_list_view.dart';
import 'chatbot_welcome_widget.dart';

class ChatbotBlocConsumer extends StatelessWidget {
  final String sessionId;
  final VoidCallback scrollToBottom;
  final VoidCallback sendMessage;
  final ScrollController scrollController;
  final TextEditingController controller;

  const ChatbotBlocConsumer({
    super.key,
    required this.sessionId,
    required this.scrollController,
    required this.scrollToBottom,
    required this.sendMessage,
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChatbotCubit, ChatbotState>(
      listener: (context, state) {
        if (state is ChatLoadedState) scrollToBottom();
      },
      builder: (context, state) {
        if (state is ChatLoadingState) {
          return const Center(
            child: CustomCircularProgressIndicator(color: AppColors.brandGreen),
          );
        }
        if (state is ChatFailureState) {
          return CustomErrorWidget(message: state.message);
        }
        if (state is ChatLoadedState) {
          return Column(
            children: [
              Expanded(
                child: state.messages.isEmpty
                    ? const ChatbotWelcomeWidget()
                    : ChatbotMessagesListView(
                        scrollController: scrollController,
                        state: state,
                        messages: state.messages,
                      ),
              ),
              ChatbotInputField(
                isSending: state.isSending,
                sessionId: sessionId,
                controller: controller,
                sendMessage: sendMessage,
              ),
            ],
          );
        }

        return const SizedBox.shrink();
      },
    );
  }
}
