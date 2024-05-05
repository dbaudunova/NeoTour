import 'package:neo_tour/featured/info/domain/model/booking.dart';

abstract class BookingRepository {
  Future<BookingEntity> createBooking(
    int tourId,
    String phoneNumber,
    int numberOfPeople,
    String comment,
  );
}
