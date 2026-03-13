part of 'therapist_cubit.dart';

sealed class TherapistState extends Equatable {
  const TherapistState();

  @override
  List<Object> get props => [];
}

class GetTherapistsLoadingState extends TherapistState {}

class GetTherapistsLoadedState extends TherapistState {
  final List<TherapistModel> therapists;
  const GetTherapistsLoadedState({required this.therapists});
  @override
  List<Object> get props => [therapists];
}

class GetTherapistFailureState extends TherapistState {
  final String errorMsg;
  const GetTherapistFailureState({required this.errorMsg});
  @override
  List<Object> get props => [errorMsg];
}
