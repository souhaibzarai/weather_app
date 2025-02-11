import 'package:location/location.dart';

class LocationHelper {
  static Future<LocationData?> getCurrentLocation() async {
    late LocationData location;

    late bool isServiceEnabled;
    late PermissionStatus permissionStatus;

    isServiceEnabled = await Location.instance.serviceEnabled();
    if (!isServiceEnabled) {
      isServiceEnabled = await Location.instance.requestService();
      if (!isServiceEnabled) {
        throw Exception('Location Service is not enabled.');
      }
    }
    permissionStatus = await Location.instance.hasPermission();
    if (permissionStatus != PermissionStatus.granted) {
      permissionStatus = await Location.instance.requestPermission();
      if (permissionStatus != PermissionStatus.granted) {
        throw Exception('Location Permission is not granted.');
      }
    }

    location = await Location.instance.getLocation();

    return location;
  }
}
