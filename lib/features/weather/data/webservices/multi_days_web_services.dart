import 'package:dio/dio.dart';

import '../../../../constants/secrets/api_keys.dart';
import '../../../../constants/strings.dart';

class MultiDaysWebServices {
  late Dio dio;

  final BaseOptions options = BaseOptions(
    receiveDataWhenStatusError: true,
    sendTimeout: Duration(seconds: 20),
    receiveTimeout: Duration(seconds: 20),
  );

  MultiDaysWebServices() {
    dio = Dio(options);
  }

  Future<dynamic> getMultiDaysWeatherForecast(String cityName) async {
    try {
      final response = await dio.get(getMultiDaysForecast, queryParameters: {
        'q': cityName,
        'appid': weatherApiKey,
      });

      return response.data;
    } catch (e) {
      throw Exception('Error Occurred | $e while retrieved data in webservice');
    }
  }
}
