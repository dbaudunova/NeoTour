part of 'recommended_bloc.dart';

abstract class RecommendedState {
  final DioException? error;
  final List<RecommendedEntity>? recommended;

  const RecommendedState({this.error, this.recommended});
}

class RecommendedLoading extends RecommendedState {
  const RecommendedLoading();
}

class RecommendedDone extends RecommendedState {
  const RecommendedDone(List<RecommendedEntity> recommended)
      : super(recommended: recommended);
}

class RecommendedError extends RecommendedState {
  const RecommendedError(DioException error) : super(error: error);
}
