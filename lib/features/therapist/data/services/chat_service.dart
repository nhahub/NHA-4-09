import '../../../../core/constants/constants.dart';
import '../../../../core/services/supabase_crud_service.dart';

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
}
