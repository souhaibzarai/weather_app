import 'package:dio/dio.dart';
import 'package:softux_weather/constants/strings.dart';

class HomeWebServices {
  late Dio dio;

  HomeWebServices() {
    final BaseOptions options = BaseOptions(
      receiveDataWhenStatusError: true,
      connectTimeout: Duration(seconds: 20),
      receiveTimeout: Duration(seconds: 20),
    );
    dio = Dio(options);
  }

  Future<dynamic> getCityDetails(double lat, double lng) async {
    try {
      final response = await dio.get(
        getCityNameBaseUrl,
        queryParameters: {
          'lat': lat,
          'lng': lng,
          'format': 'json',
        },
      );
      return response.data;
    } catch (e) {
      print('error occurred $e');
    }
  }
}
