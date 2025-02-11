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

  Future<dynamic> getCityWeather(String cityName) async {
    try {
      final response = await dio.get(weatherBaseUrl, queryParameters: {
        'q': cityName,
        'appid': weatherApiKey,
      });

      print('Webservice executed ${response.data}, $cityName');

      return response.data;
    } catch (e) {
      print('$e');
      return {};
    }
  }
}
