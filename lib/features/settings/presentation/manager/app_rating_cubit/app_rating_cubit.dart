import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/networking/api_error_handler.dart';
import 'package:uuid/uuid.dart';

import '../../../../../core/functions/user_data_local.dart';
import '../../../data/models/app_rating_model.dart';
import '../../../data/repos/app_rating_repo.dart';

part 'app_rating_state.dart';

class AppRatingCubit extends Cubit<AppRatingState> {
  int rating = 0;
  final AppRatingRepo _appRatingRepo;

  AppRatingCubit({required AppRatingRepo appRatingRepo})
    : _appRatingRepo = appRatingRepo,
      super(AppRatingInitialState());

  void changeRating({required int newRating}) {
    rating = newRating;
    emit(AppRatingInitialState());
  }

  Future<void> submitRating({required String feedback}) async {
    emit(AppRatingLoadingState());

    try {
      await _appRatingRepo.submitRating(
        appRatingModel: AppRatingModel(
          id: const Uuid().v4(),
          userId: getUser()!.userId,
          rating: rating,
          feedback: feedback,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        ),
      );
      emit(AppRatingSubmittedState());
    } catch (e) {
      emit(
        AppRatingFailureState(
          message: ApiErrorHandler.handle(error: e).message,
        ),
      );
    }
  }

  void validateAndSubmit({required String feedback}) async {
    if (rating == 0) {
      emit(const AppRatingValidationErrorState(showRatingError: true));
      return;
    }
    await submitRating(feedback: feedback);
  }

  Future<void> getUserRating() async {
    emit(GetAppRatingLoadingState());
    try {
      final AppRatingModel? appRatingModel = await _appRatingRepo
          .getUserRating();
      emit(GetAppRatingSuccessState(appRatingModel: appRatingModel));
    } catch (e) {
      emit(
        AppRatingFailureState(
          message: ApiErrorHandler.handle(error: e).message,
        ),
      );
    }
  }
}
