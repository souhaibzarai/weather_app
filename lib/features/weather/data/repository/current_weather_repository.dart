import '../models/weather_service.dart';
import '../webservices/weather_web_services.dart';

class WeatherRepository {
  final WeatherWebServices weatherWebServices;

  const WeatherRepository(this.weatherWebServices);

  Future<WeatherService> fetchCurrentCityWeather(String cityName) async {
    final currentWeather = await weatherWebServices.getCurrentWeather(cityName);

    return WeatherService.fromJson(currentWeather);
  }
}
