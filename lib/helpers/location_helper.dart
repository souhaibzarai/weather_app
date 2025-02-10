import 'package:geolocator/geolocator.dart';

class LocationHelper {
  static Future<Position>? getMyCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission locationPermission;
    late Position? position;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      position = null;

      return Future.error(
        'Location services are Disabled.',
      );
    }

    locationPermission = await Geolocator.checkPermission();
    if (locationPermission == LocationPermission.denied) {
      locationPermission = await Geolocator.requestPermission();
      if (locationPermission == LocationPermission.deniedForever) {
        position = null;

        return Future.error(
          'Location Permission are permanently denied, we cannot request for permission.',
        );
      }
    }

    position = await Geolocator.getCurrentPosition(
      locationSettings: AndroidSettings(
        accuracy: LocationAccuracy.high,
      ),
    );

    return position;
  }
}
