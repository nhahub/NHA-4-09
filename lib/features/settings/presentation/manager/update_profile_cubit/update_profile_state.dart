part of 'update_profile_cubit.dart';

class UpdateProfileState extends Equatable {
  final UserDataModel? userDataModel;
  final bool isLoading;
  final String? error;
  final bool isSuccess;
  final File? file;
  final String? phoneNumber;

  const UpdateProfileState({
    this.userDataModel,
    this.isLoading = false,
    this.isSuccess = false,
    this.error,
    this.file,
    this.phoneNumber,
  });

  @override
  List<Object?> get props => [
    userDataModel,
    isLoading,
    isSuccess,
    error,
    file,
    phoneNumber,
  ];

  UpdateProfileState copyWith({
    UserDataModel? userDataModel,
    bool? isLoading,
    bool? isSuccess,
    String? error,
    File? file,
    String? phoneNumber,
  }) {
    return UpdateProfileState(
      userDataModel: userDataModel ?? this.userDataModel,
      isLoading: isLoading ?? this.isLoading,
      isSuccess: isSuccess ?? this.isSuccess,
      error: error ?? this.error,
      file: file ?? this.file,
      phoneNumber: phoneNumber ?? this.phoneNumber,
    );
  }
}
