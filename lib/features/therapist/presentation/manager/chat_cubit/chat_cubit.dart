import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moodly/features/auth/data/repos/user_data_repo.dart';
import 'package:uuid/uuid.dart';
import '../../../../../core/functions/user_data_local.dart';
import '../../../../../core/models/user_data_model.dart';
import '../../../../../core/networking/api_error_handler.dart';
import '../../../data/models/message_model.dart';
import '../../../data/repos/chat_repo.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  final ChatRepo _chatRepo;
  final UserDataRepo _userDataRepo;
  StreamSubscription<List<MessageModel>>? _sub;

  ChatCubit({required ChatRepo chatRepo, required UserDataRepo userDataRepo})
    : _chatRepo = chatRepo,
      _userDataRepo = userDataRepo,
      super(const ChatState(status: ChatStatus.initial));

  String? _roomId;

  Future<void> loadMessages({
    required String therapistId,
    required String userId,
  }) async {
    emit(state.copyWith(status: ChatStatus.loading));

    try {
      final roomId = await _chatRepo.getOrCreateRoom(
        therapistId: therapistId,
        userId: userId,
      );

      _roomId = roomId;

      final messages = await _chatRepo.getMessages(roomId: roomId);
      final UserDataModel? userData = await _userDataRepo.getUserData(
        userId: userId,
      );

      emit(
        state.copyWith(
          status: ChatStatus.success,
          messages: messages,
          userName: userData?.name ?? '',
          userImage: userData?.picture ?? '',
        ),
      );

      await _sub?.cancel();
      _sub = _chatRepo
          .listenToMessages(roomId: roomId)
          .listen(
            (messages) {
              emit(
                state.copyWith(status: ChatStatus.success, messages: messages),
              );
            },
            onError: (error) {
              emit(
                state.copyWith(
                  status: ChatStatus.failure,
                  errorMsg: ApiErrorHandler.handle(error: error).message,
                ),
              );
            },
          );
    } catch (e) {
      emit(
        state.copyWith(
          status: ChatStatus.failure,
          errorMsg: ApiErrorHandler.handle(error: e).message,
        ),
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

    if (state.messages != null) {
      final currentMessages = List<MessageModel>.from(state.messages!);

      currentMessages.add(msg);

      emit(state.copyWith(messages: currentMessages));
    }

    try {
      await _chatRepo.sendMessage(msg: msg);
    } catch (e) {
      emit(
        state.copyWith(
          status: ChatStatus.failure,
          errorMsg: ApiErrorHandler.handle(error: e).message,
        ),
      );
    }
  }

  @override
  Future<void> close() {
    _sub?.cancel();
    return super.close();
  }
}
