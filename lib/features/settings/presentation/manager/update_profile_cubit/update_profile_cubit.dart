import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/functions/get_user.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import '../../../../../core/errors/failure.dart';
import '../../../../../core/models/user_data_model.dart';
import '../../../data/repos/settings_repo.dart';

part 'update_profile_state.dart';

class UpdateProfileCubit extends Cubit<UpdateProfileState> {
  final SettingsRepo settingsRepo;

  UpdateProfileCubit({required this.settingsRepo})
    : super(UpdateProfileState(userDataModel: getUser()));
  String? phoneNumber;

  void setPhoneNumber(String number) {
    phoneNumber = number;
  }

  Future<void> updateUserProfile({
    String? email,
    String? phone,
    String? password,
    String? name,
    String? image,
  }) async {
    emit(
      UpdateProfileState(userDataModel: state.userDataModel, isLoading: true),
    );

    final Either<Failure, UserResponse> userResponse = await settingsRepo
        .updateUserProfile(
          email: email,
          phone: phone,
          password: password,
          name: name,
          image: image,
        );
    return userResponse.fold(
      (failure) => emit(
        UpdateProfileState(
          userDataModel: state.userDataModel,
          isLoading: false,
          error: failure.message,
        ),
      ),
      (userResponse) async {
        final UserDataModel userDataModel = UserDataModel(
          userId: userResponse.user!.id,
          email: userResponse.user!.email,
          phone: userResponse.user!.userMetadata!['phone'],
          name: userResponse.user!.userMetadata!['name'],
          picture:
              userResponse.user!.userMetadata!['image'] ??
              userResponse.user!.userMetadata!['picture'],
          isOldUser: userResponse.user!.userMetadata!['is_old_user'],
        );

        await saveUserDataLocal(userDataModel: userDataModel);
        emit(
          UpdateProfileState(userDataModel: userDataModel, isLoading: false),
        );
      },
    );
  }
}
