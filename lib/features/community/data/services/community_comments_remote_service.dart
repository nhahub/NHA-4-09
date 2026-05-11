import '../../../../core/constants/constants.dart';
import '../../../../core/services/supabase_crud_service.dart';
import '../models/comment_model.dart';

/// Supabase reads/writes for community comments (no mock data).
///
/// Pagination, realtime, or richer filters can extend these methods without
/// changing [CommentsRepo] call sites.
class CommunityCommentsRemoteService {
  final SupabaseCRUDService _crudService;

  CommunityCommentsRemoteService({required SupabaseCRUDService crudService})
    : _crudService = crudService;

  static const String _commentSelect =
      '*, profiles(name, picture), community_comment_likes(user_id)';

  Future<List<CommentModel>> fetchTopLevelComments(String postId) async {
    final currentUserId = _crudService.getCurrentUserId();
    final List<Map<String, dynamic>> rawData = await _crudService.getData(
      table: kCommunityCommentsTable,
      select: _commentSelect,
      filters: {'post_id': postId},
      orderBy: 'created_at',
      ascending: false,
    );

    final topLevelRows = rawData
        .where((json) => json['parent_id'] == null)
        .toList();

    return topLevelRows.map((json) {
      final likes = json['community_comment_likes'] as List<dynamic>? ?? [];
      final isLikedByMe =
          currentUserId != null &&
          likes.any((like) => like['user_id'] == currentUserId);

      return CommentModel.fromJson(json, isLikedByMe: isLikedByMe);
    }).toList();
  }

  Future<List<CommentModel>> fetchReplies(String parentCommentId) async {
    final currentUserId = _crudService.getCurrentUserId();
    final List<Map<String, dynamic>> rawData = await _crudService.getData(
      table: kCommunityCommentsTable,
      select: _commentSelect,
      filters: {'parent_id': parentCommentId},
      orderBy: 'created_at',
      ascending: true,
    );

    return rawData.map((json) {
      final likes = json['community_comment_likes'] as List<dynamic>? ?? [];
      final isLikedByMe =
          currentUserId != null &&
          likes.any((like) => like['user_id'] == currentUserId);

      return CommentModel.fromJson(json, isLikedByMe: isLikedByMe);
    }).toList();
  }

  Future<CommentModel> insertComment({
    required String postId,
    required String content,
    String? parentId,
  }) async {
    final currentUserId = _crudService.getCurrentUserId();
    if (currentUserId == null) {
      throw Exception('User not logged in');
    }

    final dataToInsert = {
      'post_id': postId,
      'user_id': currentUserId,
      'content': content,
      if (parentId != null) 'parent_id': parentId,
    };

    final insertedRow = await _crudService.addDataAndReturnRow(
      table: kCommunityCommentsTable,
      data: dataToInsert,
    );

    final profile = await _crudService.getSingleRow(
      table: kProfilesTable,
      filters: {'id': currentUserId},
    );

    insertedRow['profiles'] = profile;
    return CommentModel.fromJson(insertedRow, isLikedByMe: false);
  }

  /// Returns the new liked flag, or [isCurrentlyLiked] if the operation failed.
  Future<bool> toggleLike({
    required String commentId,
    required bool isCurrentlyLiked,
  }) async {
    final currentUserId = _crudService.getCurrentUserId();
    if (currentUserId == null) throw Exception('User not logged in');

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
}
