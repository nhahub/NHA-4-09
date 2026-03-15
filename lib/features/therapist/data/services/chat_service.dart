import '../../../../core/constants/constants.dart';
import '../../../../core/services/supabase_crud_service.dart';
import '../models/chat_room_model.dart';

class ChatService {
  final SupabaseCRUDService supabaseCRUDService;

  ChatService({required this.supabaseCRUDService});

  Future<List<Map<String, dynamic>>> getMessages({required String roomId}) {
    return supabaseCRUDService.getData(
      table: kMessagesTable,
      filters: {'room_id': roomId},
      orderBy: 'created_at',
    );
  }

  Future<void> sendMessage({required Map<String, dynamic> data}) {
    return supabaseCRUDService.addData(table: kMessagesTable, data: data);
  }

  Stream<List<Map<String, dynamic>>> listenToMessages(String roomId) {
    return supabaseCRUDService.listenToTable(
      table: kMessagesTable,
      primaryKey: ['id'],
      filters: {'room_id': roomId},
      orderBy: 'created_at',
    );
  }

  Future<String> getOrCreateRoom({
    required String userId,
    required String therapistId,
  }) async {
    // Check if room exists
    final rooms = await supabaseCRUDService.getData(
      table: kChatRoomsTable,
      filters: {'user_id': userId, 'therapist_id': therapistId},
    );

    if (rooms.isNotEmpty) {
      final room = ChatRoomModel.fromJson(rooms.first);
      return room.id;
    }

    // Create new room
    final roomId = await supabaseCRUDService.addDataAndReturnId(
      table: kChatRoomsTable,
      data: {'user_id': userId, 'therapist_id': therapistId},
    );

    return roomId;
  }
}
