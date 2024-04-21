import 'package:neo_tour/featured/home/domain/model/recommended.dart';

abstract class HomeRepository {
  Future<List<RecommendedEntity>> getRecommendedTours();
}