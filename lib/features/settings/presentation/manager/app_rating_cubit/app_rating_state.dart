part of 'app_rating_cubit.dart';

sealed class AppRatingState extends Equatable {
  const AppRatingState();

  @override
  List<Object?> get props => [];
}

final class AppRatingInitialState extends AppRatingState {}

final class AppRatingLoadingState extends AppRatingState {}

final class AppRatingSubmittedState extends AppRatingState {}

final class GetAppRatingSuccessState extends AppRatingState {
  final AppRatingModel? appRatingModel;
  const GetAppRatingSuccessState({required this.appRatingModel});

  @override
  List<Object?> get props => [appRatingModel];
}
final class GetAppRatingLoadingState extends AppRatingState {}


final class AppRatingFailureState extends AppRatingState {
  final String message;
  const AppRatingFailureState({required this.message});

  @override
  List<Object> get props => [message];
}

class AppRatingValidationErrorState extends AppRatingState {
  final bool showRatingError;

  const AppRatingValidationErrorState({required this.showRatingError});

  @override
  List<Object> get props => [showRatingError];
}
