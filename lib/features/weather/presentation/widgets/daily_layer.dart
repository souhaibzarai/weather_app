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
      height: 1264,
      child: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(height: 20),
        scrollDirection: Axis.vertical,
        physics: NeverScrollableScrollPhysics(),
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
                  style: TextStyle(
                    fontSize: 18,
                    color: AppColors.humidityColor,
                  ),
                  textAlign: TextAlign.start,
                ),
              ),
              SizedBox(
                height: 200,
                child: ListView.separated(
                  separatorBuilder: (context, index) => SizedBox(width: 15),
                  scrollDirection: Axis.horizontal,
                  itemCount: dailyForecast.length,
                  itemBuilder: (context, hourIndex) {
                    final item = dailyForecast[hourIndex];
                    return Container(
                      width: 140,
                      height: 200,
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
                              color: AppColors.headerBgColor,
                              fontFamily: 'specialFont',
                              fontSize: 22,
                            ),
                          ),
                          Text(
                            '${item.weather.main}, ${item.weather.description}',
                            maxLines: 1,
                            style: TextStyle(
                              color: AppColors.widgetDetailTextColor,
                              overflow: TextOverflow.ellipsis,
                              fontSize: 17,
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
