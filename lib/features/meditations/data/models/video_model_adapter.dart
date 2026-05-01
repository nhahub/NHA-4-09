import 'dart:convert';
import 'package:hive_ce_flutter/hive_ce_flutter.dart';
import 'video_model.dart';

class VideoModelAdapter extends TypeAdapter<VideoModel> {
  @override
  final int typeId = 3;

  @override
  VideoModel read(BinaryReader reader) {
    final jsonString = reader.readString();
    final Map<String, dynamic> json = Map<String, dynamic>.from(
      jsonDecode(jsonString),
    );

    return VideoModel.fromJson(json);
  }

  @override
  void write(BinaryWriter writer, VideoModel obj) {
    final jsonString = jsonEncode(obj.toJson());
    writer.writeString(jsonString);
  }
}
