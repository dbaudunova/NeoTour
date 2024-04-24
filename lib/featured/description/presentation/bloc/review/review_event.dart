part of 'review_bloc.dart';

abstract class ReviewEvent {}

class GetReviews extends ReviewEvent {
  final int? id;

  GetReviews({this.id});
}