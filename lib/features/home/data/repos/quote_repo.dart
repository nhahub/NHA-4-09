import 'package:dartz/dartz.dart';

import '../../../../core/constants/constants.dart';
import '../../../../core/errors/failure.dart';
import '../../../../core/networking/api_error_handler.dart';
import '../../../../core/services/cache_helper.dart';
import '../models/quote/quote_model.dart';
import '../services/quotes_local_service.dart';

class QuoteRepo {
  final QuotesLocalService quotesLocalService;

  QuoteRepo({required this.quotesLocalService});

  Future<Either<Failure, QuoteModel>> getQuoteOfTheDay() async {
    try {
      final List<QuoteModel> quotes = await quotesLocalService.getQuotes();

      final cachedQuote = _getCachedQuote(quotes);
      if (cachedQuote != null) return right(cachedQuote);

      final quote = _generateTodayQuote(quotes);

      await _cacheQuote(quote);

      return right(quote);
    } catch (e) {
      return left(ApiErrorHandler.handle(error: e));
    }
  }

  QuoteModel? _getCachedQuote(List<QuoteModel> quotes) {
    final todayString = _getTodayString();

    final savedDate = CacheHelper.getString(key: kQuoteDate);
    final savedId = CacheHelper.getInt(key: kQuoteId);

    if (savedDate == todayString) {
      return quotes.firstWhere(
        (q) => q.id == savedId,
        orElse: () => quotes.first,
      );
    }

    return null;
  }

  QuoteModel _generateTodayQuote(List<QuoteModel> quotes) {
    final today = DateTime.now();
    final index = _generateIndex(today, quotes.length);
    return quotes[index];
  }

  int _generateIndex(DateTime today, int length) {
    final startDate = DateTime(2026, 1, 1);
    return today.difference(startDate).inDays % length;
  }

  Future<void> _cacheQuote(QuoteModel quote) async {
    await CacheHelper.set(key: kQuoteId, value: quote.id);
    await CacheHelper.set(key: kQuoteDate, value: _getTodayString());
  }

  String _getTodayString() {
    final today = DateTime.now();
    return "${today.year}-${today.month}-${today.day}";
  }
}
