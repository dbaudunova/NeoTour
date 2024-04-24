part of 'description_bloc.dart';

abstract class DescriptionEvent {}

class GetDescriptions extends DescriptionEvent {
  final int? id;

  GetDescriptions({this.id});
}
