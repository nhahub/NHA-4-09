import 'dart:convert';

import 'package:flutter/services.dart';

import '../models/quote/quote_model.dart';
import '../models/quote/quotes_response.dart';

class QuotesLocalService {
  Future<List<QuoteModel>> getQuotes() async {
    final String jsonString = await rootBundle.loadString(
      'assets/data/quotes/quotes.json',
    );

    final Map<String, dynamic> decoded = json.decode(jsonString);

    return QuotesResponse.fromJson(decoded).quotes;
  }
}
