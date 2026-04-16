part of 'therapist_reviews_cubit.dart';

enum TherapistReviewsStatus { initial, loading, success, failure }

extension TherapistReviewsStatusX on TherapistReviewsStatus {
  bool get isInitial => this == TherapistReviewsStatus.initial;
  bool get isLoading => this == TherapistReviewsStatus.loading;
  bool get isSuccess => this == TherapistReviewsStatus.success;
  bool get isFailure => this == TherapistReviewsStatus.failure;
}

@freezed
sealed class TherapistReviewsState with _$TherapistReviewsState {
  const factory TherapistReviewsState({
    @Default(TherapistReviewsStatus.initial) TherapistReviewsStatus status,
    @Default(<TherapistReviewModel>[]) List<TherapistReviewModel> reviews,
    double? average,
    int? totalCount,
    @Default(0) num userRating,
    @Default(0) int selectedAnonymousIndex,
    @Default(false) bool displayAnonymously,
    @Default(false) bool hasUserRated,
    String? error,
  }) = _TherapistReviewsState;
}


// part of 'therapist_reviews_cubit.dart';

// enum TherapistReviewsStatus { initial, loading, success, failure }

// extension TherapistReviewsStatusX on TherapistReviewsStatus {
//   bool get isInitial => this == TherapistReviewsStatus.initial;
//   bool get isLoading => this == TherapistReviewsStatus.loading;
//   bool get isSuccess => this == TherapistReviewsStatus.success;
//   bool get isFailure => this == TherapistReviewsStatus.failure;
// }

// class TherapistReviewsState extends Equatable {
//   final TherapistReviewsStatus status;

//   final List<TherapistReviewModel> reviews;
//   final double? average;
//   final int? totalCount;
//   final int selectedAnonymousIndex;
//   final bool displayAnonymously;
//   final num userRating;
//   final bool hasUserRated;
//   final String? error;

//   const TherapistReviewsState({
//     this.status = TherapistReviewsStatus.initial,
//     this.reviews = const [],
//     this.average,
//     this.totalCount,
//     this.userRating = 0,
//     this.selectedAnonymousIndex = 0,
//     this.displayAnonymously = false,
//     this.hasUserRated = false,
//     this.error,
//   });

//   @override
//   List<Object?> get props => [
//     status,
//     reviews,
//     average,
//     totalCount,
//     selectedAnonymousIndex,
//     displayAnonymously,
//     userRating,
//     hasUserRated,
//     error,
//   ];

//   TherapistReviewsState copyWith({
//     TherapistReviewsStatus? status,
//     List<TherapistReviewModel>? reviews,
//     double? average,
//     int? totalCount,
//     num? userRating,
//     bool? hasUserRated,
//     bool? displayAnonymously,
//     int? selectedAnonymousIndex,
//     String? error,
//   }) {
//     return TherapistReviewsState(
//       status: status ?? this.status,
//       reviews: reviews ?? this.reviews,
//       average: average ?? this.average,
//       totalCount: totalCount ?? this.totalCount,
//       displayAnonymously: displayAnonymously ?? this.displayAnonymously,
//       selectedAnonymousIndex:
//           selectedAnonymousIndex ?? this.selectedAnonymousIndex,
//       userRating: userRating ?? this.userRating,
//       hasUserRated: hasUserRated ?? this.hasUserRated,
//       error: error,
//     );
//   }
// }

