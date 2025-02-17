import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:softux_weather/features/weather/data/models/multi_days_weather/list.dart';

import '../../../data/models/weather_service.dart';
import '../../../data/repository/current_weather_repository.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(this.weatherRepository) : super(WeatherInitial());

  final WeatherRepository weatherRepository;

  Future<void> implementCityNameToUI(String cityName) async {
    emit(WeatherLoading());

    try {
      final currentWeather =
          await weatherRepository.fetchCurrentCityWeather(cityName);

      emit(WeatherLoaded(currentWeather));
    } catch (e) {
      emit(WeatherError(e.toString()));
      throw Exception('cubit error | $e');
    }
  }
}
