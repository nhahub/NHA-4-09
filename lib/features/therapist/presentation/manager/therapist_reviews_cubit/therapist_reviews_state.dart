part of 'therapist_reviews_cubit.dart';

sealed class TherapistReviewsState extends Equatable {
  const TherapistReviewsState();

  @override
  List<Object?> get props => [];
}

/// -------------------------
/// Get Reviews States
/// -------------------------
class GetTherapistReviewsLoadingState extends TherapistReviewsState {}

class GetTherapistReviewsSuccessState extends TherapistReviewsState {
  final List<TherapistReviewModel> therapistReviewModel;
  final double? average;
  final int? totalCount;
  final num userRating;
  final bool hasUserRated;

  const GetTherapistReviewsSuccessState({
    required this.therapistReviewModel,
    this.average,
    this.totalCount,
    required this.userRating,
    required this.hasUserRated,
  });

  @override
  List<Object?> get props => [
    therapistReviewModel,
    average,
    totalCount,
    userRating,
    hasUserRated,
  ];

  GetTherapistReviewsSuccessState copyWith({
    List<TherapistReviewModel>? ratings,
    double? average,
    int? totalCount,
    num? userRating,
  }) {
    return GetTherapistReviewsSuccessState(
      hasUserRated: hasUserRated,
      therapistReviewModel: ratings ?? therapistReviewModel,
      average: average ?? this.average,
      totalCount: totalCount ?? this.totalCount,
      userRating: userRating ?? this.userRating,
    );
  }
}

class GetTherapistReviewsFailureState extends TherapistReviewsState {
  final String errorMessage;

  const GetTherapistReviewsFailureState({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}

/// -------------------------
/// Add Review States
/// -------------------------
class AddTherapistReviewLoadingState extends TherapistReviewsState {}

class AddTherapistReviewSuccessState extends TherapistReviewsState {}

class AddTherapistReviewFailureState extends TherapistReviewsState {
  final String errorMessage;

  const AddTherapistReviewFailureState({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}

/// -------------------------
/// Update Review States
/// -------------------------
class UpdateTherapistReviewLoadingState extends TherapistReviewsState {}

class UpdateTherapistReviewSuccessState extends TherapistReviewsState {}

class UpdateTherapistReviewFailureState extends TherapistReviewsState {
  final String errorMessage;

  const UpdateTherapistReviewFailureState({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}

/// -------------------------
/// Delete Review States
/// -------------------------
class DeleteTherapistReviewLoadingState extends TherapistReviewsState {}

class DeleteTherapistReviewSuccessState extends TherapistReviewsState {}

class DeleteTherapistReviewFailureState extends TherapistReviewsState {
  final String errorMessage;

  const DeleteTherapistReviewFailureState({required this.errorMessage});

  @override
  List<Object?> get props => [errorMessage];
}
