import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moodly/core/theming/app_colors.dart';
import 'package:moodly/features/therapist/presentation/manager/chat_cubit/chat_cubit.dart';
import 'package:moodly/features/therapist/presentation/widgets/therapist_chat/chat_input_field.dart';
import 'package:moodly/features/therapist/presentation/widgets/therapist_chat/messages_list.dart';

import '../../../../core/widgets/custom_circular_progress_indicator.dart';

class TherapistChatView extends StatelessWidget {
  final String roomId;
  final String currentUserId;

  const TherapistChatView({
    super.key,
    required this.roomId,
    required this.currentUserId,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Chat with Therapist")),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: BlocBuilder<ChatCubit, ChatState>(
                builder: (context, state) {
                  if (state is ChatLoadingState) {
                    return const Center(
                      child: CustomCircularProgressIndicator(
                        color: AppColors.lightGreen,
                      ),
                    );
                  } else if (state is ChatLoadedState) {
                    final controller = ScrollController();
                    WidgetsBinding.instance.addPostFrameCallback((_) {
                      if (controller.hasClients) {
                        controller.jumpTo(controller.position.maxScrollExtent);
                      }
                    });
                    return MessagesList(
                      messages: state.messages,
                      currentUserId: currentUserId,
                      controller: controller,
                    );
                  } else if (state is ChatFailureState) {
                    return Center(child: Text(state.errorMsg));
                  }
                  return const SizedBox.shrink();
                },
              ),
            ),
            ChatInputField(
              onSend: (text) {
                context.read<ChatCubit>().sendMessage(
                  roomId: roomId,
                  senderId: currentUserId,
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
