import 'package:neo_tour/featured/description/data/data_sources/remote/description_data_source.dart';
import 'package:neo_tour/featured/description/domain/model/tour.dart';
import 'package:neo_tour/featured/description/domain/repository/description_repository.dart';

class DescriptionRepositoryImpl implements DescriptionRepository {
  final DescriptionDataSource dataSource;

  DescriptionRepositoryImpl(this.dataSource);

  @override
  Future<TourEntity> getTours(int id) async {
    return await dataSource.getTours(id);
  }
}
