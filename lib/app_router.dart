import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'constants/strings.dart';
import 'features/home/business_logic/cubit/home_cubit.dart';
import 'features/home/data/repository/home_repository.dart';
import 'features/home/data/webservices/home_web_services.dart';
import 'features/home/presentation/screens/location_screen.dart';
import 'features/home/presentation/screens/welcome_screen.dart';
import 'features/weather/business_logic/cubit/weather_cubit.dart';
import 'features/weather/data/models/weather_service.dart';
import 'features/weather/data/repository/weather_repository.dart';
import 'features/weather/data/webservices/weather_web_services.dart';

import 'features/weather/presentation/screens/weather_screen.dart';

class AppRouter {
  HomeCubit? homeCubit;
  HomeRepository? homeRepository;
  HomeWebServices homeWebServices = HomeWebServices();

  WeatherCubit? weatherCubit;
  WeatherRepository? weatherRepository;
  WeatherWebServices weatherWebServices = WeatherWebServices();

  AppRouter() {
    homeRepository = HomeRepository(homeWebServices);
    homeCubit = HomeCubit(homeRepository!);
    weatherRepository = WeatherRepository(weatherWebServices);
    weatherCubit = WeatherCubit(weatherRepository!);
  }

  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case welcomeScreen:
        return MaterialPageRoute(
          builder: (_) {
            return const WelcomeScreen();
          },
        );

      case locationScreen:
        return MaterialPageRoute(builder: (context) {
          return MultiBlocProvider(
            providers: [
              BlocProvider<HomeCubit>.value(value: homeCubit!),
              BlocProvider<WeatherCubit>.value(value: weatherCubit!),
            ],
            child: LocationScreen(),
          );
        });

      case weatherScreen:
        final weatherService = settings.arguments as WeatherService;
        return MaterialPageRoute(builder: (_) {
          return BlocProvider<WeatherCubit>.value(
            value: weatherCubit!,
            child: WeatherScreen(
              weatherService: weatherService,
            ),
          );
        });
    }

    return null;
  }
}
