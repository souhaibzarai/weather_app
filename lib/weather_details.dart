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
          child: Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                buildWeatherWidget(),
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
      color: AppColors.headerBgColor,
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          'Taroudant, MA',
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
            buildWindWidget(),
            const SizedBox(width: 10),
            buildSunriseSunestWidget(),
          ],
        ),
      ],
    ),
  );
}

Widget buildDecoratedContainer({required int flex, required Widget child}) {
  return Flexible(
    flex: flex,
    fit: FlexFit.tight,
    child: Container(
      padding: EdgeInsets.symmetric(vertical: 6, horizontal: 2),
      decoration: BoxDecoration(
        color: AppColors.widgetBgColor,
        borderRadius: BorderRadius.all(
          AppConstants.borderRadius,
        ),
      ),
      constraints: BoxConstraints(
        minHeight: 60,
      ),
      child: child,
    ),
  );
}

Widget buildWindWidget() {
  return buildDecoratedContainer(
    flex: 1,
    child: Column(
      children: [
        Image.asset(
          'assets/images/wind.png',
          width: 32,
        ),
        const SizedBox(height: 3),
        Text(
          '10km/h',
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

Widget buildSunriseSunestWidget() {
  return buildDecoratedContainer(
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
          '06:47 - 19:23',
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
                  return buildDailyWidget(index);
                },
              ),
            ),
          ],
        );
      },
    ),
  );
}

Widget buildDailyWidget(int index) {
  return Container(
    width: 130,
    height: 200,
    margin: EdgeInsets.all(8),
    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
    decoration: BoxDecoration(
      color: AppColors.widgetBgColor,
      borderRadius: BorderRadius.all(AppConstants.borderRadius),
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          '06:00',
          style: TextStyle(
            color: AppColors.initialColor,
            fontFamily: 'specialFont',
            fontSize: 16,
          ),
        ),
        Image.asset(
          'assets/images/weather_status/mist.png',
          width: 70,
        ),
        Text(
          '8.7°C',
          style: TextStyle(
            color: AppColors.initialColor,
            fontSize: 17,
          ),
        ),
        Text(
          'soft rain',
          maxLines: 1,
          style: TextStyle(
            color: AppColors.mainColor,
            overflow: TextOverflow.ellipsis,
            fontSize: 16,
          ),
        ),
      ],
    ),
  );
}
