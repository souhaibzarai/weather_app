import 'package:dio/dio.dart';
import '../../../../constants/secrets/api_keys.dart';
import '../../../../constants/strings.dart';

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

  Future<Map<String, dynamic>> getCityDetails(double lat, double lng) async {
    try {
      final response = await dio.get(
        locationBaseUrl,
        queryParameters: {
          'latlng': '$lat,$lng',
          'result_type': 'administrative_area_level_2',
          'key': mapsApiKey,
        },
      );
      return response.data;
    } catch (e) {
      throw Exception('error occurred $e');
    }
  }
}
