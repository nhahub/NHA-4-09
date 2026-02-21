import 'package:json_annotation/json_annotation.dart';

part 'meal_model.g.dart';

@JsonSerializable()
class MealModel {
  final String id;
  final String name;
  final String type;
  final List<String> nutrients;
  final List<String> effects;
  final List<String> tags;
  final String image;

  MealModel({
    required this.id,
    required this.name,
    required this.type,
    required this.nutrients,
    required this.effects,
    required this.tags,
    required this.image,
  });

  factory MealModel.fromJson(Map<String, dynamic> json) =>
      _$MealModelFromJson(json);

  Map<String, dynamic> toJson() => _$MealModelToJson(this);
}
