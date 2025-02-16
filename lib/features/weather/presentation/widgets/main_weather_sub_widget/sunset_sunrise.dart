import 'package:flutter/material.dart';
import 'package:softux_weather/features/weather/presentation/helper/weather_methods_helper.dart';

import '../../../../../constants/theme/app_colors.dart';
import '../../../data/models/weather_service.dart';
import 'decorated_container.dart';

class SunsetSunriseWidget extends StatelessWidget {
  const SunsetSunriseWidget(this.weatherService, {super.key});

  final WeatherService weatherService;

  @override
  Widget build(BuildContext context) {
    return DecoratedContainer(
      flex: 2,
      child: Column(
        children: [
          Text(
            'Sunrise - Sunset',
            style: TextStyle(
              color: AppColors.widgetMainTextColor,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 3),
          Text(
            '${WeatherMethodsHelper.formatHour(weatherService.sys.sunrise)} - ${WeatherMethodsHelper.formatHour(weatherService.sys.sunset)}',
            style: TextStyle(
              color: AppColors.widgetDetailTextColor,
              fontSize: 12,
              fontFamily: 'specialFont',
            ),
          ),
        ],
      ),
    );
  }
}
