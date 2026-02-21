// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meals_category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MealsCategoryModel _$MealsCategoryModelFromJson(Map<String, dynamic> json) =>
    MealsCategoryModel(
      meals: (json['meals'] as List<dynamic>)
          .map((e) => MoodFoodModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      snacks: (json['snacks'] as List<dynamic>)
          .map((e) => MoodFoodModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      drinks: (json['drinks'] as List<dynamic>)
          .map((e) => MoodFoodModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      avoid: (json['avoid'] as List<dynamic>)
          .map((e) => MoodFoodModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MealsCategoryModelToJson(MealsCategoryModel instance) =>
    <String, dynamic>{
      'meals': instance.meals,
      'snacks': instance.snacks,
      'drinks': instance.drinks,
      'avoid': instance.avoid,
    };
