import 'package:neo_tour/featured/home/data/data_sources/remote/home_data_source.dart';
import 'package:neo_tour/featured/home/domain/model/recommended.dart';
import 'package:neo_tour/featured/home/domain/repository/home_repository.dart';

class HomeRepositoryImpl implements HomeRepository {

  final HomeDataSource dataSource;

  HomeRepositoryImpl(this.dataSource);

  @override
  Future<List<RecommendedEntity>> getRecommendedTours() async {
    return await dataSource.getRecommendedTours();
  }

  @override
  Future<List<RecommendedEntity>> getPlacesTours(String name) async {
    return await dataSource.getPlacesTours(name);
  }
}