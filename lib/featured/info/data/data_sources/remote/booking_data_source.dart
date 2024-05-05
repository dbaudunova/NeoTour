import 'package:dio/dio.dart';
import 'package:neo_tour/featured/info/data/model/booking_model.dart';

abstract class BookingDataSource {
  Future<BookingModel> createBooking(
      int tourId,
      String phoneNumber,
      int numberOfPeople,
      String comment,
      );
}

class BookingDataSourceImpl extends BookingDataSource {
  @override
  Future<BookingModel> createBooking(
      int tourId,
      String phoneNumber,
      int numberOfPeople,
      String comment,
      ) async {
      String url =
          'http://neotour-production-e7de.up.railway.app/api/booking/addBooking';
      final data = {
        'tourId': tourId,
        'phoneNumber': phoneNumber,
        'numberOfPeople': numberOfPeople,
        'comment': comment,
      };
      Response response = await Dio().post(
        url,
        data: data,
        options: Options(
          headers: {
            'accept': '*/*',
            'Content-Type': 'application/json',
          },
        ),
      );
      // Парсинг данных ответа в модель BookingModel
      return BookingModel.fromJson(response.data);
  }
}
