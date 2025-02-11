import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../data/models/weather_service.dart';
import '../../data/repository/weather_repository.dart';

part 'weather_state.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit(this.weatherRepository) : super(WeatherInitial());

  final WeatherRepository weatherRepository;

  Future<void> implementCityNameToUI(String cityName) async {
    emit(WeatherLoading());

    print('weather loading executed');

    try {
      final currentWeather =
          await weatherRepository.fetchCurrentCityWeather(cityName);
      print('Cubit executed| ${currentWeather.toString()},| $cityName');

      emit(WeatherLoaded(currentWeather));

      print('Technically loaded | cubit');
    } catch (e) {
      emit(WeatherError(e.toString()));
      print('cubit error | $e');
    }
  }
}
