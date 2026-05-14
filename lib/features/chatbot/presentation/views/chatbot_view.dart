import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moodly/core/widgets/custom_circular_progress_indicator.dart';
import 'package:moodly/core/widgets/custom_error_widget.dart';

import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/theming/app_assets.dart';
import '../../../../core/theming/app_colors.dart';
import '../../../../core/theming/app_styles.dart';
import '../../../../core/widgets/custom_circle_button.dart';
import '../manager/chatbot_cubit/chatbot_cubit.dart';
import '../widgets/chat_message_bubble.dart';
import '../widgets/chat_typing_indicator.dart';

class ChatbotView extends StatefulWidget {
  final String sessionId;
  const ChatbotView({super.key, required this.sessionId});

  @override
  State<ChatbotView> createState() => _ChatbotViewState();
}

class _ChatbotViewState extends State<ChatbotView> {
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    context.read<ChatbotCubit>().loadMessages(widget.sessionId);
  }

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  void _sendMessage() {
    final text = _controller.text.trim();
    if (text.isEmpty) return;
    _controller.clear();
    context.read<ChatbotCubit>().sendMessage(
      sessionId: widget.sessionId,
      text: text,
    );
    _scrollToBottom();
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F5F5),
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Center(
          child: Transform.scale(
            scale: 0.8,
            child: CustomCircleButton(
              icon: AppAssets.arrowLeftIosIcon,
              onTap: () => context.pop(),
              backgroundcolor: Colors.white,
            ),
          ),
        ),
        title: Row(
          children: [
            const CircleAvatar(
              radius: 16,
              backgroundColor: AppColors.brandGreen,
              child: Text(
                'M',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(width: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Moodly',
                  style: AppStyles.bold14.copyWith(color: Colors.black),
                ),
                Text(
                  'Mental Wellness AI',
                  style: AppStyles.medium15.copyWith(color: Colors.black45),
                ),
              ],
            ),
          ],
        ),
        actions: [
          PopupMenuButton<String>(
            icon: const Icon(Icons.more_vert, color: Colors.black),
            onSelected: (value) {
              if (value == 'clear') {
                context.read<ChatbotCubit>().clearChat(widget.sessionId);
              }
            },
            itemBuilder: (_) => const [
              PopupMenuItem(
                value: 'clear',
                child: Row(
                  children: [
                    Icon(Icons.delete_outline, size: 18, color: Colors.red),
                    SizedBox(width: 8),
                    Text('Clear Chat', style: TextStyle(color: Colors.red)),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
      body: SafeArea(
        top: false,
        child: BlocConsumer<ChatbotCubit, ChatbotState>(
          listener: (context, state) {
            if (state is ChatLoadedState) _scrollToBottom();
            if (state is ChatFailureState) {
              CustomErrorWidget(message: state.message);
            }
          },
          builder: (context, state) {
            if (state is ChatLoadingState) {
              return const Center(
                child: CustomCircularProgressIndicator(
                  color: AppColors.brandGreen,
                ),
              );
            }

            if (state is ChatLoadedState) {
              return Column(
                children: [
                  Expanded(
                    child: state.messages.isEmpty
                        ? _buildWelcome()
                        : ListView.builder(
                            reverse: true,
                            controller: _scrollController,
                            padding: const EdgeInsets.symmetric(
                              horizontal: 12,
                              vertical: 16,
                            ),
                            itemCount:
                                state.messages.length +
                                (state.isSending ? 1 : 0),
                            itemBuilder: (context, index) {
                              final messages = state.messages.reversed.toList();

                              if (state.isSending && index == 0) {
                                return const ChatTypingIndicator();
                              }

                              final messageIndex = state.isSending
                                  ? index - 1
                                  : index;

                              if (messageIndex < 0 ||
                                  messageIndex >= messages.length) {
                                return const SizedBox.shrink();
                              }

                              return ChatMessageBubble(
                                message: messages[messageIndex],
                              );
                            },
                          ),
                  ),
                  _buildInput(state.isSending),
                ],
              );
            }

            return const SizedBox();
          },
        ),
      ),
    );
  }

  Widget _buildWelcome() {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 40,
              backgroundColor: AppColors.brandGreen,
              child: Text(
                'M',
                style: TextStyle(
                  fontSize: 36,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Text(
              'Hi, I\'m Moodly 👋',
              style: AppStyles.extraBold21.copyWith(
                color: AppColors.brandGreen,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              'Your mental wellness companion.\nHow are you feeling today?',
              textAlign: TextAlign.center,
              style: AppStyles.medium14.copyWith(color: Colors.black54),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInput(bool isSending) {
    return Container(
      padding: const EdgeInsets.all(8),
      color: Colors.white,
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              enabled: !isSending,
              onSubmitted: (_) => _sendMessage(),
              textInputAction: TextInputAction.send,
              decoration: InputDecoration(
                hintText: 'Type a message...',
                filled: true,
                fillColor: const Color(0xffF0F0F0),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 10,
                ),
              ),
            ),
          ),
          const SizedBox(width: 8),
          Container(
            decoration: BoxDecoration(
              color: isSending ? Colors.grey.shade300 : AppColors.brandGreen,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              icon: Icon(
                isSending ? Icons.hourglass_top : Icons.send,
                color: Colors.white,
              ),
              onPressed: isSending ? null : _sendMessage,
            ),
          ),
        ],
      ),
    );
  }
}
