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
  type: json['type'] as String,
  nutrients: (json['nutrients'] as List<dynamic>)
      .map((e) => e as String)
      .toList(),
  effects: (json['effects'] as List<dynamic>).map((e) => e as String).toList(),
  tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
  image: json['image'] as String,
);

Map<String, dynamic> _$RecommendedFoodItemModelToJson(
  RecommendedFoodItemModel instance,
) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'type': instance.type,
  'nutrients': instance.nutrients,
  'effects': instance.effects,
  'tags': instance.tags,
  'image': instance.image,
};
