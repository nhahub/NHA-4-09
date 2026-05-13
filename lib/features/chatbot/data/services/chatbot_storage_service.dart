import '../../../../core/services/supabase_crud_service.dart';
import '../models/chat_message_model.dart';
import '../models/chat_session_model.dart';

// ── Table names (create these in your Supabase project) ────────────────────
// Table: chat_sessions
//   id          uuid  PK default gen_random_uuid()
//   user_id     uuid  FK → auth.users
//   title       text
//   created_at  timestamptz default now()
//   updated_at  timestamptz default now()
//
// Table: chat_messages
//   id          uuid  PK default gen_random_uuid()
//   session_id  uuid  FK → chat_sessions.id
//   user_id     uuid  FK → auth.users
//   role        text  ('user' | 'assistant')
//   content     text
//   created_at  timestamptz default now()
//
// Enable Row-Level Security and add policies so users only see their own rows.
// ────────────────────────────────────────────────────────────────────────────

const _kSessionsTable = 'chat_sessions';
const _kMessagesTable = 'chat_messages';

class ChatbotStorageService {
  final SupabaseCRUDService _crud;

  ChatbotStorageService({required SupabaseCRUDService supabaseCRUDService})
      : _crud = supabaseCRUDService;

  String? get _userId => _crud.getCurrentUserId();

  // ── Sessions ──────────────────────────────────────────────────────────────

  Future<List<ChatSessionModel>> getSessions() async {
    final rows = await _crud.getData(
      table: _kSessionsTable,
      filters: {'user_id': _userId},
      orderBy: 'updated_at',
      ascending: false,
    );
    return rows.map(ChatSessionModel.fromJson).toList();
  }

  Future<ChatSessionModel> createSession(String title) async {
    final row = await _crud.addDataAndReturnRow(
      table: _kSessionsTable,
      data: {'user_id': _userId, 'title': title},
    );
    return ChatSessionModel.fromJson(row);
  }

  Future<void> updateSessionTitle(String sessionId, String title) async {
    await _crud.updateData(
      table: _kSessionsTable,
      data: {'title': title, 'updated_at': DateTime.now().toIso8601String()},
      idColumn: 'id',
      idValue: sessionId,
    );
  }

  Future<void> deleteSession(String sessionId) async {
    // messages cascade-delete via FK in Supabase
    await _crud.deleteData(
      table: _kSessionsTable,
      idColumn: 'id',
      idValue: sessionId,
    );
  }

  // ── Messages ──────────────────────────────────────────────────────────────

  Future<List<ChatMessageModel>> getMessages(String sessionId) async {
    final rows = await _crud.getData(
      table: _kMessagesTable,
      filters: {'session_id': sessionId},
      orderBy: 'created_at',
      ascending: true,
    );
    return rows.map(ChatMessageModel.fromJson).toList();
  }

  Future<ChatMessageModel> saveMessage({
    required String sessionId,
    required String role,
    required String content,
  }) async {
    final row = await _crud.addDataAndReturnRow(
      table: _kMessagesTable,
      data: {
        'session_id': sessionId,
        'user_id': _userId,
        'role': role,
        'content': content,
      },
    );
    // bump session updated_at
    await _crud.updateData(
      table: _kSessionsTable,
      data: {'updated_at': DateTime.now().toIso8601String()},
      idColumn: 'id',
      idValue: sessionId,
    );
    return ChatMessageModel.fromJson(row);
  }

  Future<void> clearMessages(String sessionId) async {
    // Delete all messages for a session (Supabase doesn't have a bulk-delete
    // with filters in the generic CRUD service, so we add it here directly).
    await _crud.deleteData(
      table: _kMessagesTable,
      idColumn: 'session_id',
      idValue: sessionId,
    );
  }
}
