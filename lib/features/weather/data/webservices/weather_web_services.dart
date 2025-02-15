import 'package:dio/dio.dart';

import '../../../../constants/secrets/api_keys.dart';
import '../../../../constants/strings.dart';

class WeatherWebServices {
  late Dio dio;

  final BaseOptions options = BaseOptions(
    receiveDataWhenStatusError: true,
    sendTimeout: Duration(seconds: 20),
    receiveTimeout: Duration(seconds: 20),
  );

  WeatherWebServices() {
    dio = Dio(options);
  }

  Future<dynamic> getCurrentWeather(String cityName) async {
    try {
      final response = await dio.get(weatherBaseUrl, queryParameters: {
        'q': cityName,
        'appid': weatherApiKey,
      });

      return response.data;
    } catch (e) {
      throw Exception('$e');
    }
  }
}
