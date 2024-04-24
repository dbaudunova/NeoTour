part of 'places_bloc.dart';


abstract class PlacesState {
  final DioException? error;
  final List<RecommendedEntity>? place;

  const PlacesState({this.error, this.place});
}

class PlacesLoading extends PlacesState {
  const PlacesLoading();
}

class PlacesDone extends PlacesState {
  const PlacesDone(List<RecommendedEntity> place)
      : super(place: place);
}

class PlacesError extends PlacesState {
  const PlacesError(DioException error) : super(error: error);
}

