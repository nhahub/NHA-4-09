import 'dart:io';
import 'package:moodly/core/constants/constants.dart';
import 'package:moodly/core/extensions/string_extensions.dart';
import 'package:moodly/core/helpers/logger.dart';
import 'package:moodly/core/models/user_data_model.dart';
import 'package:moodly/core/networking/api_error_handler.dart';
import 'package:moodly/core/services/supabase_crud_service.dart';
import 'package:moodly/core/services/supabase_storage_service.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/functions/user_data_local.dart';
import 'package:dartz/dartz.dart';

class ImagesRepo {
  final SupabaseStorageService supabaseStorageService;
  final SupabaseCRUDService supabaseCRUDService;
  ImagesRepo({
    required this.supabaseStorageService,
    required this.supabaseCRUDService,
  });

  Future<Either<Failure, String>> uploadProfileImageToStorage({
    required File imageFile,
  }) async {
    try {
      String url = await supabaseStorageService.uploadFile(
        file: imageFile,
        bucketName: kUsersImagesBucket,
        filePath: kProfileImagesPath,
        userId: supabaseCRUDService.getCurrentUserId(),
      );

      return right(url);
    } catch (e) {
      return left(ApiErrorHandler.handle(error: e));
    }
  }

  Future<void> updateCachedUserProfilePicture({
    required String newPictureUrl,
  }) async {
    final UserDataModel newUserData = getUser()!.copyWith(
      picture: newPictureUrl,
    );
    return await saveUserDataLocal(userDataModel: newUserData);
  }

  Future<Either<Failure, void>> deleteImageFromStorage() async {
    try {
      final UserDataModel currentUser = getUser()!;

      if (currentUser.picture.isNullOrEmpty()) return const Right(null);

      String filePath = _extractFilePathFromUrl(imageUrl: currentUser.picture!);
      Logger.log(filePath);

      await supabaseStorageService.deleteImageFromStorage(
        bucketName: kUsersImagesBucket,
        filePath: filePath,
      );
      Logger.log("TRY DELETE: ${currentUser.picture}");
      Logger.log("EXTRACTED PATH: $filePath");
      return const Right(null);
    } catch (e) {
      Logger.log(e.toString());
      return left(ApiErrorHandler.handle(error: e));
    }
  }

  String _extractFilePathFromUrl({required String imageUrl}) {
    final uri = Uri.parse(imageUrl);

    final segments = uri.pathSegments;

    final bucketIndex = segments.indexOf(kUsersImagesBucket);

    if (bucketIndex == -1) {
      throw Exception("Bucket not found in URL");
    }

    final filePath = segments.sublist(bucketIndex + 1).join('/');

    return filePath;
  }
}
