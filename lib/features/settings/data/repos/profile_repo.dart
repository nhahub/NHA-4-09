import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:moodly/features/auth/data/repos/user_data_repo.dart';
import 'package:moodly/features/settings/data/repos/images_repo.dart';

import '../../../../core/errors/failure.dart';

class ProfileRepo {
  final UserDataRepo userDataRepo;
  final ImagesRepo imagesRepo;

  ProfileRepo({required this.userDataRepo, required this.imagesRepo});

  Future<Either<Failure, String>> updateProfileImage(File image) async {
    // 1. delete old image
    await imagesRepo.deleteImageFromStorage();
    // 2. upload image
    final uploadResult = await imagesRepo.uploadProfileImageToStorage(
      imageFile: image,
    );

    return uploadResult.fold((failure) => left(failure), (url) async {
      // 3. update DB
      await userDataRepo.updateUserFields(picture: url);

      // 4. update local cache
      await imagesRepo.updateCachedUserProfilePicture(newPictureUrl: url);

      return right(url);
    });
  }
}
