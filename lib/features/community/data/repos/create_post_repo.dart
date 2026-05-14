import 'dart:io';

import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:uuid/uuid.dart';

import '../models/post_model.dart';
import '../services/community_media_service.dart';
import '../services/community_posts_remote_service.dart';

class CreatePostRepo {
  final CommunityPostsRemoteService _postsRemote;
  final CommunityMediaService _mediaService;
  final Uuid _uuid = const Uuid();

  CreatePostRepo({
    required CommunityPostsRemoteService postsRemote,
    required CommunityMediaService mediaService,
  }) : _postsRemote = postsRemote,
       _mediaService = mediaService;

  Future<List<String>> uploadImages(List<File> files) async {
    return _mediaService.uploadImages(files);
  }

  Future<void> createPost(PostModel post) async {
    await _postsRemote.insertPostRow({
      'id': post.id,
      'user_id': post.userId,
      'content': post.content.trim(),
    });

    if (post.imageUrls.isNotEmpty) {
      for (int i = 0; i < post.imageUrls.length; i++) {
        await _postsRemote.insertPostMediaRow({
          'id': _uuid.v4(),
          'post_id': post.id,
          'media_url': post.imageUrls[i],
          'media_type': 'image',
          'sort_order': i,
        });
      }
    }
  }

  Future<List<PostModel>> getPosts() async {
    final rows = await _postsRemote.fetchFeedRows();
    final currentUserId = _postsRemote.currentUserId;

    final postIds = rows
        .map((r) => (r['id'] ?? '').toString())
        .where((id) => id.isNotEmpty)
        .toList();

    final mediaByPost = await _postsRemote.fetchMediaUrlsByPostIds(postIds);

    final postsFromDb = <PostModel>[];
    for (final row in rows) {
      postsFromDb.add(_mapFeedRow(row, mediaByPost, currentUserId));
    }

    return postsFromDb;
  }

  Future<void> togglePostLike({
    required String postId,
    required bool isCurrentlyLiked,
  }) {
    return _postsRemote.togglePostLike(
      postId: postId,
      isCurrentlyLiked: isCurrentlyLiked,
    );
  }

  Future<void> recordShare(String postId) {
    return _postsRemote.incrementSharesCount(postId);
  }

  RealtimeChannel subscribeCommunityFeed(void Function() onChanged) {
    return _postsRemote.subscribeCommunityFeed(onChanged);
  }

  void unsubscribeCommunityFeed(RealtimeChannel channel) {
    _postsRemote.removeChannel(channel);
  }

  PostModel _mapFeedRow(
    Map<String, dynamic> row,
    Map<String, List<String>> mediaByPost,
    String? currentUserId,
  ) {
    final postId = (row['id'] ?? '').toString();
    final likesRaw = row['community_post_likes'] as List<dynamic>? ?? [];
    final loveCount = likesRaw.length;
    final isLiked =
        currentUserId != null &&
        likesRaw.any((e) {
          final m = e as Map<String, dynamic>;
          return m['user_id'] == currentUserId;
        });

    return PostModel(
      id: postId,
      userId: (row['user_id'] ?? '').toString(),
      userName: (row['user_name'] ?? '').toString(),
      userImage: (row['user_image'] ?? '').toString(),
      content: (row['content'] ?? '').toString(),
      imageUrls: mediaByPost[postId] ?? [],
      createdAt:
          DateTime.tryParse((row['created_at'] ?? '').toString())?.toLocal() ??
          DateTime.now(),
      loveCount: loveCount,
      commentsCount: ((row['comments_count'] ?? 0) as num).toInt(),
      sharesCount: ((row['shares_count'] ?? 0) as num).toInt(),
      isLikedByCurrentUser: isLiked,
    );
  }
}
