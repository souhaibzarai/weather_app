import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:softux_weather/features/home/data/models/address_model.dart';
import 'package:softux_weather/features/home/data/repository/home_repository.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeRepository) : super(HomeInitial());

  HomeRepository homeRepository;

  Future<void> getCityName(double lat, double lng) async {
    emit(CityNameLoading());
    try {
      final city = await homeRepository.fetchCityName(lat, lng);
      print("City fetched: ${city.results}"); // Debugging line
      emit(CityNameLoaded(city));
    } catch (e) {
      print('Error occurred | $e');
      emit(CityNameError(e.toString()));
    }
  }
}
