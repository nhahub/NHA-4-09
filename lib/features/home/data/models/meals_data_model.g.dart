// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'meals_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MealsDataModel _$MealsDataModelFromJson(Map<String, dynamic> json) =>
    MealsDataModel(
      meals: (json['meals'] as Map<String, dynamic>).map(
        (k, e) =>
            MapEntry(k, MealsCategoryModel.fromJson(e as Map<String, dynamic>)),
      ),
    );

Map<String, dynamic> _$MealsDataModelToJson(MealsDataModel instance) =>
    <String, dynamic>{'meals': instance.meals};
