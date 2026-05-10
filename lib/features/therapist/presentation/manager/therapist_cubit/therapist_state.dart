part of 'therapist_cubit.dart';

enum TherapistStatus { loading, success, failure }

extension TherapistStatusX on TherapistStatus {
  bool get isLoading => this == TherapistStatus.loading;
  bool get isSuccess => this == TherapistStatus.success;
  bool get isFailure => this == TherapistStatus.failure;
}

class TherapistState extends Equatable {
  final TherapistStatus status;
  final List<TherapistModel>? therapists;
  final String? error;

  const TherapistState({
    this.status = TherapistStatus.loading,
    this.therapists,
    this.error,
  });

  @override
  List<Object> get props => [status, therapists ?? [], error ?? ''];

  TherapistState copyWith({
    TherapistStatus? status,
    List<TherapistModel>? therapists,
    String? error,
  }) {
    return TherapistState(
      status: status ?? this.status,
      therapists: therapists ?? this.therapists,
      error: error ?? this.error,
    );
  }
}
