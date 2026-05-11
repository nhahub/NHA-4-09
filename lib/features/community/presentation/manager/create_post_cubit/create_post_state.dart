part of 'create_post_cubit.dart';

enum CreatePostStatus {
  initial,
  submitting,
  success,
  failure,
}

extension CommunityFeedStatusX on CreatePostStatus {
  bool get isInitial => this == CreatePostStatus.initial;
  bool get isSubmitting => this == CreatePostStatus.submitting;
  bool get isSuccess => this == CreatePostStatus.success;
  bool get isFailure => this == CreatePostStatus.failure;
}

class CreatePostState extends Equatable {
  static const int maxImages = 4;
  final CreatePostStatus status;
  final String content;
  final List<File> selectedImages;
  final String? errorMessage;

  const CreatePostState({
    this.status = CreatePostStatus.initial,
    this.content = '',
    this.selectedImages = const [],
    this.errorMessage,
  });

  bool get canPost => content.trim().isNotEmpty || selectedImages.isNotEmpty;

  @override
  List<Object?> get props => [status, content, selectedImages, errorMessage];

  CreatePostState copyWith({
    CreatePostStatus? status,
    String? content,
    List<File>? selectedImages,
    String? errorMessage,
  }) {
    return CreatePostState(
      status: status ?? this.status,
      content: content ?? this.content,
      selectedImages: selectedImages ?? this.selectedImages,
      errorMessage: errorMessage,
    );
  }
}
