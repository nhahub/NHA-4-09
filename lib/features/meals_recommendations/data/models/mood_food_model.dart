import 'package:json_annotation/json_annotation.dart';

part 'mood_food_model.g.dart';

@JsonSerializable()
class MoodFoodModel {
  final String id;
  final String name;
  final String type;
  final List<String> nutrients;
  final List<String> effects;
  final List<String> tags;
  final String image;

  MoodFoodModel({
    required this.id,
    required this.name,
    required this.type,
    required this.nutrients,
    required this.effects,
    required this.tags,
    required this.image,
  });

  factory MoodFoodModel.fromJson(Map<String, dynamic> json) =>
      _$MoodFoodModelFromJson(json);

  Map<String, dynamic> toJson() => _$MoodFoodModelToJson(this);
}
