import 'package:flutter/material.dart';
import 'package:softux_weather/features/weather/data/models/multi_days_weather/list.dart';
import 'package:softux_weather/features/weather/presentation/helper/image_helper.dart';
import '../../../../constants/app_constants.dart';
import '../../../../constants/theme/app_colors.dart';
import '../helper/weather_methods_helper.dart';

class DailyLayer extends StatelessWidget {
  const DailyLayer({super.key, required this.daysList});
  final DaysList daysList;

  @override
  Widget build(BuildContext context) {
    final groupedForecasts =
        WeatherMethodsHelper.forecast(daysList).groupForecastByDate();

    return SizedBox(
      height: 350,
      child: ListView.builder(
        itemCount: groupedForecasts.length,
        itemBuilder: (context, index) {
          final date = groupedForecasts.keys.elementAt(index);
          final dailyForecast = groupedForecasts[date]!;

          return Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  date,
                  style: TextStyle(fontSize: 18),
                  textAlign: TextAlign.start,
                ),
              ),
              SizedBox(
                height: 200,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: dailyForecast.length,
                  itemBuilder: (context, hourIndex) {
                    final item = dailyForecast[hourIndex];
                    return Container(
                      width: 130,
                      height: 200,
                      margin: EdgeInsets.all(8),
                      padding: EdgeInsets.symmetric(
                        horizontal: 12,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors.widgetBgColor,
                        borderRadius:
                            BorderRadius.all(AppConstants.borderRadius),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Text(
                            WeatherMethodsHelper.formatHour(item.dateTime),
                            style: TextStyle(
                              color: AppColors.initialColor,
                              fontFamily: 'specialFont',
                              fontSize: 16,
                            ),
                          ),
                          Image.asset(
                            ImageHelper.getImagePath(
                              item.weather.main,
                              item.weather.description,
                            ),
                            width: 70,
                          ),
                          Text(
                            '${WeatherMethodsHelper.getTempCelsius(item.main.temp)}°C',
                            style: TextStyle(
                              color: AppColors.initialColor,
                              fontSize: 17,
                            ),
                          ),
                          Text(
                            '${item.weather.description}',
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
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
