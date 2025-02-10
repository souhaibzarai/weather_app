import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:softux_weather/features/home/data/models/city.dart';
import 'package:softux_weather/features/home/data/repository/home_repository.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeRepository) : super(HomeInitial());

  HomeRepository homeRepository;

  Future<void> getCityName(double lat, double lng) async {
    try {
      final city = await homeRepository.fetchCityName(lat, lng);
      emit(CityNameLoaded(city));
    } catch (e) {
      print('error occurred | $e');
      emit(CityNameError());
    }
  }
}
