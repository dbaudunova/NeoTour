// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'booking_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookingModel _$BookingModelFromJson(Map<String, dynamic> json) => BookingModel(
      tourId: json['tourId'] as int?,
      phoneNumber: json['phoneNumber'] as String?,
      numberOfPeople: json['numberOfPeople'] as int?,
      comment: json['comment'] as String?,
    );

Map<String, dynamic> _$BookingModelToJson(BookingModel instance) =>
    <String, dynamic>{
      'tourId': instance.tourId,
      'phoneNumber': instance.phoneNumber,
      'numberOfPeople': instance.numberOfPeople,
      'comment': instance.comment,
    };
