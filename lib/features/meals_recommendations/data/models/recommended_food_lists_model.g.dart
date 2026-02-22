// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recommended_food_lists_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecommendedFoodListsModel _$RecommendedFoodListsModelFromJson(
  Map<String, dynamic> json,
) => RecommendedFoodListsModel(
  meals: (json['meals'] as List<dynamic>)
      .map((e) => RecommendedFoodItemModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  snacks: (json['snacks'] as List<dynamic>)
      .map((e) => RecommendedFoodItemModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  drinks: (json['drinks'] as List<dynamic>)
      .map((e) => RecommendedFoodItemModel.fromJson(e as Map<String, dynamic>))
      .toList(),
  avoid: (json['avoid'] as List<dynamic>)
      .map((e) => RecommendedFoodItemModel.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$RecommendedFoodListsModelToJson(
  RecommendedFoodListsModel instance,
) => <String, dynamic>{
  'meals': instance.meals,
  'snacks': instance.snacks,
  'drinks': instance.drinks,
  'avoid': instance.avoid,
};
