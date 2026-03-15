import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../core/theming/app_colors.dart';
import '../../../../core/widgets/custom_circular_progress_indicator.dart';
import '../../../home/presentation/widgets/shared/back_button_appbar.dart';
import '../manager/chat_cubit/chat_cubit.dart';
import '../widgets/therapist_chat/chat_input_field.dart';
import '../widgets/therapist_chat/messages_list.dart';

class TherapistChatView extends StatelessWidget {
  const TherapistChatView({super.key});

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
                      controller: controller,
                    );
                  } else if (state is ChatFailureState) {
                    return Center(child: Text(state.errorMsg));
                  }
                  return const SizedBox.shrink();
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
