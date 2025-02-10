import 'package:softux_weather/features/home/data/models/city.dart';
import 'package:softux_weather/features/home/data/webservices/home_web_services.dart';

class HomeRepository {
  HomeWebServices homeWebServices;

  HomeRepository(this.homeWebServices);

  Future<City> fetchCityName(double lat, double lng) async {
    final cityDetails = await homeWebServices.getCityDetails(lat, lng);

    return City.fromJson(cityDetails);
  }
}
