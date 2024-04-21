part of 'review_bloc.dart';

abstract class ReviewState {
  final DioException? error;

  const ReviewState({this.error});
}

class RecommendedLoading extends ReviewState {
  const RecommendedLoading();
}

class RecommendedDone extends ReviewState {
  const RecommendedDone() : super();
}

class RecommendedError extends ReviewState {
  const RecommendedError(DioException error) : super(error: error);
}
