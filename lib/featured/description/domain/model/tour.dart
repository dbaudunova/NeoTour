import 'package:json_annotation/json_annotation.dart';

part 'tour.g.dart';

class TourEntity {
  final int? id;
  final String? name;
  final String? place;
  final String? country;
  final String? description;
  final List<String>? images;
  final List<ReviewDtoList>? reviewDtoList;

  TourEntity({
    this.id,
    this.reviewDtoList,
    this.name,
    this.place,
    this.country,
    this.description,
    this.images,
  });
}

@JsonSerializable()
class ReviewDtoList {
  final String? authorNickname;
  final String? imageUrl;
  final String? date;
  final String? text;

  ReviewDtoList({
    this.authorNickname,
    this.imageUrl,
    this.date,
    this.text,
  });

  factory ReviewDtoList.fromJson(Map<String, dynamic> json) => _$ReviewDtoListFromJson(json);
  Map<String, dynamic> toJson() => _$ReviewDtoListToJson(this);
}

