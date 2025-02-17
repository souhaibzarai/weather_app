part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class CityNameLoading extends HomeState {}

final class CityNameLoaded extends HomeState {
  final PlaceModel city;

  CityNameLoaded(this.city);
}

final class CityNameError extends HomeState {
  final String errMsg;

  CityNameError(this.errMsg);
}

final class CityNameNotFound extends HomeState {
  final String notFoundMsg;
  CityNameNotFound(this.notFoundMsg);
}
