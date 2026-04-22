import 'dart:convert';

import 'package:hive_ce_flutter/hive_ce_flutter.dart';

import 'book_model.dart';

class BookModelAdapter extends TypeAdapter<BookModel> {
  @override
  final int typeId = 1;

  @override
  BookModel read(BinaryReader reader) {
    final jsonString = reader.readString();
    final Map<String, dynamic> json = Map<String, dynamic>.from(
      jsonDecode(jsonString),
    );

    return BookModel.fromJson(json);
  }

  @override
  void write(BinaryWriter writer, BookModel obj) {
    final jsonString = jsonEncode(obj.toJson());
    writer.writeString(jsonString);
  }
}
