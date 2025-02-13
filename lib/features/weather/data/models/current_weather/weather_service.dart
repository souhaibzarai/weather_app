import 'coord.dart';
import 'main.dart';
import 'sys.dart';
import 'weather.dart';

class WeatherService {
  final Coord coord;
  final Weather weather;
  final Main main;
  final int dateTime;
  final Sys sys;
  final int timezone;
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
      coord: Coord.fromJson(json['coord']),
      weather: Weather.fromJson(json['weather']),
      main: Main.fromJson(json['main']),
      dateTime: json['dt'],
      sys: Sys.fromJson(json['sys']),
      timezone: json['timezone'],
      name: json['name'],
    );
  }

  @override
  String toString() {
    return 'WeatherService(name: $name, coord: $coord, main: $main, sys: $sys, timezone: $timezone)';
  }
}
