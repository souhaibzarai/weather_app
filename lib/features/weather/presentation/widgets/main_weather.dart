import 'package:flutter/material.dart';
import 'package:softux_weather/features/weather/data/models/current_weather/weather_service.dart';
import 'package:softux_weather/features/weather/presentation/helper/image_helper.dart';
import 'package:softux_weather/features/weather/presentation/helper/weather_methods_helper.dart';
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
            ImageHelper.getImagePath(
              weatherService.weather.main,
              weatherService.weather.description,
            ),
            width: 150,
            height: 150,
          ),
          Text(
            '${weatherService.weather.main}, ${weatherService.weather.description.toUpperCase()}', //weather desc
            style: TextStyle(
              color: AppColors.mainColor,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          Text.rich(
            TextSpan(
              text: WeatherMethodsHelper.getTempCelsius(
                weatherService.main.temp,
              ), //degree
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
            'H: ${weatherService.main.humidity} | MIN: ${WeatherMethodsHelper.getTempCelsius(weatherService.main.tempMin)}° | MAX: ${WeatherMethodsHelper.getTempCelsius(weatherService.main.tempMax)}°',
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
              WindWidget(weatherService),
              const SizedBox(width: 10),
              SunsetSunriseWidget(),
            ],
          ),
        ],
      ),
    );
  }
}
