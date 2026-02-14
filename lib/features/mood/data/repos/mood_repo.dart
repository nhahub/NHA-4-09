import 'package:dartz/dartz.dart';
import 'package:moodly/core/errors/failure.dart';
import 'package:moodly/core/functions/get_user.dart';
import 'package:moodly/core/networking/api_error_handler.dart';
import 'package:moodly/features/mood/data/models/mood_model.dart';
import 'package:moodly/features/mood/data/services/mood_remote_service.dart';

class MoodRepo {
  final MoodRemoteService _moodRemoteService;

  MoodRepo({required MoodRemoteService moodRemoteService})
    : _moodRemoteService = moodRemoteService;

  Future<Either<Failure, void>> saveCurrentMood({
    required String currentMood,
  }) async {
    try {
      await _moodRemoteService.saveCurrentMood(
        moodModel: MoodModel(
          userId: getUser()!.userId,
          currentMood: currentMood,
          createdAt: DateTime.now(),
        ),
      );
      return right(null);
    } catch (e) {
      return left(ApiErrorHandler.handle(error: e));
    }
  }
}
