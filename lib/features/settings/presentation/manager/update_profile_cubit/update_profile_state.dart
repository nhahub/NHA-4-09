part of 'update_profile_cubit.dart';

sealed class UpdateProfileState extends Equatable {
  const UpdateProfileState();

  @override
  List<Object> get props => [];
}

final class UpdateProfileInitialState extends UpdateProfileState {}

final class UpdateProfileLoadingState extends UpdateProfileState {}

final class UpdateProfileSuccessState extends UpdateProfileState {
  final UserResponse userResponse;
  const UpdateProfileSuccessState({required this.userResponse});

  @override
  List<Object> get props => [userResponse];
}

final class UpdateProfileFailureState extends UpdateProfileState {
  final String message;
  const UpdateProfileFailureState({required this.message});

  @override
  List<Object> get props => [message];
}
