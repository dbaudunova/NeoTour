// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tour.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReviewDtoList _$ReviewDtoListFromJson(Map<String, dynamic> json) =>
    ReviewDtoList(
      authorNickname: json['authorNickname'] as String?,
      imageUrl: json['imageUrl'] as String?,
      date: json['date'] as String?,
      text: json['text'] as String?,
    );

Map<String, dynamic> _$ReviewDtoListToJson(ReviewDtoList instance) =>
    <String, dynamic>{
      'authorNickname': instance.authorNickname,
      'imageUrl': instance.imageUrl,
      'date': instance.date,
      'text': instance.text,
    };