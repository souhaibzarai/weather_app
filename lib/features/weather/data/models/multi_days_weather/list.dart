import 'multi_days_weather_object.dart';

class DaysList {
  final List<MultiDaysWeatherObject> listOfMultiDaysWeather;

  const DaysList({
    required this.listOfMultiDaysWeather,
  });

  factory DaysList.fromJson(Map<String, dynamic> json) {
    return DaysList(
      listOfMultiDaysWeather: (json['list'] as List)
          .map(
            (item) => MultiDaysWeatherObject.fromJson(item),
          )
          .toList(),
    );
  }
}
