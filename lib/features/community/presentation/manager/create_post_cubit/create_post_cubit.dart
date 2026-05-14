import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:moodly/core/functions/user_data_local.dart';
import 'package:moodly/core/networking/api_error_handler.dart';
import 'package:uuid/uuid.dart';
import '../../../../../core/helpers/logger.dart';
import '../../../data/models/post_model.dart';
import '../../../data/repos/create_post_repo.dart';
part 'create_post_state.dart';

class CreatePostCubit extends Cubit<CreatePostState> {
  final CreatePostRepo _createPostRepo;
  final ImagePicker _imagePicker;
  final Uuid _uuid = const Uuid();

  CreatePostCubit({
    required CreatePostRepo createPostRepo,
    ImagePicker? imagePicker,
  }) : _createPostRepo = createPostRepo,
       _imagePicker = imagePicker ?? ImagePicker(),
       super(const CreatePostState());

  void onTextChanged(String value) {
    emit(
      state.copyWith(
        content: value,
        status: CreatePostStatus.initial,
        clearErrorMessage: true,
      ),
    );
  }

  Future<void> pickImages() async {
    final int remaining =
        CreatePostState.maxImages - state.selectedImages.length;
    if (remaining <= 0) return;

    final List<XFile> pickedFiles = await _imagePicker.pickMultiImage();
    if (pickedFiles.isEmpty) return;

    final selectedNow = pickedFiles.take(remaining).map((e) => File(e.path));
    emit(
      state.copyWith(
        selectedImages: [...state.selectedImages, ...selectedNow],
        status: CreatePostStatus.initial,
        clearErrorMessage: true,
      ),
    );
  }

  void removeImageAt(int index) {
    if (index < 0 || index >= state.selectedImages.length) return;
    final updated = [...state.selectedImages]..removeAt(index);
    emit(
      state.copyWith(
        selectedImages: updated,
        status: CreatePostStatus.initial,
        clearErrorMessage: true,
      ),
    );
  }

  Future<PostModel?> submitPost() async {
    if (!state.canPost) return null;
    final loggedUserId = getUser()?.userId;
    if (loggedUserId == null || loggedUserId.isEmpty) {
      emit(
        state.copyWith(
          status: CreatePostStatus.failure,
          errorMessage: 'Please sign in to create a post.',
        ),
      );
      return null;
    }
    emit(
      state.copyWith(
        status: CreatePostStatus.submitting,
        clearErrorMessage: true,
      ),
    );

    try {
      final List<String> imageUrls = await _createPostRepo.uploadImages(
        state.selectedImages,
      );

      final post = PostModel(
        id: _uuid.v4(),
        userId: loggedUserId,
        userName: getUser()?.name ?? 'unknown_user',
        userImage: getUser()?.picture ?? '',
        content: state.content.trim(),
        imageUrls: imageUrls,
        createdAt: DateTime.now(),
      );

      await _createPostRepo.createPost(post);
      emit(state.copyWith(status: CreatePostStatus.success));
      return post;
    } catch (e) {
      Logger.log(e.toString());
      emit(
        state.copyWith(
          status: CreatePostStatus.failure,
          errorMessage: ApiErrorHandler.handle(error: e).message,
        ),
      );
      return null;
    }
  }
}
