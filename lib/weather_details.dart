import 'package:flutter/material.dart';
import 'package:softux_weather/constants/app_constants.dart';
import 'package:softux_weather/constants/theme/app_colors.dart';

class WeatherDetails extends StatelessWidget {
  const WeatherDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Column(
            children: [
              buildWeatherWidget(),
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildWeatherWidget() {
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
      color: AppColors.mainColor.withAlpha(100),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Taroudant, MA',
          style: TextStyle(
            color: AppColors.mainColor,
            fontSize: 26,
          ),
        ),
        Image.asset(
          'assets/images/weather_status/overcast_clouds.png',
          width: 200,
          height: 200,
        ),
        Text(
          'Clear Sky',
          style: TextStyle(
            color: AppColors.mainColor,
            fontSize: 18,
          ),
        ),
        Text.rich(
          TextSpan(
            text: '22',
            style: TextStyle(
              fontFamily: 'specialFont',
              fontSize: 55,
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
            color: AppColors.backgroundColor.withAlpha(126),
            fontSize: 14,
            fontFamily: 'specialFont',
          ),
        ),
        Text(
          'data',
          style: TextStyle(
              // fontFamily: 'normalFont',
              // fontFamily: 'specialFont',
              ),
        ),
      ],
    ),
  );
}
