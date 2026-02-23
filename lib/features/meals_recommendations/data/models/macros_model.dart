import 'package:json_annotation/json_annotation.dart';
part 'macros_model.g.dart'; 

@JsonSerializable()
class MacrosModel {
  final double kcal;
  final double carbohydrates;
  final double proteins;
  final double fats;

  MacrosModel({
    required this.kcal,
    required this.carbohydrates,
    required this.proteins,
    required this.fats,
  });

  factory MacrosModel.fromJson(Map<String, dynamic> json) => _$MacrosModelFromJson(json);

  Map<String, dynamic> toJson() => _$MacrosModelToJson(this);
}