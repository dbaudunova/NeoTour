// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recommended_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RecommendedModel _$RecommendedModelFromJson(Map<String, dynamic> json) =>
    RecommendedModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      imageUrl: json['imageUrl'] as String?,
    );

Map<String, dynamic> _$RecommendedModelToJson(RecommendedModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'imageUrl': instance.imageUrl,
    };
