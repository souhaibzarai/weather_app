import 'package:flutter/material.dart';
import 'package:softux_weather/features/weather/presentation/helper/image_helper.dart';
import '../../data/models/weather_service.dart';

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
              Image.asset(
                'assets/images/weather_status/${ImageHelper.getImagePath(weatherService)}',
                height: 150,
                width: 150,
              ),
              Text('CityName: |   ${weatherService.name}'),
              Text('TimeZone: |   ${weatherService.timezone}'),
              Text('Time: |    ${weatherService.dateTime}'),
              Text('Weather: |    ${weatherService.weather.main}'),
              Text('Weather: |    ${weatherService.weather.description}'),
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
