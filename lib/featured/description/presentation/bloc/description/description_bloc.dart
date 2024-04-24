import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';
import 'package:neo_tour/featured/description/domain/model/tour.dart';
import 'package:neo_tour/featured/description/domain/usecases/get_tours_use_case.dart';

part 'description_event.dart';
part 'description_state.dart';

class DescriptionBloc extends Bloc<DescriptionEvent, DescriptionState> {
  final GetToursUseCase _getToursUseCase;

  DescriptionBloc(this._getToursUseCase) : super(const DescriptionLoading()) {
    on<GetDescriptions>(onGetDescriptions);
  }

  void onGetDescriptions(GetDescriptions event, Emitter<DescriptionState> emit) async {
    try {
      final dataState = await _getToursUseCase.call(event.id ?? 0);
      emit(DescriptionDone(dataState));
    } on DioException catch (e) {
      emit(DescriptionError(e));
    }
  }
}