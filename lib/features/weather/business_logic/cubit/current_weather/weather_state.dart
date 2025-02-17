part of 'weather_cubit.dart';

@immutable
sealed class WeatherState {}

final class WeatherInitial extends WeatherState {}

final class WeatherLoading extends WeatherState {}

final class WeatherLoaded extends WeatherState {
  final WeatherService weather;

  WeatherLoaded(this.weather);
}

final class WeatherError extends WeatherState {
  final String errMsg;

  WeatherError(this.errMsg);
}

final class WeatherAndForecastState extends WeatherState {
  final WeatherService weatherService;
  final DaysList daysList;

  WeatherAndForecastState({
    required this.weatherService,
    required this.daysList,
  });
}
