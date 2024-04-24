import 'package:neo_tour/featured/description/domain/model/review.dart';
import 'package:neo_tour/featured/description/domain/repository/description_repository.dart';

class GetReviewsUseCase {
  final DescriptionRepository repository;

  GetReviewsUseCase(this.repository);

  Future<List<ReviewEntity>> call(int id) async {
    return await repository.getReviews(id);
  }
}