import '../models/weather_service.dart';
import '../webservices/weather_web_services.dart';

class WeatherRepository {
  final WeatherWebServices weatherWebServices;

  const WeatherRepository(this.weatherWebServices);

  Future<WeatherService> fetchCurrentCityWeather(String cityName) async {
    final currentWeather = await weatherWebServices.getCityWeather(cityName);

    print('Repository executed $currentWeather, $cityName');

    return WeatherService.fromJson(currentWeather);
  }
}
