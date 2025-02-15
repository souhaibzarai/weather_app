import 'package:flutter/material.dart';
import 'package:softux_weather/features/weather/data/models/current_weather/weather_service.dart';
import 'package:softux_weather/features/weather/presentation/widgets/main_weather_sub_widget/sunset_sunrise.dart';
import 'package:softux_weather/features/weather/presentation/widgets/main_weather_sub_widget/wind_widget.dart';

import '../../../../constants/app_constants.dart';
import '../../../../constants/theme/app_colors.dart';

class MainWeather extends StatelessWidget {
  const MainWeather({super.key, required this.weatherService});
  final WeatherService weatherService;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: AppConstants.contentPadding,
      alignment: Alignment.topCenter,
      constraints: BoxConstraints(
        minHeight: 400,
        maxWidth: double.infinity,
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          bottomRight: AppConstants.borderRadius,
          bottomLeft: AppConstants.borderRadius,
        ),
        color: AppColors.headerBgColor,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            '${weatherService.name}, ${weatherService.sys.country}',
            style: TextStyle(
              color: AppColors.mainColor,
              fontSize: 22,
            ),
          ),
          Image.asset(
            'assets/images/weather_status/overcast_clouds.png',
            width: 150,
            height: 150,
          ),
          Text(
            'Clear Sky',
            style: TextStyle(
              color: AppColors.mainColor,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          Text.rich(
            TextSpan(
              text: '22',
              style: TextStyle(
                fontFamily: 'specialFont',
                fontSize: 50,
                color: AppColors.initialColor,
              ),
              children: [
                TextSpan(
                  text: '°',
                  style: TextStyle(
                    inherit: true,
                    fontFamily: 'normalFont',
                  ),
                ),
              ],
            ),
          ),
          Text(
            'H:30° | MIN: 90° | MAX: 31°',
            style: TextStyle(
              color: AppColors.humidityColor,
              fontSize: 12,
              fontFamily: 'specialFont',
            ),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              WindWidget(),
              const SizedBox(width: 10),
              SunsetSunriseWidget(),
            ],
          ),
        ],
      ),
    );
  }
}
