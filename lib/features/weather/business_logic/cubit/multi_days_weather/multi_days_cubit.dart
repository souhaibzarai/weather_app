import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import '../../../data/models/multi_days_weather/list.dart';
import '../../../data/repository/multi_days_weather_repository.dart';

part 'multi_days_state.dart';

class MultiDaysCubit extends Cubit<MultiDaysState> {
  MultiDaysCubit(this.multiDaysWeatherRepository) : super(MultiDaysInitial());

  final MultiDaysWeatherRepository multiDaysWeatherRepository;

  Future<void> implementMultiDaysWeatherToUI(String cityName) async {
    emit(MultiDaysWeatherLoading());
    try {
      final multiDaysResult =
          // await multiDaysWeatherRepository.fetchMultiDaysList(cityName); TODO
          await multiDaysWeatherRepository.fetchMultiDaysList('paris,fr');

      emit(MultiDaysWeatherLoaded(multiDaysResult));
    } catch (e) {
      emit(MultiDaysWeatherError(e.toString()));
      throw Exception('error occurrd in cubit emit | $e');
    }
  }
}
