import '../models/multi_days_weather/list.dart';
import '../webservices/multi_days_web_services.dart';

class MultiDaysWeatherRepository {
  final MultiDaysWebServices multiDaysWebServices;
  MultiDaysWeatherRepository(this.multiDaysWebServices);

  Future<DaysList> fetchMultiDaysList(String cityName) async {
    try {
      final dayslist =
          await multiDaysWebServices.getMultiDaysWeatherForecast(cityName);

      return DaysList.fromJson(dayslist);
    } catch (e) {
      print('Error Occured while fetching in multi days repository | $e');
      return DaysList(
        listOfMultiDaysWeather: [],
      );
    }
  }
}
