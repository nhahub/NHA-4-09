part of 'therapist_rating_cubit.dart';

sealed class TherapistRatingState extends Equatable {
  const TherapistRatingState();

  @override
  List<Object> get props => [];
}

class TherapistRatingInitial extends TherapistRatingState {}

class TherapistRatingLoading extends TherapistRatingState {}

class TherapistRatingLoaded extends TherapistRatingState {
  final List<TherapistRatingModel> ratings;
  final double? average;
  final int? totalCount;
  final double? userRating;

  const TherapistRatingLoaded({
    required this.ratings,
    required this.average,
    required this.totalCount,
    this.userRating,
  });


  TherapistRatingLoaded copyWith({
    List<TherapistRatingModel>? ratings,
    double? average,
    int? totalCount,
    double? userRating,
  }) {
    return TherapistRatingLoaded(
      ratings: ratings ?? this.ratings,
      average: average ?? this.average,
      totalCount: totalCount ?? this.totalCount,
      userRating: userRating ?? this.userRating,
    );
  }
}

class TherapistRatingFailure extends TherapistRatingState {
  final String error;

  const TherapistRatingFailure({required this.error});
}
