import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/networking/api_error_handler.dart';
import '../models/message_model.dart';
import '../services/chat_service.dart';

class ChatRepo {
  final ChatService chatService;

  ChatRepo({required this.chatService});

  Future<Either<Failure, List<MessageModel>>> getMessages({
    required String roomId,
  }) async {
    try {
      final List<Map<String, dynamic>> data = await chatService.getMessages(
        roomId: roomId,
      );
      final List<MessageModel> messages = data
          .map((e) => MessageModel.fromJson(e))
          .toList();
      return right(messages);
    } catch (e) {
      return left(ApiErrorHandler.handle(error: e));
    }
  }

  Future<Either<Failure, void>> sendMessage({required MessageModel msg}) async {
    try {
      await chatService.sendMessage(data: msg.toJson());
      return right(null);
    } catch (e) {
      return left(ApiErrorHandler.handle(error: e));
    }
  }

  Stream<Either<Failure, List<MessageModel>>> listenToMessages({
    required String roomId,
  }) {
    return chatService
        .listenToMessages(roomId)
        .map((data) {
          try {
            final messages = data.map((e) => MessageModel.fromJson(e)).toList();

            return right<Failure, List<MessageModel>>(messages);
          } catch (e) {
            return left<Failure, List<MessageModel>>(
              ApiErrorHandler.handle(error: e),
            );
          }
        })
        .handleError((error) {
          return left<Failure, List<MessageModel>>(
            ApiErrorHandler.handle(error: error),
          );
        });
  }
}
