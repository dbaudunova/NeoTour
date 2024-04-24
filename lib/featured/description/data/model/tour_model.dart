import 'package:neo_tour/featured/description/domain/model/tour.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tour_model.g.dart';

@JsonSerializable()
class TourModel extends TourEntity {
  TourModel({
    super.id,
    super.country,
    super.description,
    super.name,
    super.images,
    super.place,
  });

  factory TourModel.fromJson(Map<String, dynamic> json) =>
      _$TourModelFromJson(json);

  Map<String, dynamic> toJson() => _$TourModelToJson(this);
}
