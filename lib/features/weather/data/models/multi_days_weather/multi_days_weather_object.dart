import 'main.dart';
import 'weather.dart';
import 'wind.dart';

class MultiDaysWeatherObject {
  final int dateTime;
  final Main main;
  final Weather weather;
  final Wind wind;

  const MultiDaysWeatherObject({
    required this.dateTime,
    required this.main,
    required this.weather,
    required this.wind,
  });

  factory MultiDaysWeatherObject.fromJson(Map<String, dynamic> json) {
    return MultiDaysWeatherObject(
      dateTime: json['dt'],
      main: Main.fromJson(json['main']),
      weather: Weather.fromJson(json['weather']),
      wind: Wind.fromJson(json['wind']),
    );
  }
}
