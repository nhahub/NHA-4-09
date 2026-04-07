import 'dart:io';
import 'package:moodly/core/constants/constants.dart';
import 'package:path/path.dart' as b;
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseStorageService {
  final SupabaseClient client;

  SupabaseStorageService({required this.client});

  createBuckets({required String bucketName}) async {
    List<Bucket> bucket = await client.storage.listBuckets();

    bool isBucketExist = false;

    for (Bucket mybucket in bucket) {
      if (mybucket.id == bucketName) {
        isBucketExist = true;
        break;
      }
    }
    if (!isBucketExist) {
      await client.storage.createBucket(bucketName);
    }
  }

  Future<File> uploadFile({
    required File file,
    required String path,
    String? uid,
  }) async {
    String fileName = b.basename(file.path);
    if (uid == null) {
      String urlToSupabase = await client.storage
          .from(kBucketName)
          .upload('$path/$fileName', file);
      return File(urlToSupabase);
    } else {
      String urlToSupabase = await client.storage
          .from(kBucketName)
          .upload('$path/$uid$fileName', file);
      return File(urlToSupabase);
    }
  }

  Future<String> getImage({
    required File file,
    required String path,
    String? uid,
  }) async {
    String fileName = b.basename(file.path);
    if (uid == null) {
      String urlFromSupabase = client.storage
          .from(kBucketName)
          .getPublicUrl('$path/$fileName');
      return urlFromSupabase;
    } else {
      String urlFromSupabase = client.storage
          .from(kBucketName)
          .getPublicUrl('$path/$uid$fileName');
      return urlFromSupabase;
    }
  }

  Future<void> deleteImageFromStorage({
    required String bucket,
    required String filePath,
  }) async {
    final supabase = Supabase.instance.client;

    await supabase.storage.from(bucket).remove([filePath]);
  }
}
