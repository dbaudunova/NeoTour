import 'package:neo_tour/featured/description/domain/model/tour.dart';

abstract class DescriptionRepository {
  Future<TourEntity> getTours(int id);
}