import 'package:dio/dio.dart';
import 'package:softux_weather/constants/secrets/api_keys.dart';
import 'package:softux_weather/constants/strings.dart';

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

  Future<Map<String, dynamic>> getCityWeather(String cityName) async {
    try {
      final response = await dio.get(weatherBaseUrl, queryParameters: {
        'q': cityName,
        'appid': weatherApiKey,
      });

      print(response.data);

      return response.data;
    } catch (e) {
      print('$e');
      return {};
    }
  }
}
