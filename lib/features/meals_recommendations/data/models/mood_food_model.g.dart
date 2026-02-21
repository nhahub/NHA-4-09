// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mood_food_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MoodFoodModel _$MoodFoodModelFromJson(Map<String, dynamic> json) =>
    MoodFoodModel(
      id: json['id'] as String,
      name: json['name'] as String,
      type: json['type'] as String,
      nutrients: (json['nutrients'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      effects: (json['effects'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
      image: json['image'] as String,
    );

Map<String, dynamic> _$MoodFoodModelToJson(MoodFoodModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'type': instance.type,
      'nutrients': instance.nutrients,
      'effects': instance.effects,
      'tags': instance.tags,
      'image': instance.image,
    };
