import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/errors/failure.dart';
import '../../../data/repos/settings_repo.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'update_profile_state.dart';

class UpdateProfileCubit extends Cubit<UpdateProfileState> {
  final SettingsRepo settingsRepo;

  UpdateProfileCubit({required this.settingsRepo})
    : super(UpdateProfileInitialState());

  Future<void> updateUserProfile({
    String? email,
    String? phone,
    String? password,
    String? name,
    String? image,
  }) async {
    emit(UpdateProfileLoadingState());

    final Either<Failure, UserResponse> userResponse = await settingsRepo
        .updateUserProfile(
          email: email,
          phone: phone,
          password: password,
          name: name,
          image: image,
        );
    return userResponse.fold(
      (failure) => emit(UpdateProfileFailureState(message: failure.message)),
      (userResponse) =>
          emit(UpdateProfileSuccessState(userResponse: userResponse)),
    );
  }
}
