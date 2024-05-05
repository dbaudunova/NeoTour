// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tour_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TourModel _$TourModelFromJson(Map<String, dynamic> json) => TourModel(
      id: json['id'] as int?,
      country: json['country'] as String?,
      description: json['description'] as String?,
      name: json['name'] as String?,
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      place: json['place'] as String?,
      reviewDtoList: (json['reviewDtoList'] as List<dynamic>?)
          ?.map((e) => ReviewDtoList.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$TourModelToJson(TourModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'place': instance.place,
      'country': instance.country,
      'description': instance.description,
      'images': instance.images,
      'reviewDtoList': instance.reviewDtoList,
    };
