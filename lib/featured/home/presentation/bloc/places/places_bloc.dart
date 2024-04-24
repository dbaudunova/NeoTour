import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:neo_tour/featured/home/domain/model/recommended.dart';
import 'package:neo_tour/featured/home/domain/usecases/get_places_tours_use_case.dart';

part 'places_event.dart';
part 'places_state.dart';

class PlacesBloc extends Bloc<PlacesEvent, PlacesState> {
  final GetPlacesToursUseCase _getPlacesToursUseCase;

  PlacesBloc(this._getPlacesToursUseCase)
      : super(const PlacesLoading()) {
    on<GetPlacesTours>(onGetTours);
  }

  void onGetTours(
      GetPlacesTours event, Emitter<PlacesState> emit) async {
    emit(const PlacesLoading());
    try {
      final dataState = await _getPlacesToursUseCase.call(event.name);
      emit(PlacesDone(dataState));
    } on DioException catch (e) {
      emit(PlacesError(e));
    }
  }
}
