import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../core/functions/error_dialog.dart';
import '../../../../core/extensions/context_extensions.dart';
import '../../../../core/functions/user_data_local.dart';
import '../../../../core/routing/routes.dart';
import '../../../../core/widgets/custom_error_widget.dart';
import '../../../home/presentation/widgets/shared/back_button_appbar.dart';
import '../../data/models/booking_model.dart';
import '../../data/models/dummy/dummy_messages.dart';
import '../manager/chat_cubit/chat_cubit.dart';
import '../widgets/therapist_chat/chat_input_field.dart';
import '../widgets/therapist_chat/messages_list.dart';

class TherapistChatView extends StatefulWidget {
  final BookingModel bookingModel;
  const TherapistChatView({super.key, required this.bookingModel});

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
      appBar: BackButtonAppbar(title: widget.bookingModel.therapistName),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: BlocConsumer<ChatCubit, ChatState>(
                listenWhen: (prev, curr) =>
                    prev.isSessionEnded != curr.isSessionEnded,
                listener: (context, state) {
                  if (state.isSessionEnded) {
                    errorDialog(
                      context: context,
                      message: "Session has ended",
                      onPressed: () {
                        context.pushAndRemoveUntil(Routes.mainView);
                      },
                    );
                  }
                },
                builder: (context, state) {
                  switch (state.status) {
                    case ChatStatus.loading:
                      return MessagesList(
                        messages: DummyMessages.dummyMessages,
                        controller: _controller,
                        isLoading: true,
                        bookingModel: widget.bookingModel,
                        userName: '',
                        userImage: '',
                      );

                    case ChatStatus.success:
                      _scrollToBottom();

                      return MessagesList(
                        messages: state.messages!,
                        controller: _controller,
                        bookingModel: widget.bookingModel,
                        userName: state.userName!,
                        userImage: state.userImage!,
                      );

                    case ChatStatus.failure:
                      return CustomErrorWidget(message: state.errorMsg!);

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
                  senderType:
                      widget.bookingModel.therapistId == getUser()!.userId
                      ? "therapist"
                      : "user",
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
