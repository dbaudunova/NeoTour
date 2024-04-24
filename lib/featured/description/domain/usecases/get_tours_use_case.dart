import 'package:neo_tour/featured/description/domain/model/tour.dart';
import 'package:neo_tour/featured/description/domain/repository/description_repository.dart';

class GetToursUseCase {
  final DescriptionRepository repository;

  GetToursUseCase(this.repository);

  Future<TourEntity> call(int id) async {
    return await repository.getTours(id);
  }
}