import 'package:neo_tour/featured/home/data/model/recommended_model.dart';
import 'package:dio/dio.dart';

abstract class HomeDataSource {
  Future<List<RecommendedModel>> getRecommendedTours();
  Future<List<RecommendedModel>> getPlacesTours(String name);
}

class HomeDataSourceImpl implements HomeDataSource {

  @override
  Future<List<RecommendedModel>> getRecommendedTours() async {
    const url =
        'https://neotour-production-e7de.up.railway.app/api/tours?season=3&params=recommended';
    final response = await Dio().get(url);
    final List<dynamic> result =response.data['content'];
    final List<RecommendedModel> tours = result
        .map((json) => RecommendedModel.fromJson(json))
        .toList();
    return tours;
  }

  @override
  Future<List<RecommendedModel>> getPlacesTours(String name) async {
    String url =
        'https://neotour-production-e7de.up.railway.app/api/tours?season=3&params=$name';
    final response = await Dio().get(url);
    final List<dynamic> result =response.data['content'];
    final List<RecommendedModel> tours = result
        .map((json) => RecommendedModel.fromJson(json))
        .toList();
    return tours;
  }
}
