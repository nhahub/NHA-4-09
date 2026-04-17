import 'dart:io';

import '../../../../core/constants/constants.dart';
import '../../../../core/functions/user_data_local.dart';
import '../../../../core/models/user_data_model.dart';
import '../../../../core/services/supabase_crud_service.dart';
import '../../../../core/services/supabase_storage_service.dart';
import '../../../auth/data/services/user_data_service.dart';

class UpdateProfileRepo {
  final UserDataService _userDataService;
  final SupabaseStorageService _supabaseStorageService;
  final SupabaseCRUDService _supabaseCRUDService;

  UpdateProfileRepo({
    required UserDataService userDataService,
    required SupabaseStorageService supabaseStorageService,
    required SupabaseCRUDService supabaseCRUDService,
  }) : _supabaseCRUDService = supabaseCRUDService,
       _supabaseStorageService = supabaseStorageService,
       _userDataService = userDataService;

  Future<UserDataModel?> updateProfile({
    String? name,
    String? phone,
    File? file,
  }) async {
    String? imageUrl;

    if (file != null) {
      imageUrl = await _uploadProfileImageToStorage(imageFile: file);
    }

    await _userDataService.updateUserFields(
      name: name,
      phone: phone,
      picture: imageUrl == getUser()?.picture ? null : imageUrl,
    );

    final UserDataModel uploadResult = await _updateCachedUserProfilePicture(
      newPictureUrl: imageUrl,
      newName: name,
      newPhone: phone,
    );

    return uploadResult;
  }

  Future<String> _uploadProfileImageToStorage({required File imageFile}) async {
    final String userId = _supabaseCRUDService.getCurrentUserId()!;
    final String filePath = "$kProfileImagesPath/$userId.jpg";

    await _supabaseStorageService.uploadFile(
      file: imageFile,
      bucketName: kUsersImagesBucket,
      filePath: filePath,
    );

    final String publicUrl = _supabaseStorageService.getFileUrl(
      filePath: filePath,
      bucketName: kUsersImagesBucket,
    );

    return publicUrl;
  }

  Future<UserDataModel> _updateCachedUserProfilePicture({
    String? newPictureUrl,
    String? newName,
    String? newPhone,
  }) async {
    final UserDataModel newUserData = getUser()!.copyWith(
      picture: newPictureUrl,
      name: newName,
      phone: newPhone,
    );
    await saveUserDataLocal(userDataModel: newUserData);
    return newUserData;
  }
}
