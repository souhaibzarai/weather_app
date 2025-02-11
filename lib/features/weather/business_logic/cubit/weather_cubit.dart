import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:softux_weather/features/weather/data/models/weather_service.dart';
import 'package:softux_weather/features/weather/data/repository/weather_repository.dart';

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
      print('$e');
    }
  }
}
