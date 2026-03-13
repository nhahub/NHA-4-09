import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/errors/failure.dart';
import '../../../data/models/message_model.dart';
import '../../../data/repos/chat_repo.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  final ChatRepo chatRepo;
  StreamSubscription<Either<Failure, List<MessageModel>>>? _sub;

  ChatCubit({required this.chatRepo}) : super(ChatInitialState());

  void loadMessages({required String roomId}) async {
    emit(ChatLoadingState());
    // Get messages
    final Either<Failure, List<MessageModel>> result = await chatRepo
        .getMessages(roomId: roomId);

    result.fold(
      (failure) => emit(ChatFailureState(errorMsg: failure.message)),
      (messages) => emit(ChatLoadedState(messages: messages)),
    );

    // Listen to messages
    _sub = chatRepo.listenToMessages(roomId: roomId).listen((either) {
      either.fold(
        (failure) => emit(ChatFailureState(errorMsg: failure.message)),
        (messages) => emit(ChatLoadedState(messages: messages)),
      );
    });
  }

  Future<void> sendMessage({
    required String roomId,
    required String senderId,
    required String senderType,
    required String text,
  }) async {
    final MessageModel msg = MessageModel(
      id: '',
      roomId: roomId,
      senderId: senderId,
      senderType: senderType,
      message: text,
      createdAt: DateTime.now(),
    );

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
