import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

import '../../../../../core/functions/user_data_local.dart';
import '../../../data/models/app_rating_model.dart';
import '../../../data/repos/app_rating_repo.dart';

part 'app_rating_state.dart';

class AppRatingCubit extends Cubit<AppRatingState> {
  int rating = 0;
  final AppRatingRepo appRatingRepo;

  AppRatingCubit({required this.appRatingRepo})
    : super(AppRatingInitialState());

  void changeRating({required int newRating}) {
    rating = newRating;
    emit(AppRatingInitialState());
  }

  Future<void> submitRating({required String feedback}) async {
    emit(AppRatingLoadingState());

    final result = await appRatingRepo.submitRating(
      appRatingModel: AppRatingModel(
        id: const Uuid().v4(),
        userId: getUser()!.userId,
        rating: rating,
        feedback: feedback,
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ),
    );
    result.fold(
      (failure) => emit(AppRatingFailureState(message: failure.message)),
      (_) => emit(AppRatingSubmittedState()),
    );
  }

  void validateAndSubmit({required String feedback}) {
    if (rating == 0) {
      emit(const AppRatingValidationErrorState(showRatingError: true));
      return;
    }

    submitRating(feedback: feedback);
  }

  Future<void> getUserRating() async {
    emit(GetAppRatingLoadingState());
    final result = await appRatingRepo.getUserRating();
    result.fold(
      (failure) => emit(AppRatingFailureState(message: failure.message)),
      (appRatingModel) =>
          emit(GetAppRatingSuccessState(appRatingModel: appRatingModel)),
    );
  }
}
