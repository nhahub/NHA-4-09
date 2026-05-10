part of 'create_post_cubit.dart';

enum CreatePostStatus { initial, loadingUser, ready, submitting, success, failure }

class CreatePostState extends Equatable {
  static const int maxImages = 4;

  final CreatePostStatus status;
  final String content;
  final List<File> selectedImages;
  final UserDataModel? userData;
  final String? errorMessage;

  const CreatePostState({
    this.status = CreatePostStatus.initial,
    this.content = '',
    this.selectedImages = const [],
    this.userData,
    this.errorMessage,
  });

  bool get canPost => content.trim().isNotEmpty || selectedImages.isNotEmpty;

  @override
  List<Object?> get props => [
    status,
    content,
    selectedImages,
    userData,
    errorMessage,
  ];

  CreatePostState copyWith({
    CreatePostStatus? status,
    String? content,
    List<File>? selectedImages,
    UserDataModel? userData,
    String? errorMessage,
  }) {
    return CreatePostState(
      status: status ?? this.status,
      content: content ?? this.content,
      selectedImages: selectedImages ?? this.selectedImages,
      userData: userData ?? this.userData,
      errorMessage: errorMessage,
    );
  }
}
