import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:softux_weather/constants/strings.dart';
import 'package:softux_weather/features/home/business_logic/cubit/home_cubit.dart';
import 'package:softux_weather/features/home/data/repository/home_repository.dart';
import 'package:softux_weather/features/home/data/webservices/home_web_services.dart';
import 'package:softux_weather/features/home/presentation/screens/location_screen.dart';
import 'package:softux_weather/features/home/presentation/screens/welcome_screen.dart';

class AppRouter {
  HomeCubit? homeCubit;
  HomeRepository? homeRepository;
  HomeWebServices homeWebServices = HomeWebServices();
  AppRouter() {
    homeRepository = HomeRepository(homeWebServices);
    homeCubit = HomeCubit(homeRepository!);
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
          return BlocProvider<HomeCubit>(
            create: (context) {
              return homeCubit!;
            },
            child: const LocationScreen(),
          );
        });
    }

    return null;
  }
}
