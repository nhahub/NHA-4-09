import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

import '../../../../../core/functions/user_data_local.dart';
import '../../../../../core/networking/api_error_handler.dart';
import '../../../data/models/message_model.dart';
import '../../../data/repos/chat_repo.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  final ChatRepo _chatRepo;
  StreamSubscription<List<MessageModel>>? _sub;

  ChatCubit({required ChatRepo chatRepo})
    : _chatRepo = chatRepo,
      super(ChatInitialState());

  String? _roomId;

  Future<void> loadMessages({required String therapistId}) async {
    emit(ChatLoadingState());

    try {
      final roomId = await _chatRepo.getOrCreateRoom(therapistId: therapistId);

      _roomId = roomId;

      final messages = await _chatRepo.getMessages(roomId: roomId);

      emit(ChatLoadedState(messages: messages));

      _sub?.cancel();
      _sub = _chatRepo
          .listenToMessages(roomId: roomId)
          .listen(
            (messages) {
              emit(ChatLoadedState(messages: messages));
            },
            onError: (error) {
              emit(
                ChatFailureState(
                  errorMsg: ApiErrorHandler.handle(error: error).message,
                ),
              );
            },
          );
    } catch (e) {
      emit(
        ChatFailureState(errorMsg: ApiErrorHandler.handle(error: e).message),
      );
    }
  }

  Future<void> sendMessage({
    required String senderType,
    required String text,
  }) async {
    if (_roomId == null) return;

    const uuid = Uuid();

    final msg = MessageModel(
      id: uuid.v4(),
      roomId: _roomId!,
      senderId: getUser()!.userId,
      senderType: senderType,
      message: text,
      createdAt: DateTime.now(),
    );

    if (state is ChatLoadedState) {
      final currentMessages = List<MessageModel>.from(
        (state as ChatLoadedState).messages,
      );

      currentMessages.add(msg);

      emit(ChatLoadedState(messages: currentMessages));
    }

    try {
      await _chatRepo.sendMessage(msg: msg);
    } catch (e) {
      emit(
        ChatFailureState(errorMsg: ApiErrorHandler.handle(error: e).message),
      );
    }
  }

  @override
  Future<void> close() {
    _sub?.cancel();
    return super.close();
  }
}
