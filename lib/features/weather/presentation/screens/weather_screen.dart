import 'package:flutter/material.dart';
import 'package:softux_weather/features/weather/presentation/widgets/daily_layer.dart';
import '../../../../constants/theme/app_colors.dart';
import '../../data/models/weather_service.dart';
import '../../data/models/multi_days_weather/list.dart';
import '../widgets/main_weather.dart';

class WeatherScreen extends StatelessWidget {
  const WeatherScreen({
    super.key,
    required this.weatherService,
    required this.daysList,
  });

  final WeatherService weatherService;
  final DaysList daysList;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MainWeather(weatherService: weatherService),
                const SizedBox(height: 8),
                buildTextForecast(),
                const SizedBox(height: 8),
                DailyLayer(daysList: daysList),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

Widget buildTextForecast() {
  return Text(
    '5 Days Forecast:',
    style: TextStyle(
      color: AppColors.mainColor,
      fontSize: 20,
    ),
  );
}
