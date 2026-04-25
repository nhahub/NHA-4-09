import '../../../../core/constants/constants.dart';
import '../../../../core/services/local_cache_service.dart';
import '../models/book_model.dart';

class RecommendedBooksLocalService {
  final LocalCacheService<BookModel> _localCacheService;

  RecommendedBooksLocalService({
    required LocalCacheService<BookModel> localCacheService,
  }) : _localCacheService = localCacheService;

  Future<List<BookModel>?> getRecommendedBooks() async {
    final List<BookModel>? list = await _localCacheService.getList(
      key: kRecommendedBooks,
      boxName: kRecommendedBooksBox,
    );
    if (list == null) {
      return null;
    }
    return list;
  }

  Future<void> cacheRecommendedBooks({
    required List<BookModel> recommendedBooks,
  }) async {
    await _localCacheService.saveList(
      key: kRecommendedBooks,
      boxName: kRecommendedBooksBox,
      list: recommendedBooks,
    );
  }

  Future<void> clearRecommendedBooks() async {
    await _localCacheService.clear(
      key: kRecommendedBooks,
      boxName: kRecommendedBooksBox,
    );
  }

  Future<void> saveMood(String mood) async {
    await _localCacheService.save(
      key: kCachedMood,
      boxName: kRecommendedBooksBox,
      value: mood,
    );
  }

  Future<String?> getCachedMood() async {
    return await _localCacheService.get(
      key: kCachedMood,
      boxName: kRecommendedBooksBox,
    );
  }
}
