import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseCRUDService {
  final SupabaseClient _client;

  SupabaseCRUDService({required SupabaseClient client}) : _client = client;

  String? getCurrentUserId() => _client.auth.currentUser?.id;

  /// Add data
  Future<void> addData({
    required String table,
    required Map<String, dynamic> data,
  }) async {
    await _client.from(table).insert(data);
  }

  // Add data and return field
  Future<String> addDataAndReturnField({
    required String table,
    required String field,
    required Map<String, dynamic> data,
  }) async {
    final response = await _client
        .from(table)
        .insert(data)
        .select(field)
        .single();
    return response[field].toString();
  }

  Future<Map<String, dynamic>> addDataAndReturnRow({
    required String table,
    required Map<String, dynamic> data,
  }) async {
    final response = await _client
        .from(table)
        .insert(data)
        .select('*')
        .single();

    return Map<String, dynamic>.from(response);
  }

  /// Upsert data (insert or update on conflict)
  Future<void> upsertData({
    required String table,
    required Map<String, dynamic> data,
    String? onConflict,
  }) async {
    await _client.from(table).upsert(data, onConflict: onConflict);
  }

  /// Upsert single data (insert or update on conflict) and return the row
  Future<Map<String, dynamic>> upsertDataAndReturnRow({
    required String table,
    required Map<String, dynamic> data,
    String? onConflict,
  }) async {
    final response = await _client
        .from(table)
        .upsert(data, onConflict: onConflict)
        .select()
        .maybeSingle();

    return response!;
  }

  Future<List<Map<String, dynamic>>> getData({
    required String table,
    String select = '*',
    String? orderBy,
    bool ascending = true,
    int? limit,
    Map<String, dynamic>? filters,
  }) async {
    dynamic query = _client.from(table).select(select);

    if (filters != null) {
      filters.forEach((key, value) {
        query = query.eq(key, value);
      });
    }

    if (orderBy != null) {
      query = query.order(orderBy, ascending: ascending);
    }

    if (limit != null) {
      query = query.limit(limit);
    }

    final res = await query;
    return List<Map<String, dynamic>>.from(res);
  }

  /// Read / Get single row
  Future<Map<String, dynamic>?> getSingleRow({
    required String table,
    required String whereColumn,
    required dynamic whereValue,
  }) async {
    final res = await _client
        .from(table)
        .select()
        .eq(whereColumn, whereValue)
        .maybeSingle();

    if (res == null) return null;

    return Map<String, dynamic>.from(res);
  }

  /// Update data
  Future<void> updateData({
    required String table,
    required Map<String, dynamic> data,
    required String idColumn,
    required dynamic idValue,
  }) async {
    await _client.from(table).update(data).eq(idColumn, idValue);
  }

  /// Delete data
  Future<void> deleteData({
    required String table,
    required String idColumn,
    required dynamic idValue,
  }) async {
    await _client.from(table).delete().eq(idColumn, idValue);
  }

  /// Check if row exists
  Future<bool> isRowExists({
    required String table,
    required String column,
    required dynamic value,
  }) async {
    final response = await _client
        .from(table)
        .select(column)
        .eq(column, value)
        .maybeSingle();

    return response != null;
  }

  /// Realtime
  Stream<List<Map<String, dynamic>>> listenToTable({
    required String table,
    required List<String> primaryKey,
    Map<String, dynamic>? filters,
    String? orderBy,
    bool ascending = true,
  }) {
    final query =
        _client.from(table).stream(primaryKey: primaryKey)
            as Stream<List<Map<String, dynamic>>>;

    Stream<List<Map<String, dynamic>>> stream = query;

    if (filters != null) {
      filters.forEach((key, value) {
        stream = stream.map(
          (list) => list.where((row) => row[key] == value).toList(),
        );
      });
    }

    if (orderBy != null) {
      stream = stream.map((list) {
        list.sort((a, b) {
          final aVal = a[orderBy];
          final bVal = b[orderBy];
          if (aVal is Comparable && bVal is Comparable) {
            return ascending ? aVal.compareTo(bVal) : bVal.compareTo(aVal);
          }
          return 0;
        });
        return list;
      });
    }
    return stream;
  }
}
