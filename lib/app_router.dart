import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'constants/strings.dart';
import 'features/home/business_logic/cubit/home_cubit.dart';
import 'features/home/data/repository/home_repository.dart';
import 'features/home/data/webservices/home_web_services.dart';
import 'features/home/presentation/screens/location_screen.dart';
import 'features/home/presentation/screens/welcome_screen.dart';
import 'features/weather/business_logic/cubit/current_weather/weather_cubit.dart';
import 'features/weather/business_logic/cubit/multi_days_weather/multi_days_cubit.dart';
import 'features/weather/data/models/weather_service.dart';
import 'features/weather/data/models/multi_days_weather/list.dart';
import 'features/weather/data/repository/current_weather_repository.dart';
import 'features/weather/data/repository/multi_days_weather_repository.dart';
import 'features/weather/data/webservices/multi_days_web_services.dart';
import 'features/weather/data/webservices/weather_web_services.dart';
import 'features/weather/presentation/screens/weather_screen.dart';

class AppRouter {
  HomeCubit? homeCubit;
  HomeRepository? homeRepository;
  final HomeWebServices homeWebServices = HomeWebServices();

  WeatherCubit? weatherCubit;
  WeatherRepository? weatherRepository;
  final WeatherWebServices weatherWebServices = WeatherWebServices();

  MultiDaysCubit? multiDaysCubit;
  MultiDaysWeatherRepository? multiDaysWeatherRepository;
  final MultiDaysWebServices multiDaysWebServices = MultiDaysWebServices();

  AppRouter() {
    homeRepository = HomeRepository(homeWebServices);
    homeCubit = HomeCubit(homeRepository!);
    //
    weatherRepository = WeatherRepository(weatherWebServices);
    weatherCubit = WeatherCubit(weatherRepository!);
    //
    multiDaysWeatherRepository =
        MultiDaysWeatherRepository(multiDaysWebServices);
    multiDaysCubit = MultiDaysCubit(multiDaysWeatherRepository!);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case welcomeScreen:
        return MaterialPageRoute(
          builder: (context) {
            return const WelcomeScreen();
          },
        );

      case locationScreen:
        return MaterialPageRoute(builder: (context) {
          return MultiBlocProvider(
            providers: [
              BlocProvider<HomeCubit>.value(value: homeCubit!),
              BlocProvider<WeatherCubit>.value(value: weatherCubit!),
              BlocProvider<MultiDaysCubit>.value(value: multiDaysCubit!),
            ],
            child: LocationScreen(),
          );
        });

      case weatherScreen:
        final List<dynamic> args = settings.arguments as List<dynamic>;
        final weatherService = args[0] as WeatherService;
        final multiDaysWeather = args[1] as DaysList;
        return MaterialPageRoute(builder: (context) {
          return MultiBlocProvider(
            providers: [
              BlocProvider<WeatherCubit>.value(value: weatherCubit!),
              BlocProvider<MultiDaysCubit>.value(value: multiDaysCubit!),
            ],
            child: WeatherScreen(
              weatherService: weatherService,
              daysList: multiDaysWeather,
            ),
          );
        });
    }

    return null;
  }
}
