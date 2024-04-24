import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:neo_tour/featured/description/domain/model/review.dart';
import 'package:neo_tour/featured/description/domain/usecases/get_reviews_use_case.dart';

part 'review_event.dart';

part 'review_state.dart';

class ReviewBloc extends Bloc<ReviewEvent, ReviewState> {
  final GetReviewsUseCase _getReviewsUseCase;

  ReviewBloc(this._getReviewsUseCase) : super(const ReviewLoading()) {
    on<GetReviews>(onGetReviews);
  }

  void onGetReviews(GetReviews event, Emitter<ReviewState> emit) async {
    try {
      final dataState = await _getReviewsUseCase.call(event.id ?? 0);
      emit(ReviewDone(dataState));
    } on DioException catch (e) {
      emit(ReviewError(e));
    }
  }
}
