import 'package:json_annotation/json_annotation.dart';

part 'recommended_food_item_model.g.dart';

@JsonSerializable()
class RecommendedFoodItemModel {
  final String id;
  final String name;
  final String type;
  final List<String> nutrients;
  final List<String> effects;
  final List<String> tags;
  final String image;

  RecommendedFoodItemModel({
    required this.id,
    required this.name,
    required this.type,
    required this.nutrients,
    required this.effects,
    required this.tags,
    required this.image,
  });

  factory RecommendedFoodItemModel.fromJson(Map<String, dynamic> json) =>
      _$RecommendedFoodItemModelFromJson(json);

  Map<String, dynamic> toJson() => _$RecommendedFoodItemModelToJson(this);
}
