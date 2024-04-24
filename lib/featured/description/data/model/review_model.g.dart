// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReviewModel _$ReviewModelFromJson(Map<String, dynamic> json) => ReviewModel(
      authorNickname: json['authorNickname'] as String?,
      imageUrl: json['imageUrl'] as String?,
      text: json['text'] as String?,
    );

Map<String, dynamic> _$ReviewModelToJson(ReviewModel instance) =>
    <String, dynamic>{
      'imageUrl': instance.imageUrl,
      'authorNickname': instance.authorNickname,
      'text': instance.text,
    };
