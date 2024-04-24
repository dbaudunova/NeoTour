part of 'review_bloc.dart';

abstract class ReviewState {
  final DioException? error;
  final List<ReviewEntity>? review;

  const ReviewState({this.error, this.review});
}

class ReviewLoading extends ReviewState {
  const ReviewLoading();
}

class ReviewDone extends ReviewState {
  const ReviewDone(List<ReviewEntity> review)
      : super(review: review);
}

class ReviewError extends ReviewState {
  const ReviewError(DioException error) : super(error: error);
}
