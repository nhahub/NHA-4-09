import 'dart:convert';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';
import 'article_model.dart';

class ArticleModelAdapter extends TypeAdapter<ArticleModel> {
  @override
  final int typeId = 2;

  @override
  ArticleModel read(BinaryReader reader) {
    final jsonString = reader.readString();
    final Map<String, dynamic> json = Map<String, dynamic>.from(
      jsonDecode(jsonString),
    );

    return ArticleModel.fromJson(json);
  }

  @override
  void write(BinaryWriter writer, ArticleModel obj) {
    final jsonString = jsonEncode(obj.toJson());
    writer.writeString(jsonString);
  }
}
