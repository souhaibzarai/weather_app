import 'package:flutter/material.dart';
import '../../../../constants/theme/app_colors.dart';
import '../../data/models/current_weather/weather_service.dart';
import '../../data/models/multi_days_weather/list.dart';
import '../widgets/daily_item.dart';
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
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                MainWeather(weatherService: weatherService),
                const SizedBox(height: 8),
                buildTextForecast(),
                const SizedBox(height: 8),
                buildDailyWidgetLayer(),
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

Widget buildDailyWidgetLayer() {
  return SizedBox(
    height: 350,
    child: ListView.builder(
      // scrollDirection: Axis.vertical,
      itemCount: 5,
      itemBuilder: (context, index) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                '  Fri, Feb 14',
                style: TextStyle(
                  fontSize: 18,
                ),
                textAlign: TextAlign.start,
              ),
            ),
            SizedBox(
              height: 200,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: 8,
                itemBuilder: (context, index) {
                  return DailyItemWidget(index: index);
                },
              ),
            ),
          ],
        );
      },
    ),
  );
}
