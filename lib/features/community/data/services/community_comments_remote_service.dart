import 'package:moodly/core/functions/user_data_local.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/services/supabase_crud_service.dart';
import '../models/comment_model.dart';

class CommunityCommentsRemoteService {
  final SupabaseCRUDService _crudService;
  final SupabaseClient _client;

  CommunityCommentsRemoteService({
    required SupabaseCRUDService crudService,
    required SupabaseClient client,
  }) : _crudService = crudService,
       _client = client;

  static const String _commentSelect = '''
  *,
  community_comment_likes(user_id),
  user_data (
    name,
    picture
  )
''';
  final currentUserId = getUser()!.userId;

  Future<List<CommentModel>> fetchTopLevelComments(String postId) async {
    final response = await _crudService.getData(
      table: kCommunityCommentsTable,
      select: _commentSelect,
      orderBy: 'created_at',
      ascending: false,
      filters: {'post_id': postId, 'parent_id': null},
    );

    final rawData = List<Map<String, dynamic>>.from(response as List<dynamic>);

    return rawData.map((json) {
      final likes = json['community_comment_likes'] as List<dynamic>? ?? [];
      final isLikedByMe = likes.any((like) {
        final m = like as Map<String, dynamic>;
        return m['user_id'] == currentUserId;
      });

      return CommentModel.fromJson(json, isLikedByMe: isLikedByMe);
    }).toList();
  }

  Future<List<CommentModel>> fetchReplies(String parentCommentId) async {
    final response = await _crudService.getData(
      table: kCommunityCommentsTable,
      select: _commentSelect,
      orderBy: 'created_at',
      ascending: true,
      filters: {'parent_id': parentCommentId},
    );

    final rawData = List<Map<String, dynamic>>.from(response as List<dynamic>);

    return rawData.map((json) {
      final likes = json['community_comment_likes'] as List<dynamic>? ?? [];
      final isLikedByMe = likes.any((like) {
        final m = like as Map<String, dynamic>;
        return m['user_id'] == currentUserId;
      });

      return CommentModel.fromJson(json, isLikedByMe: isLikedByMe);
    }).toList();
  }

  Future<CommentModel> addComment({
    required String postId,
    required String content,
    String? parentId,
  }) async {
    final dataToInsert = {
      'post_id': postId,
      'user_id': currentUserId,
      'content': content,
      if (parentId != null) 'parent_id': parentId,
    };

    final insertedRow = await _crudService.addDataAndReturnRow(
      table: kCommunityCommentsTable,
      data: dataToInsert,
      select: '''
      *,
      user_data (
        name,
        picture
      )
    ''',
    );
    return CommentModel.fromJson(insertedRow, isLikedByMe: false);
  }

  /// Returns the new liked flag
  Future<bool> toggleLike({
    required String commentId,
    required bool isCurrentlyLiked,
  }) async {
    final currentUserId = getUser()!.userId;

    if (isCurrentlyLiked) {
      await _crudService.deleteDataByMatch(
        table: kCommunityCommentLikesTable,
        match: {'comment_id': commentId, 'user_id': currentUserId},
      );
    } else {
      await _crudService.addData(
        table: kCommunityCommentLikesTable,
        data: {'comment_id': commentId, 'user_id': currentUserId},
      );
    }
    return !isCurrentlyLiked;
  }

  RealtimeChannel subscribeToPostComments(
    String postId,
    void Function() onChanged,
  ) {
    final channel = _client.channel(
      'community-comments-${postId}_${DateTime.now().millisecondsSinceEpoch}',
    );

    channel.onPostgresChanges(
      event: PostgresChangeEvent.all,
      schema: 'public',
      table: kCommunityCommentsTable,
      callback: (payload) {
        final Map<String, dynamic> raw =
            payload.eventType == PostgresChangeEvent.delete
            ? payload.oldRecord
            : payload.newRecord;
        if (raw['post_id']?.toString() == postId) {
          onChanged();
        }
      },
    );

    channel.subscribe();
    return channel;
  }

  void removeChannel(RealtimeChannel channel) {
    _client.removeChannel(channel);
  }
}
