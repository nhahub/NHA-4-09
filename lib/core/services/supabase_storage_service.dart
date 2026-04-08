import 'dart:io';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseStorageService {
  final SupabaseClient client;

  SupabaseStorageService({required this.client});

  Future<void> createBucket({required String bucketName}) async {
    final List<Bucket> buckets = await client.storage.listBuckets();

    final bool isBucketExist = buckets.any((bucket) => bucket.id == bucketName);

    if (!isBucketExist) {
      await client.storage.createBucket(bucketName);
    }
  }

  Future<String> uploadFile({
    required File file,
    required String filePath,
    required String userId,
    required String bucketName,
  }) async {
    // final String fileName = b.basename(file.path);

    final String finalName = "$userId.jpg";
    final String finalFilePath = "$filePath/$finalName";

    await client.storage
        .from(bucketName)
        .upload(
          finalFilePath,
          file,
          fileOptions: const FileOptions(upsert: true),
        );

    final String publicUrl = getFileUrl(
      filePath: finalFilePath,
      bucketName: bucketName,
    );

    return publicUrl;
  }

  String getFileUrl({required String filePath, required String bucketName}) {
    return client.storage.from(bucketName).getPublicUrl(filePath);
  }

  Future<void> deleteImageFromStorage({
    required String bucketName,
    required String filePath,
  }) async {
    await client.storage.from(bucketName).remove([filePath]);
  }
}
