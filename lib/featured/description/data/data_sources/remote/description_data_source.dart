import 'package:dio/dio.dart';
import 'package:neo_tour/featured/description/data/model/review_model.dart';
import 'package:neo_tour/featured/description/data/model/tour_model.dart';

abstract class DescriptionDataSource {
  Future<List<ReviewModel>> getReviews(int id);
  Future<TourModel> getTours(int id);
}

class DescriptionDataSourceImpl implements DescriptionDataSource {
  @override
  Future<List<ReviewModel>> getReviews(int id) async {
    String url =
        'http://neotour-production-e7de.up.railway.app/api/reviews/$id';
    final response = await Dio().get(url);
    final List<dynamic> result = response.data['content'];
    final List<ReviewModel> reviews =
    result.map((json) => ReviewModel.fromJson(json)).toList();
    return reviews;
  }

  @override
  Future<TourModel> getTours(int id) async {
    String url =
        'http://neotour-production-e7de.up.railway.app/api/tours/$id';
    final response = await Dio().get(url);
    final Map<String, dynamic> jsonData = response.data;
    final TourModel tour = TourModel.fromJson(jsonData);
    return tour;
  }
}