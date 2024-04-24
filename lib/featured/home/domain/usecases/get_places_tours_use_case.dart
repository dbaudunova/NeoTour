import 'package:neo_tour/featured/home/domain/model/recommended.dart';
import 'package:neo_tour/featured/home/domain/repository/home_repository.dart';

class GetPlacesToursUseCase {
  final HomeRepository repository;

  GetPlacesToursUseCase(this.repository);

  Future<List<RecommendedEntity>> call(String name) async {
    return await repository.getPlacesTours(name);
  }
}