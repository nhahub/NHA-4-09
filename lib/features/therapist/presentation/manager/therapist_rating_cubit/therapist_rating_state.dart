part of 'therapist_rating_cubit.dart';

sealed class TherapistRatingState extends Equatable {
  const TherapistRatingState();

  @override
  List<Object?> get props => [];
}

class GetTherapistRatingsLoadingState extends TherapistRatingState {}

class AddTherapistRatingsAddedState extends TherapistRatingState {}

class GetTherapistRatingsLoadedState extends TherapistRatingState {
  final List<TherapistRatingModel> ratings;
  final double? average;
  final int? totalCount;
  final num userRating;

  const GetTherapistRatingsLoadedState({
    required this.ratings,
    required this.average,
    required this.totalCount,
    required this.userRating,
  });

  @override
  List<Object?> get props => [ratings, average, totalCount, userRating];
  
  GetTherapistRatingsLoadedState copyWith({
    List<TherapistRatingModel>? ratings,
    double? average,
    int? totalCount,
    num? userRating,
  }) {
    return GetTherapistRatingsLoadedState(
      ratings: ratings ?? this.ratings,
      average: average ?? this.average,
      totalCount: totalCount ?? this.totalCount,
      userRating: userRating ?? this.userRating,
    );
  }
}

class GetTherapistRatingsFailureState extends TherapistRatingState {
  final String error;

  const GetTherapistRatingsFailureState({required this.error});
}

class AddTherapistRatingsLoadingState extends TherapistRatingState {}

class AddTherapistRatingsFailureState extends TherapistRatingState {
  final String error;

  const AddTherapistRatingsFailureState({required this.error});
}
