import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

import '../../../../../core/errors/failure.dart';
import '../../../../../core/functions/user_data_local.dart';
import '../../../../../core/networking/api_error_handler.dart';
import '../../../data/models/message_model.dart';
import '../../../data/repos/chat_repo.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  final ChatRepo chatRepo;
  StreamSubscription<Either<Failure, List<MessageModel>>>? _sub;

  ChatCubit({required this.chatRepo}) : super(ChatInitialState());
  String? _roomId;

  void loadMessages({required String therapistId}) async {
    emit(ChatLoadingState());
    final roomResult = await chatRepo.getOrCreateRoom(therapistId: therapistId);

    if (roomResult.isLeft()) {
      emit(
        ChatFailureState(
          errorMsg: roomResult
              .swap()
              .getOrElse(() => ApiErrorHandler.handle(error: roomResult))
              .message,
        ),
      );
      return;
    }
    _roomId = roomResult.getOrElse(() => "");

    // Get messages
    final Either<Failure, List<MessageModel>> result = await chatRepo
        .getMessages(roomId: _roomId!);

    result.fold(
      (failure) => emit(ChatFailureState(errorMsg: failure.message)),
      (messages) => emit(ChatLoadedState(messages: messages)),
    );

    // Listen to messages
    _sub = chatRepo.listenToMessages(roomId: _roomId!).listen((either) {
      either.fold(
        (failure) => emit(ChatFailureState(errorMsg: failure.message)),
        (messages) => emit(ChatLoadedState(messages: messages)),
      );
    });
  }

  Future<void> sendMessage({
    required String senderType,
    required String text,
  }) async {
    const uuid = Uuid();
    final MessageModel msg = MessageModel(
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
    final Either<Failure, void> result = await chatRepo.sendMessage(msg: msg);

    result.fold(
      (failure) => emit(ChatFailureState(errorMsg: failure.message)),
      (_) => null,
    );
  }

  @override
  Future<void> close() {
    _sub?.cancel();
    return super.close();
  }
}
