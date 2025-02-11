import 'package:softux_weather/features/weather/data/models/coord.dart';
import 'package:softux_weather/features/weather/data/models/main.dart';
import 'package:softux_weather/features/weather/data/models/sys.dart';
import 'package:softux_weather/features/weather/data/models/weather.dart';

class WeatherService {
  final Coord coord;
  final Weather weather;
  final Main main;
  final double dateTime;
  final Sys sys;
  final double timezone;
  final String name;

  WeatherService({
    required this.coord,
    required this.weather,
    required this.main,
    required this.dateTime,
    required this.sys,
    required this.timezone,
    required this.name,
  });

  factory WeatherService.fromJson(Map<String, dynamic> json) {
    return WeatherService(
      coord: json['coord'],
      weather: json['weather'],
      main: json['main'],
      dateTime: json['dt'],
      sys: json['sys'],
      timezone: json['timezone'],
      name: json['name'],
    );
  }
}
