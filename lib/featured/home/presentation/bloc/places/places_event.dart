part of 'places_bloc.dart';

abstract class PlacesEvent {}

class GetPlacesTours extends PlacesEvent {
  final String name;

  GetPlacesTours({required this.name});
}
