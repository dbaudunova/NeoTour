import 'package:neo_tour/featured/description/domain/model/review.dart';
import 'package:json_annotation/json_annotation.dart';

part 'review_model.g.dart';

@JsonSerializable()
class ReviewModel extends ReviewEntity {
  ReviewModel({
    super.authorNickname,
    super.imageUrl,
    super.text,
  });

  factory ReviewModel.fromJson(Map<String, dynamic> json) =>
      _$ReviewModelFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewModelToJson(this);
}
