part of 'multi_days_cubit.dart';

@immutable
sealed class MultiDaysState {}

final class MultiDaysInitial extends MultiDaysState {}

final class MultiDaysWeatherLoading extends MultiDaysState {}

final class MultiDaysWeatherLoaded extends MultiDaysState {
  final DaysList daysList;
  MultiDaysWeatherLoaded(this.daysList);
}

final class MultiDaysWeatherError extends MultiDaysState {
  final String errMsg;

  MultiDaysWeatherError(this.errMsg);
}
