import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../domain/enums/mood_time_range.dart';

class MoodRangeCubit extends Cubit<MoodTimeRange> {
  MoodRangeCubit() : super(MoodTimeRange.weekly);

  void changeRange(MoodTimeRange range) {
    emit(range);
  }
}
