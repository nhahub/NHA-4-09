import 'dart:io';

import 'package:uuid/uuid.dart';

import '../models/post_model.dart';
import '../services/community_media_service.dart';
import '../services/community_posts_remote_service.dart';

/// Coordinates post feed loading and post creation (services own raw I/O).
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
    await _postsRemote.insertPost(post.toJson());

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
    final rows = await _postsRemote.fetchPostRows();
    final postIds = rows
        .map((r) => (r['id'] ?? '').toString())
        .where((id) => id.isNotEmpty)
        .toList();

    final mediaByPost = await _postsRemote.fetchMediaUrlsByPostIds(postIds);

    final postsFromDb = <PostModel>[];
    for (final row in rows) {
      final postId = (row['id'] ?? '').toString();
      final imageUrls = mediaByPost[postId] ?? [];

      postsFromDb.add(
        PostModel(
          id: postId,
          userId: (row['user_id'] ?? '').toString(),
          userName: (row['user_name'] ?? '').toString(),
          userImage: (row['user_image'] ?? '').toString(),
          content: (row['content'] ?? '').toString(),
          imageUrls: imageUrls,
          createdAt:
              DateTime.tryParse((row['created_at'] ?? '').toString()) ??
              DateTime.now(),
          loveCount: ((row['likes_count'] ?? 0) as num).toInt(),
          commentsCount: ((row['comments_count'] ?? 0) as num).toInt(),
          sharesCount: ((row['shares_count'] ?? 0) as num).toInt(),
        ),
      );
    }

    return postsFromDb;
  }
}
