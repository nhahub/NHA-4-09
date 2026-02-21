import 'package:json_annotation/json_annotation.dart';
import 'meals_category_model.dart';

part 'meals_data_model.g.dart';

@JsonSerializable()
class MealsDataModel {
  final Map<String, MealsCategoryModel> meals;

  MealsDataModel({required this.meals});

  factory MealsDataModel.fromJson(Map<String, dynamic> json) =>
      _$MealsDataModelFromJson(json);

  Map<String, dynamic> toJson() => _$MealsDataModelToJson(this);
}
