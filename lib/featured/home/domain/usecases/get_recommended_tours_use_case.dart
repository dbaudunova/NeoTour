import 'package:neo_tour/featured/home/domain/model/recommended.dart';
import 'package:neo_tour/featured/home/domain/repository/home_repository.dart';

class GetRecommendedToursUseCase {
  final HomeRepository repository;

  GetRecommendedToursUseCase(this.repository);

  Future<List<RecommendedEntity>> call() async {
    return await repository.getRecommendedTours();
  }
}
