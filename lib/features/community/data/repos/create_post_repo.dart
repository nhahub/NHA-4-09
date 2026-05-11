import 'dart:io';
import 'package:moodly/core/functions/user_data_local.dart';
import 'package:moodly/core/helpers/logger.dart';
import 'package:uuid/uuid.dart';
import '../../../../core/constants/constants.dart';
import '../../../../core/services/supabase_crud_service.dart';
import '../../../../core/services/supabase_storage_service.dart';
import '../../../auth/data/repos/user_data_repo.dart';
import '../models/post_model.dart';

class CreatePostRepo {
  final SupabaseCRUDService _supabaseCRUDService;
  final SupabaseStorageService _supabaseStorageService;

  final List<PostModel> _localPosts = [];
  final Uuid _uuid = const Uuid();

  CreatePostRepo({
    required SupabaseCRUDService supabaseCRUDService,
    required SupabaseStorageService supabaseStorageService,
    required UserDataRepo userDataRepo,
  }) : _supabaseCRUDService = supabaseCRUDService,
       _supabaseStorageService = supabaseStorageService;

  Future<List<String>> uploadImages(List<File> files) async {
    if (files.isEmpty) return [];

    final String userId = getUser()!.userId;
    final List<String> uploadedUrls = <String>[];

    for (int i = 0; i < files.length; i++) {
      final file = files[i];
      final extension = file.path.split('.').last;
      final filePath =
          '$kPostsImagesPath/$userId/${DateTime.now().millisecondsSinceEpoch}_$i.$extension';

      await _supabaseStorageService.uploadFile(
        file: file,
        filePath: filePath,
        bucketName: kCommunityImagesBucket,
      );
      final String publicUrl = _supabaseStorageService.getFileUrl(
        filePath: filePath,
        bucketName: kCommunityImagesBucket,
      );
      Logger.log('Uploaded image to $publicUrl');
      uploadedUrls.add(publicUrl);
    }

    return uploadedUrls;
  }

  Future<void> createPost(PostModel post) async {
    await _supabaseCRUDService.addData(
      table: kCommunityPostsTable,
      data: post.toJson(),
    );

    if (post.imageUrls.isNotEmpty) {
      for (int i = 0; i < post.imageUrls.length; i++) {
        await _supabaseCRUDService.addData(
          table: kCommunityPostMediaTable,
          data: {
            'id': _uuid.v4(),
            'post_id': post.id,
            'media_url': post.imageUrls[i],
            'media_type': 'image',
            'sort_order': i,
          },
        );
      }
    }
  }

  Future<List<PostModel>> getPosts() async {
    final rows = await _supabaseCRUDService.getData(
      table: kCommunityPostsTable,
      orderBy: 'created_at',
      ascending: false,
    );

    final postsFromDb = <PostModel>[];
    for (final row in rows) {
      final postId = (row['id'] ?? '').toString();
      final mediaRows = await _supabaseCRUDService.getData(
        table: kCommunityPostMediaTable,
        filters: {'post_id': postId},
        orderBy: 'sort_order',
        ascending: true,
      );

      final imageUrls = mediaRows
          .map((e) => (e['media_url'] ?? '').toString())
          .where((e) => e.isNotEmpty)
          .toList();

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

    if (_localPosts.isNotEmpty) {
      return [..._localPosts, ...postsFromDb];
    }
    return postsFromDb;
  }
}
