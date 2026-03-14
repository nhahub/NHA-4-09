part of 'therapist_reviews_cubit.dart';

sealed class TherapistReviewsState extends Equatable {
  const TherapistReviewsState();

  @override
  List<Object?> get props => [];
}

class GetTherapistReviewsLoadingState extends TherapistReviewsState {}

class AddTherapistReviewAddedState extends TherapistReviewsState {}

class GetTherapistReviewsLoadedState extends TherapistReviewsState {
  final List<TherapistReviewModel> therapistReviewModel;
  final double? average;
  final int? totalCount;
  final num userRating;

  const GetTherapistReviewsLoadedState({
    required this.therapistReviewModel,
    required this.average,
    required this.totalCount,
    required this.userRating,
  });

  @override
  List<Object?> get props => [
    therapistReviewModel,
    average,
    totalCount,
    userRating,
  ];

  GetTherapistReviewsLoadedState copyWith({
    List<TherapistReviewModel>? ratings,
    double? average,
    int? totalCount,
    num? userRating,
  }) {
    return GetTherapistReviewsLoadedState(
      therapistReviewModel: ratings ?? therapistReviewModel,
      average: average ?? this.average,
      totalCount: totalCount ?? this.totalCount,
      userRating: userRating ?? this.userRating,
    );
  }
}

class GetTherapistRatingsFailureState extends TherapistReviewsState {
  final String error;

  const GetTherapistRatingsFailureState({required this.error});
}

class AddTherapistRatingsLoadingState extends TherapistReviewsState {}

class AddTherapistRatingsFailureState extends TherapistReviewsState {
  final String error;

  const AddTherapistRatingsFailureState({required this.error});
}

class UpdateTherapistRatingsLoadingState extends TherapistReviewsState {}

class UpdateTherapistRatingState extends TherapistReviewsState {}

class UpdateTherapistRatingsFailureState extends TherapistReviewsState {
  final String error;

  const UpdateTherapistRatingsFailureState({required this.error});
}

class DeleteTherapistRatingsLoadingState extends TherapistReviewsState {}

class DeleteTherapistRatingState extends TherapistReviewsState {}

class DeleteTherapistRatingsFailureState extends TherapistReviewsState {
  final String error;

  const DeleteTherapistRatingsFailureState({required this.error});
}
