// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recommended_food_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecommendedFoodItemModel _$RecommendedFoodItemModelFromJson(
  Map<String, dynamic> json,
) => RecommendedFoodItemModel(
  id: json['id'] as String,
  name: json['name'] as String,
  nutrients: (json['nutrients'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  effects: json['effects'] as String,
  tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
  image: json['image'] as String,
  macros: MacrosModel.fromJson(json['macros'] as Map<String, dynamic>),
  mealTime: (json['meal_time'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
);

Map<String, dynamic> _$RecommendedFoodItemModelToJson(
  RecommendedFoodItemModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'nutrients': instance.nutrients,
  'meal_time': instance.mealTime,
  'effects': instance.effects,
  'macros': instance.macros,
  'tags': instance.tags,
  'image': instance.image,
};
