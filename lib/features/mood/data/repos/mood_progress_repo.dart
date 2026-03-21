import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/networking/api_error_handler.dart';
import '../mappers/mood_chart_mapper.dart';
import '../models/mood_chart.dart';
import '../services/mood_progress_service.dart';

class MoodProgressRepo {
  final MoodProgressService moodProgressService;

  MoodProgressRepo({required this.moodProgressService});

  // Week
  Future<Either<Failure, List<MoodChart>>> getCurrentWeekMood() async {
    try {
      final response = await moodProgressService.getCurrentWeekMood();

      final result = MoodChartMapper.mapWeek(response);

      return right(result);
    } catch (e) {
      return left(ApiErrorHandler.handle(error: e));
    }
  }

  // Month
  Future<Either<Failure, List<MoodChart>>> getCurrentMonthMood() async {
    try {
      final response = await moodProgressService.getCurrentMonthMood();

      final result = MoodChartMapper.mapMonth(response);

      return right(result);
    } catch (e) {
      return left(ApiErrorHandler.handle(error: e));
    }
  }

  // Year
  Future<Either<Failure, List<MoodChart>>> getCurrentYearMood() async {
    try {
      final response = await moodProgressService.getCurrentYearMood();
      final result = MoodChartMapper.mapYear(response);

      return right(result);
    } catch (e) {
      return left(ApiErrorHandler.handle(error: e));
    }
  }
}
