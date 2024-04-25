part of 'description_bloc.dart';

abstract class DescriptionState {
  final DioException? error;
  final TourEntity? description;

  const DescriptionState({this.error, this.description});
}

class DescriptionLoading extends DescriptionState {
  const DescriptionLoading();
}

class DescriptionDone extends DescriptionState {
  const DescriptionDone(TourEntity description)
      : super(description: description);
}

class DescriptionError extends DescriptionState {
  const DescriptionError(DioException error) : super(error: error);
}


