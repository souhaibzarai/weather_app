import 'package:flutter/material.dart';
import '../data/models/weather_service.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({super.key, required this.weatherService});

  final WeatherService weatherService;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('CityName: |   ${weatherService.name}'),
              Text('TimeZone: |   ${weatherService.timezone}'),
              Text('Time: |    ${weatherService.dateTime}'),
              Text('Weather: |    ${weatherService.weather.main}'),
              Text('Country: |    ${weatherService.sys.country}'),
              Text('maxTemp: |    ${weatherService.main.tempMax}'),
              Text('minTemp: |    ${weatherService.main.tempMin}'),
              Text('minTemp: |    ${weatherService.main.temp}'),
            ],
          ),
        ),
      ),
    );
  }
}
