import 'package:moodly/core/constants/app_keys.dart';
import 'package:moodly/features/meditations/data/models/book_model.dart';
import 'package:moodly/features/meditations/data/services/recommended_books_local_service.dart';
import '../../../mood/data/services/mood_local_service.dart';
import '../services/recommended_books_remote_service.dart';

class RecommendedBooksRepo {
  final RecommendedBooksRemoteService _recommendedBooksRemoteService;
  final RecommendedBooksLocalService _recommendedBooksLocalService;
  final MoodLocalService _moodLocalService;

  RecommendedBooksRepo({
    required RecommendedBooksRemoteService recommendedBooksRemoteService,
    required RecommendedBooksLocalService recommendedBooksLocalService,
    required MoodLocalService moodLocalService,
  }) : _recommendedBooksRemoteService = recommendedBooksRemoteService,
       _recommendedBooksLocalService = recommendedBooksLocalService,
       _moodLocalService = moodLocalService;

  Future<List<BookModel>> getRecommendedBooks() async {
    // Get current mood
    final String currentMood =
        _moodLocalService.getSelectedDailyMood() ?? "calm";

    final String mood = _getMoodCategory(currentMood: currentMood);

    // Get cached mood
    final String? cachedMood = await _recommendedBooksLocalService
        .getCachedMood();

    // If cached mood is not equal to current mood remove cached data
    if (cachedMood != currentMood) {
      await _recommendedBooksLocalService.clearRecommendedBooks();
      await _recommendedBooksLocalService.saveMood(currentMood);
    }

    // Try to get data from cache first
    final List<BookModel>? recommendedCachedBooks =
        await _recommendedBooksLocalService.getRecommendedBooks();

    if (recommendedCachedBooks != null && recommendedCachedBooks.isNotEmpty) {
      return recommendedCachedBooks;
    }

    //  No data in cache, fetch from remote
    final BooksResponse booksResponse = await _recommendedBooksRemoteService
        .getRecommendedBooks(
          subject: mood,
          maxResults: 6,
          key: ApiKeys.googleBooksApiKey,
        );

    // Save data to cache
    await _recommendedBooksLocalService.cacheRecommendedBooks(
      recommendedBooks: booksResponse.items!,
    );

    return booksResponse.items!;
  }
}

String _getMoodCategory({required String currentMood}) {
  switch (currentMood.toLowerCase()) {
    case 'angry':
      return 'psychology+angry';

    case 'anxious':
      return 'psychology+anxiety';

    case 'happy':
      return 'psychology+happy';

    case 'calm':
      return 'psychology+calm';

    case 'neutral':
    default:
      return 'psychology+neutral';
  }
}
