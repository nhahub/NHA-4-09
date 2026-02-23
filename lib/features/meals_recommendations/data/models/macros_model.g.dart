// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'macros_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MacrosModel _$MacrosModelFromJson(Map<String, dynamic> json) => MacrosModel(
  kcal: (json['kcal'] as num).toDouble(),
  carbohydrates: (json['carbohydrates'] as num).toDouble(),
  proteins: (json['proteins'] as num).toDouble(),
  fats: (json['fats'] as num).toDouble(),
);

Map<String, dynamic> _$MacrosModelToJson(MacrosModel instance) =>
    <String, dynamic>{
      'kcal': instance.kcal,
      'carbohydrates': instance.carbohydrates,
      'proteins': instance.proteins,
      'fats': instance.fats,
    };
