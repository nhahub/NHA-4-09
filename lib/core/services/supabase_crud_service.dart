import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseCRUDService {
  final SupabaseClient client = Supabase.instance.client;

  /// Create / Add data
  Future<void> addData({
    required String table,
    required Map<String, dynamic> data,
  }) async {
    await client.from(table).insert(data);
  }

  /// Read / Get data
  Future<List<Map<String, dynamic>>> getData({
    required String table,
    String? orderBy,
    bool ascending = true,
    int? limit,
  }) async {
    final PostgrestFilterBuilder query = client.from(table).select();
    return List<Map<String, dynamic>>.from(query as List);
  }

  /// Update data
  Future<void> updateData({
    required String table,
    required Map<String, dynamic> data,
    required String idColumn,
    required dynamic idValue,
  }) async {
    await client.from(table).update(data).eq(idColumn, idValue);
  }

  /// Delete data
  Future<void> deleteData({
    required String table,
    required String idColumn,
    required dynamic idValue,
  }) async {
    await client.from(table).delete().eq(idColumn, idValue);
  }
}
