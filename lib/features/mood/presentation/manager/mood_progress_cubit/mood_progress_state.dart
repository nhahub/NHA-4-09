part of 'mood_progress_cubit.dart';

enum MoodProgressStatus { loading, success, failure }

extension MoodProgressStatusX on MoodProgressStatus {
  bool get isLoading => this == MoodProgressStatus.loading;
  bool get isSuccess => this == MoodProgressStatus.success;
  bool get isFailure => this == MoodProgressStatus.failure;
}

class MoodProgressState extends Equatable {
  final MoodProgressStatus status;
  final List<MoodChart>? weekMood;
  final List<MoodChart>? monthMood;
  final List<MoodChart>? yearMood;
  final String? failureMessage;

  const MoodProgressState({
    this.weekMood,
    this.monthMood,
    this.yearMood,
    this.failureMessage,
    this.status = MoodProgressStatus.loading,
  });

  MoodProgressState copyWith({
    List<MoodChart>? weekMood,
    List<MoodChart>? monthMood,
    List<MoodChart>? yearMood,
    String? failureMessage,
    MoodProgressStatus? status,
  }) {
    return MoodProgressState(
      weekMood: weekMood ?? this.weekMood,
      monthMood: monthMood ?? this.monthMood,
      yearMood: yearMood ?? this.yearMood,
      failureMessage: failureMessage,
      status: status ?? this.status,
    );
  }

  @override
  List<Object?> get props => [
    weekMood,
    monthMood,
    yearMood,
    failureMessage,
    status
  ];
}
