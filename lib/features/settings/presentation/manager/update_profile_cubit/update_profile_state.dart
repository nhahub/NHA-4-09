part of 'update_profile_cubit.dart';

class UpdateProfileState extends Equatable {
  final UserDataModel? userDataModel;
  final bool isLoading;
  final String? error;

  const UpdateProfileState({
    this.userDataModel,
    this.isLoading = false,
    this.error,
  });

  @override
  List<Object?> get props => [userDataModel, isLoading, error];
}
