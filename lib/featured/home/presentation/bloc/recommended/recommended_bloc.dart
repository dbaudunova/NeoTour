import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:neo_tour/featured/home/domain/model/recommended.dart';
import 'package:neo_tour/featured/home/domain/usecases/get_recommended_tours_use_case.dart';

part 'recommended_event.dart';

part 'recommended_state.dart';

class RecommendedBloc extends Bloc<RecommendedEvent, RecommendedState> {
  final GetRecommendedToursUseCase _getRecommendedToursUseCase;

  RecommendedBloc(this._getRecommendedToursUseCase)
      : super(const RecommendedLoading()) {
    on<GetRecommendedTours>(onGetTours);
  }

  void onGetTours(
      GetRecommendedTours event, Emitter<RecommendedState> emit) async {
    emit(const RecommendedLoading());
    try {
      final dataState = await _getRecommendedToursUseCase.call();
      emit(RecommendedDone(dataState));
    } on DioException catch (e) {
      emit(RecommendedError(e));
    }
  }
}
