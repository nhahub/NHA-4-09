import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../home/presentation/widgets/shared/back_button_appbar.dart';
import '../../data/models/dummy/dummy_messages.dart';
import '../../data/models/message_model.dart';
import '../manager/chat_cubit/chat_cubit.dart';
import '../widgets/therapist_chat/chat_input_field.dart';
import '../widgets/therapist_chat/messages_list.dart';

class TherapistChatView extends StatefulWidget {
  const TherapistChatView({super.key});

  @override
  State<TherapistChatView> createState() => _TherapistChatViewState();
}

class _TherapistChatViewState extends State<TherapistChatView> {
  final ScrollController _controller = ScrollController();

  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_controller.hasClients) {
        _controller.jumpTo(_controller.position.maxScrollExtent);
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BackButtonAppbar(title: "Chat with Therapist"),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: BlocBuilder<ChatCubit, ChatState>(
                builder: (context, state) {
                  switch (state) {
                    case ChatLoadingState():
                      return MessagesList(
                        messages: DummyMessages.dummyMessages,
                        controller: _controller,
                      );

                    case ChatLoadedState(:final List<MessageModel> messages):
                      _scrollToBottom();

                      return MessagesList(
                        messages: messages,
                        controller: _controller,
                      );

                    case ChatFailureState(:final String errorMsg):
                      return Center(child: Text(errorMsg));

                    default:
                      return const SizedBox.shrink();
                  }
                },
              ),
            ),
            const SizedBox(height: 15),
            ChatInputField(
              onSend: (text) {
                context.read<ChatCubit>().sendMessage(
                  senderType: "user",
                  text: text,
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
