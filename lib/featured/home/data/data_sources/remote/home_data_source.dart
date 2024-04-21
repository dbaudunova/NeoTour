import 'package:neo_tour/featured/home/data/model/recommended_model.dart';
import 'package:dio/dio.dart';

abstract class HomeDataSource {
  Future<List<RecommendedModel>> getRecommendedTours();
}

class HomeDataSourceImpl implements HomeDataSource {

  @override
  Future<List<RecommendedModel>> getRecommendedTours() async {
    String url =
        'https://neotour-production-e7de.up.railway.app/api/tours?page=0&size=3&season=3&params=recommended';
    final response = await Dio().get(url);
    final List<dynamic> result =response.data['content'];
    final List<RecommendedModel> tours = result
        .map((json) => RecommendedModel.fromJson(json))
        .toList();
    return tours;
  }
}
