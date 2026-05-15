import '../models/message_model.dart';
import '../services/chat_service.dart';

class ChatRepo {
  final ChatService _chatService;

  ChatRepo({required ChatService chatService}) : _chatService = chatService;

  Future<String> getOrCreateRoom({
    required String therapistId,
    required String userId,
  }) async {
    final String roomId = await _chatService.getOrCreateRoom(
      userId: userId,
      therapistId: therapistId,
    );
    return roomId;
  }

  Future<List<MessageModel>> getMessages({required String roomId}) async {
    final List<Map<String, dynamic>> data = await _chatService.getMessages(
      roomId: roomId,
    );
    final List<MessageModel> messages = data
        .map((e) => MessageModel.fromJson(e))
        .toList();
    return messages;
  }

  Future<void> sendMessage({required MessageModel msg}) async {
    await _chatService.sendMessage(data: msg.toJson());
  }

  Stream<List<MessageModel>> listenToMessages({required String roomId}) {
    return _chatService.listenToMessages(roomId).map((data) {
      return data.map<MessageModel>((e) => MessageModel.fromJson(e)).toList();
    });
  }
}
