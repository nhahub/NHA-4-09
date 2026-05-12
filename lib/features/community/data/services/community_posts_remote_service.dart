import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/services/supabase_crud_service.dart';

/// Remote persistence for community posts and post media.
class CommunityPostsRemoteService {
  final SupabaseClient _client;
  final SupabaseCRUDService _crudService;

  CommunityPostsRemoteService({
    required SupabaseClient client,
    required SupabaseCRUDService crudService,
  }) : _client = client,
       _crudService = crudService;

  Future<List<Map<String, dynamic>>> fetchPostRows() async {
    return _crudService.getData(
      table: kCommunityPostsTable,
      orderBy: 'created_at',
      ascending: false,
    );
  }

  /// One round-trip for all media rows, grouped by post id and ordered by [sort_order].
  Future<Map<String, List<String>>> fetchMediaUrlsByPostIds(
    List<String> postIds,
  ) async {
    if (postIds.isEmpty) return {};

    final response = await _client
        .from(kCommunityPostMediaTable)
        .select()
        .inFilter('post_id', postIds)
        .order('sort_order', ascending: true);

    final rows = List<Map<String, dynamic>>.from(response as List<dynamic>);

    final byPost = <String, List<Map<String, dynamic>>>{};
    for (final row in rows) {
      final postId = (row['post_id'] ?? '').toString();
      if (postId.isEmpty) continue;
      byPost.putIfAbsent(postId, () => []).add(row);
    }

    return byPost.map((postId, mediaRows) {
      mediaRows.sort((a, b) {
        final ao = (a['sort_order'] ?? 0) as num;
        final bo = (b['sort_order'] ?? 0) as num;
        return ao.compareTo(bo);
      });
      final urls = mediaRows
          .map((e) => (e['media_url'] ?? '').toString())
          .where((u) => u.isNotEmpty)
          .toList();
      return MapEntry(postId, urls);
    });
  }

  Future<void> insertPost(Map<String, dynamic> data) async {
    await _crudService.addData(table: kCommunityPostsTable, data: data);
  }

  Future<void> insertPostMediaRow(Map<String, dynamic> data) async {
    await _crudService.addData(table: kCommunityPostMediaTable, data: data);
  }
}
