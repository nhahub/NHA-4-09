import 'package:dartz/dartz.dart';

import '../../../../core/errors/failure.dart';
import '../../../../core/functions/get_user.dart';
import '../../../../core/networking/api_error_handler.dart';
import '../models/mood_model.dart';
import '../services/mood_remote_service.dart';

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
