import 'package:json_annotation/json_annotation.dart';

import 'quote_model.dart';

part 'quotes_response.g.dart';

@JsonSerializable()
class QuotesResponse {
  final List<QuoteModel> quotes;

  QuotesResponse({required this.quotes});

  factory QuotesResponse.fromJson(Map<String, dynamic> json) =>
      _$QuotesResponseFromJson(json);

  Map<String, dynamic> toJson() => _$QuotesResponseToJson(this);
}