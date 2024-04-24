import 'package:neo_tour/featured/description/domain/model/review.dart';
import 'package:neo_tour/featured/description/domain/model/tour.dart';

abstract class DescriptionRepository {
  Future<List<ReviewEntity>> getReviews(int id);
  Future<TourEntity> getTours(int id);
}