import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/services/supabase_crud_service.dart';

/// Remote persistence and realtime hooks for community posts and media.
class CommunityPostsRemoteService {
  final SupabaseClient _client;
  final SupabaseCRUDService _crudService;

  CommunityPostsRemoteService({
    required SupabaseClient client,
    required SupabaseCRUDService crudService,
  }) : _client = client,
       _crudService = crudService;

  String? get currentUserId => _crudService.getCurrentUserId();

  static const String _feedSelect = '''
id,
user_id,
content,
created_at,
shares_count,
comments_count,
user_data(name, picture),
community_post_likes(user_id)
''';

  /// Single query: posts with owner profile, like rows for counts + current user flag.
  Future<List<Map<String, dynamic>>> fetchFeedRows() async {
    final response = await _client
        .from(kCommunityPostsTable)
        .select(_feedSelect)
        .order('created_at', ascending: false);

    return List<Map<String, dynamic>>.from(response as List<dynamic>);
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

  Future<void> insertPostRow(Map<String, dynamic> data) async {
    await _crudService.addData(table: kCommunityPostsTable, data: data);
  }

  Future<void> insertPostMediaRow(Map<String, dynamic> data) async {
    await _crudService.addData(table: kCommunityPostMediaTable, data: data);
  }

  Future<void> togglePostLike({
    required String postId,
    required bool isCurrentlyLiked,
  }) async {
    final uid = _crudService.getCurrentUserId();
    if (uid == null) throw Exception('User not logged in');

    if (isCurrentlyLiked) {
      await _crudService.deleteDataByMatch(
        table: kCommunityPostLikesTable,
        match: {'post_id': postId, 'user_id': uid},
      );
    } else {
      await _crudService.addData(
        table: kCommunityPostLikesTable,
        data: {'post_id': postId, 'user_id': uid},
      );
    }
  }

  Future<void> incrementSharesCount(String postId) async {
    await _client.rpc<void>(
      'increment_community_post_shares',
      params: <String, dynamic>{'p_post_id': postId},
    );
  }

  /// Subscribe to feed-related tables; caller owns lifecycle ([RealtimeChannel.unsubscribe]).
  RealtimeChannel subscribeCommunityFeed(void Function() onChanged) {
    final channel = _client.channel('community-feed-${DateTime.now().millisecondsSinceEpoch}');

    void listen(String table) {
      channel.onPostgresChanges(
        event: PostgresChangeEvent.all,
        schema: 'public',
        table: table,
        callback: (_) => onChanged(),
      );
    }

    listen(kCommunityPostsTable);
    listen(kCommunityPostMediaTable);
    listen(kCommunityPostLikesTable);
    listen(kCommunityCommentsTable);

    channel.subscribe();
    return channel;
  }

  void removeChannel(RealtimeChannel channel) {
    _client.removeChannel(channel);
  }
}
