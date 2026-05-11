import 'dart:io';

import '../../../../core/constants/constants.dart';
import '../../../../core/functions/user_data_local.dart';
import '../../../../core/helpers/logger.dart';
import '../../../../core/services/supabase_storage_service.dart';

/// Uploads community post images to Supabase storage.
class CommunityMediaService {
  final SupabaseStorageService _storageService;

  CommunityMediaService({required SupabaseStorageService storageService})
    : _storageService = storageService;

  Future<List<String>> uploadImages(List<File> files) async {
    if (files.isEmpty) return [];

    final String userId = getUser()!.userId;
    final List<String> uploadedUrls = <String>[];

    for (int i = 0; i < files.length; i++) {
      final file = files[i];
      final extension = file.path.split('.').last;
      final filePath =
          '$kPostsImagesPath/$userId/${DateTime.now().millisecondsSinceEpoch}_$i.$extension';

      await _storageService.uploadFile(
        file: file,
        filePath: filePath,
        bucketName: kCommunityImagesBucket,
      );
      final String publicUrl = _storageService.getFileUrl(
        filePath: filePath,
        bucketName: kCommunityImagesBucket,
      );
      Logger.log('Uploaded image to $publicUrl');
      uploadedUrls.add(publicUrl);
    }

    return uploadedUrls;
  }
}
