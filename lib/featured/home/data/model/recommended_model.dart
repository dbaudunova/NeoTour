import 'package:json_annotation/json_annotation.dart';
import 'package:neo_tour/featured/home/domain/model/recommended.dart';

part 'recommended_model.g.dart';

@JsonSerializable()
class RecommendedModel extends RecommendedEntity {
  RecommendedModel({
    super.id,
    super.name,
    super.imageUrl,
  });

  factory RecommendedModel.fromJson(Map<String, dynamic> json) =>
      _$RecommendedModelFromJson(json);

  Map<String, dynamic> toJson() => _$RecommendedModelToJson(this);
}
