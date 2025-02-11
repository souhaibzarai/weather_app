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
      print("Making request to: $locationBaseUrl with lat: $lat, lng: $lng");
      final response = await dio.get(
        locationBaseUrl,
        queryParameters: {
          'latlng': '$lat,$lng',
          'result_type': 'administrative_area_level_2',
          'key': mapsApiKey,
        },
      );
      print("Response received: ${response.data['resuls']}");
      return response.data;
    } catch (e) {
      print("Error in getCityDetails: $e");
      throw Exception('error occurred $e');
    }
  }
}
