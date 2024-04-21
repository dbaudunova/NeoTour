import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:dio/dio.dart';

part 'review_event.dart';

part 'review_state.dart';

class ReviewBloc extends Bloc<ReviewEvent, ReviewState> {
  ReviewBloc() : super(const RecommendedLoading()) {
    on<GetReviews>(onGetReviews);
  }

  void onGetReviews(GetReviews event, Emitter<ReviewState> emit) async {}
}
