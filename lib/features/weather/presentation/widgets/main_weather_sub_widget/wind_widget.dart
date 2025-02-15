import 'package:flutter/material.dart';
import 'package:softux_weather/features/weather/data/models/current_weather/weather_service.dart';

import '../../../../../constants/theme/app_colors.dart';
import 'decorated_container.dart';

class WindWidget extends StatelessWidget {
  const WindWidget(this.weatherService, {super.key});

  final WeatherService weatherService;

  @override
  Widget build(BuildContext context) {
    return DecoratedContainer(
      flex: 1,
      child: Column(
        children: [
          Transform.rotate(
            angle: double.parse('${weatherService.wind.deg}'),
            child: Image.asset(
              'assets/images/wind.png',
              width: 32,
            ),
          ),
          const SizedBox(height: 3),
          Text(
            '${weatherService.wind.speed}km/h',
            style: TextStyle(
              fontSize: 12,
              color: AppColors.widgetDetailTextColor,
              fontFamily: 'specialFont',
            ),
          ),
        ],
      ),
    );
  }
}
