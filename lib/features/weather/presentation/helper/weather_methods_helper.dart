import 'package:intl/intl.dart';
import 'package:softux_weather/features/weather/data/models/multi_days_weather/list.dart';

class WeatherMethodsHelper {
  final DaysList daysList;
  WeatherMethodsHelper.forecast(this.daysList);

  static String getTempCelsius(double tempK) {
    return (tempK - 273.15).toStringAsFixed(0);
  }

  static String formatDate(int timestamp) {
    final DateTime date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    return DateFormat('EEE, MMM d').format(date);
  }

  static String formatHour(int timestamp) {
    final date = DateTime.fromMillisecondsSinceEpoch(timestamp * 1000);
    return DateFormat('HH:mm').format(date);
  }

  Map<String, List<dynamic>> groupForecastByDate() {
    Map<String, List<dynamic>> groupedForecasts = {};

    final sortedList = List.from(daysList.listOfMultiDaysWeather)
      ..sort((a, b) => a.dateTime.compareTo(b.dateTime));

    for (var item in sortedList) {
      final date = formatDate(item.dateTime);
      if (!groupedForecasts.containsKey(date)) {
        groupedForecasts[date] = [];
      }

      if (!groupedForecasts[date]!.any((existing) =>
          formatHour(existing.dateTime) == formatHour(item.dateTime))) {
        groupedForecasts[date]!.add(item);
      }
    }
    return Map.fromEntries(groupedForecasts.entries.take(5));
  }
}
