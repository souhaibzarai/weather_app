import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

import '../../data/models/address_model.dart';
import '../../data/repository/home_repository.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.homeRepository) : super(HomeInitial());

  HomeRepository homeRepository;

  Future<void> getCityName(double lat, double lng) async {
    emit(CityNameLoading());
    try {
      final city = await homeRepository.fetchCityName(lat, lng);
      emit(CityNameLoaded(city));
    } catch (e) {
      emit(CityNameError(e.toString()));
    }
  }
}
