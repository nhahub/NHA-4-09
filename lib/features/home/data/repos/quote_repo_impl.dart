import 'dart:async';
import '../../../../core/services/cache_helper.dart';
import '../local_data/quotes.dart';
import '../models/quote_model.dart';

class QuoteRepoImpl {
  static const _keyQuoteId = 'daily_quote_id';
  static const _keyQuoteDate = 'daily_quote_date';

  Future<Quote> getQuoteOfTheDay() async {
    final DateTime today = DateTime.now();
    final String todayString = "${today.year}-${today.month}-${today.day}";

    final savedDate = CacheHelper.getString(key: _keyQuoteDate);
    final savedId = CacheHelper.getInt(key: _keyQuoteId);

    if (savedDate == todayString && savedId != 0) {
      final Map<String, Object> data = quotes['quotes']!.firstWhere(
        (q) => q['id'] == savedId,
      );
      return Quote.fromMap(data);
    } else {
      final int totalQuotes = quotes['quotes']!.length;
      final DateTime startDate = DateTime(2026, 1, 1);
      final int index = today.difference(startDate).inDays % totalQuotes;

      final Map<String, Object> data = quotes['quotes']![index];
      final Quote quote = Quote.fromMap(data);

      await CacheHelper.set(key: _keyQuoteId, value: quote.id);
      await CacheHelper.set(key: _keyQuoteDate, value: todayString);

      return quote;
    }
  }
}
