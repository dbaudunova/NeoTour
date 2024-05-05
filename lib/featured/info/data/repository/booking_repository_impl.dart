import 'package:neo_tour/featured/info/data/data_sources/remote/booking_data_source.dart';
import 'package:neo_tour/featured/info/domain/model/booking.dart';
import 'package:neo_tour/featured/info/domain/repository/booking_repository.dart';

class BookingRepositoryImpl implements BookingRepository {
  final BookingDataSource dataSource;

  BookingRepositoryImpl(this.dataSource);

  @override
  Future<BookingEntity> createBooking(
    int tourId,
    String phoneNumber,
    int numberOfPeople,
    String comment,
  ) async {
    return await dataSource.createBooking(
      tourId,
      phoneNumber,
      numberOfPeople,
      comment,
    );
  }
}
