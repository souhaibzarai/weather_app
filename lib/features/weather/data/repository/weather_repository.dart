import 'package:softux_weather/features/weather/data/models/weather_service.dart';
import 'package:softux_weather/features/weather/data/webservices/weather_web_services.dart';

class WeatherRepository {
  final WeatherWebServices weatherWebServices;

  const WeatherRepository(this.weatherWebServices);

  Future<WeatherService> fetchCurrentCityWeather(String cityName) async {
    final currentWeather = await weatherWebServices.getCityWeather(cityName);

    return WeatherService.fromJson(currentWeather);
  }
}
