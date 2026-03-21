part of 'mood_progress_cubit.dart';

class MoodProgressState extends Equatable {
  final List<MoodChart>? weekMood;
  final List<MoodChart>? monthMood;
  final List<MoodChart>? yearMood;
  final bool isLoading;
  final String? failureMessage;

  const MoodProgressState({
    this.weekMood,
    this.monthMood,
    this.yearMood,
    this.isLoading = false,
    this.failureMessage,
  });

  MoodProgressState copyWith({
    List<MoodChart>? weekMood,
    List<MoodChart>? monthMood,
    List<MoodChart>? yearMood,
    bool? isLoading,
    String? failureMessage,
  }) {
    return MoodProgressState(
      weekMood: weekMood ?? this.weekMood,
      monthMood: monthMood ?? this.monthMood,
      yearMood: yearMood ?? this.yearMood,
      isLoading: isLoading ?? this.isLoading,
      failureMessage: failureMessage,
    );
  }

  @override
  List<Object?> get props => [
    weekMood,
    monthMood,
    yearMood,
    isLoading,
    failureMessage,
  ];
}
