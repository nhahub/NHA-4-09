import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../manager/chatbot_cubit/chatbot_cubit.dart';
import '../widgets/chatbot_appbar.dart';
import '../widgets/chatbot_bloc_consumer.dart';

class ChatbotView extends StatefulWidget {
  final String sessionId;
  const ChatbotView({super.key, required this.sessionId});

  @override
  State<ChatbotView> createState() => _ChatbotViewState();
}

class _ChatbotViewState extends State<ChatbotView> {
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();

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
      appBar: ChatbotAppBar(sessionId: widget.sessionId),
      body: SafeArea(
        top: false,
        child: ChatbotBlocConsumer(
          sessionId: widget.sessionId,
          scrollController: _scrollController,
          scrollToBottom: _scrollToBottom,
          sendMessage: _sendMessage,
          controller: _controller,
        ),
      ),
    );
  }
}
