import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

import '../../../../../core/models/user_data_model.dart';
import '../../../data/models/post_model.dart';
import '../../../data/repos/create_post_repo.dart';

part 'create_post_state.dart';

class CreatePostCubit extends Cubit<CreatePostState> {
  final CreatePostRepo _createPostRepo;
  final ImagePicker _imagePicker;
  final Uuid _uuid = const Uuid();

  CreatePostCubit({required CreatePostRepo createPostRepo, ImagePicker? imagePicker})
    : _createPostRepo = createPostRepo,
      _imagePicker = imagePicker ?? ImagePicker(),
      super(const CreatePostState()) {
    initialize();
  }

  Future<void> initialize() async {
    emit(state.copyWith(status: CreatePostStatus.loadingUser));
    final userData = await _createPostRepo.getCurrentUserData();
    emit(state.copyWith(status: CreatePostStatus.ready, userData: userData));
  }

  void onTextChanged(String value) {
    emit(state.copyWith(content: value, status: CreatePostStatus.ready));
  }

  Future<void> pickImages() async {
    final int remaining = CreatePostState.maxImages - state.selectedImages.length;
    if (remaining <= 0) return;

    final List<XFile> pickedFiles = await _imagePicker.pickMultiImage();
    if (pickedFiles.isEmpty) return;

    final selectedNow = pickedFiles.take(remaining).map((e) => File(e.path));
    emit(
      state.copyWith(
        selectedImages: [...state.selectedImages, ...selectedNow],
        status: CreatePostStatus.ready,
      ),
    );
  }

  void removeImageAt(int index) {
    if (index < 0 || index >= state.selectedImages.length) return;
    final updated = [...state.selectedImages]..removeAt(index);
    emit(state.copyWith(selectedImages: updated, status: CreatePostStatus.ready));
  }

  Future<PostModel?> submitPost() async {
    if (!state.canPost) return null;
    emit(state.copyWith(status: CreatePostStatus.submitting, errorMessage: null));

    try {
      final String userId = _createPostRepo.getCurrentUserId() ?? '';
      final List<String> imageUrls = await _createPostRepo.uploadImages(
        state.selectedImages,
      );

      final post = PostModel(
        id: _uuid.v4(),
        userId: userId,
        userName: state.userData?.name ?? 'unknown_user',
        userImage: state.userData?.picture ?? '',
        content: state.content.trim(),
        imageUrls: imageUrls,
        createdAt: DateTime.now(),
      );

      await _createPostRepo.createPost(post);
      emit(state.copyWith(status: CreatePostStatus.success));
      return post;
    } catch (e) {
      emit(
        state.copyWith(
          status: CreatePostStatus.failure,
          errorMessage: e.toString(),
        ),
      );
      return null;
    }
  }
}
