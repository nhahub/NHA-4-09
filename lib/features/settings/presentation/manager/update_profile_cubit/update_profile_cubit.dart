import 'dart:io';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moodly/features/auth/data/repos/user_data_repo.dart';
import 'package:moodly/features/settings/data/repos/profile_repo.dart';
import 'package:moodly/features/settings/presentation/helpers/image_picker_helper.dart';
import '../../../../../core/functions/user_data_local.dart';
import '../../../../../core/models/user_data_model.dart';
import 'package:path_provider/path_provider.dart';
part 'update_profile_state.dart';

class UpdateProfileCubit extends Cubit<UpdateProfileState> {
  final UserDataRepo userDataRepo;
  final ProfileRepo profileRepo;

  UpdateProfileCubit({required this.userDataRepo, required this.profileRepo})
    : super(UpdateProfileState(userDataModel: getUser()));

  void updatePhoneNumber(String? phone) {
    emit(state.copyWith(phoneNumber: phone));
  }

  Future<void> pickProfileImageFromGallery() async {
    final File? file = await pickImageFromGallery();
    final safe = await safeFile(file ?? File(''));
    emit(state.copyWith(file: safe));
  }

  Future<File> safeFile(File file) async {
    final dir = await getApplicationDocumentsDirectory();
    final newPath = '${dir.path}/${DateTime.now().millisecondsSinceEpoch}.jpg';
    return await file.copy(newPath);
  }

  Future<void> updateProfile({String? name, String? phone, File? file}) async {
    emit(state.copyWith(isLoading: true, isSuccess: false, error: null));

    try {
      String? imageUrl;

      if (file != null) {
        final result = await profileRepo.updateProfileImage(file);

        imageUrl = result.fold((f) => throw Exception(f.message), (url) => url);
      }

      final response = await userDataRepo.updateUserFields(
        name: name,
        phone: phone,
      );

      response.fold((failure) => throw Exception(failure.message), (_) {});

      final updatedUser = state.userDataModel?.copyWith(
        name: name ?? state.userDataModel?.name,
        phone: phone ?? state.userDataModel?.phone,
        picture: imageUrl ?? state.userDataModel?.picture,
      );

      if (updatedUser != null) {
        saveUserDataLocal(userDataModel: updatedUser);
      }

      emit(
        state.copyWith(
          userDataModel: updatedUser,
          isLoading: false,
          isSuccess: true,
        ),
      );
    } catch (e) {
      emit(state.copyWith(isLoading: false, error: e.toString()));
    }
  }
}
