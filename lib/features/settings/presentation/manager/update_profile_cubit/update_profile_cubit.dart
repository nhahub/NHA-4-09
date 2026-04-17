import 'dart:io';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/networking/api_error_handler.dart';
import '../../../data/repos/update_profile_repo.dart';
import '../../helpers/image_picker_helper.dart';
import '../../../../../core/functions/user_data_local.dart';
import '../../../../../core/models/user_data_model.dart';
import 'package:path_provider/path_provider.dart';
part 'update_profile_state.dart';

class UpdateProfileCubit extends Cubit<UpdateProfileState> {
  final UpdateProfileRepo _updateProfileRepo;

  UpdateProfileCubit({required UpdateProfileRepo updateProfileRepo})
    : _updateProfileRepo = updateProfileRepo,
      super(UpdateProfileState(userDataModel: getUser()));

  void updatePhoneNumber(String? phone) {
    emit(
      state.copyWith(phoneNumber: phone, status: UpdateProfileStatus.initial),
    );
  }

  Future<void> pickProfileImageFromGallery() async {
    final File? file = await pickImageFromGallery();
    final File safe = await _safeFile(file ?? File(''));
    emit(state.copyWith(status: UpdateProfileStatus.initial, file: safe));
  }

  Future<void> updateProfile({String? name, String? phone, File? file}) async {
    emit(state.copyWith(status: UpdateProfileStatus.loading));

    try {
      final UserDataModel? updatedUser = await _updateProfileRepo.updateProfile(
        name: name,
        phone: phone,
        file: file,
      );
      emit(
        state.copyWith(
          userDataModel: updatedUser ?? state.userDataModel,
          imageVersion: state.imageVersion + 1,
          status: UpdateProfileStatus.success,
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(
          status: UpdateProfileStatus.failure,
          error: ApiErrorHandler.handle(error: e).message,
        ),
      );
    }
  }

  Future<File> _safeFile(File file) async {
    final dir = await getApplicationDocumentsDirectory();
    final newPath = '${dir.path}/${DateTime.now().millisecondsSinceEpoch}.jpg';
    return await file.copy(newPath);
  }
}
