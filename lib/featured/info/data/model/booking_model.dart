import 'package:neo_tour/featured/info/domain/model/booking.dart';
import 'package:json_annotation/json_annotation.dart';

part 'booking_model.g.dart';

@JsonSerializable()
class BookingModel extends BookingEntity {
  BookingModel({
    super.tourId,
    super.phoneNumber,
    super.numberOfPeople,
    super.comment,
  });

  factory BookingModel.fromJson(Map<String, dynamic> json) => _$BookingModelFromJson(json);
  Map<String, dynamic> toJson() => _$BookingModelToJson(this);
}
