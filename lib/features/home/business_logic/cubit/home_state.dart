part of 'home_cubit.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

final class CityNameLoaded extends HomeState {
  final City city;

  CityNameLoaded(this.city);
}

final class CityNameError extends HomeState {}
