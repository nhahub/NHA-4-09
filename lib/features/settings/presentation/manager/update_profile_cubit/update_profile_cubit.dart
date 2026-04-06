import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:moodly/features/auth/data/repos/user_data_repo.dart';
import '../../../../../core/functions/user_data_local.dart';
import '../../../../../core/errors/failure.dart';
import '../../../../../core/models/user_data_model.dart';
part 'update_profile_state.dart';

class UpdateProfileCubit extends Cubit<UpdateProfileState> {
  final UserDataRepo userDataRepo;

  UpdateProfileCubit({required this.userDataRepo})
    : super(UpdateProfileState(userDataModel: getUser()));
  String? phoneNumber;

  void setPhoneNumber(String number) {
    phoneNumber = number;
  }

  Future<void> updateUserProfile({
    String? phone,
    String? name,
    String? picture,
  }) async {
    emit(
      UpdateProfileState(userDataModel: state.userDataModel, isLoading: true),
    );

    final Either<Failure, UserDataModel> userResponse = await userDataRepo
        .updateUserData(
          userDataModel: UserDataModel(
            userId: getUser()!.userId,
            phone: phone ?? getUser()!.phone,
            name: name ?? getUser()!.name,
            picture: picture ?? getUser()!.picture,
          ),
        );
    return userResponse.fold(
      (failure) => emit(
        UpdateProfileState(
          userDataModel: state.userDataModel,
          isLoading: false,
          error: failure.message,
        ),
      ),
      (userData) async {
        final UserDataModel userDataModel = UserDataModel(
          userId: userData.userId,
          phone: userData.phone,
          name: userData.name,
          picture: userData.picture,
        );

        await saveUserDataLocal(userDataModel: userDataModel);
        emit(
          UpdateProfileState(userDataModel: userDataModel, isLoading: false),
        );
      },
    );
  }
}
