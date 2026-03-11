// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'therapist_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TherapistModel _$TherapistModelFromJson(Map<String, dynamic> json) =>
    TherapistModel(
      id: json['id'] as String,
      image: json['image'] as String,
      name: json['name'] as String,
      speciality: json['speciality'] as String,
      discount: json['discount'] as num,
      livePrice: json['live_price'] as num,
      chatPrice: json['chat_price'] as num,
      about: json['about'] as String,
      yearsOfExperience: json['years_of_experience'] as num,
      language: json['language'] as String,
      location: json['location'] as String,
      ratingSummary: TherapistRatingSummary.fromJson(
        json['ratingSummary'] as Map<String, dynamic>,
      ),
    );

Map<String, dynamic> _$TherapistModelToJson(TherapistModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'image': instance.image,
      'name': instance.name,
      'speciality': instance.speciality,
      'about': instance.about,
      'discount': instance.discount,
      'live_price': instance.livePrice,
      'chat_price': instance.chatPrice,
      'years_of_experience': instance.yearsOfExperience,
      'language': instance.language,
      'location': instance.location,
      'ratingSummary': instance.ratingSummary,
    };
