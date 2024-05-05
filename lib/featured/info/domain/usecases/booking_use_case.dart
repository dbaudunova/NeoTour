import 'package:neo_tour/featured/info/domain/model/booking.dart';
import 'package:neo_tour/featured/info/domain/repository/booking_repository.dart';

class BookingUseCase {
  final BookingRepository repository;

  BookingUseCase(this.repository);

  Future<BookingEntity> call(
    int tourId,
    String phoneNumber,
    int numberOfPeople,
    String comment,
  ) async {
    return await repository.createBooking(
      tourId,
      phoneNumber,
      numberOfPeople,
      comment,
    );
  }
}
