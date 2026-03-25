import 'package:json_annotation/json_annotation.dart';

part 'quote_model.g.dart';

@JsonSerializable()
class QuoteModel {
  final int id;
  final String quote;
  final String author;

  const QuoteModel({
    required this.id,
    required this.quote,
    required this.author,
  });

  factory QuoteModel.fromJson(Map<String, dynamic> json) =>
      _$QuoteModelFromJson(json);

  Map<String, dynamic> toJson() => _$QuoteModelToJson(this);
}