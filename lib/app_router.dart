import 'package:flutter/material.dart';
import 'package:softux_weather/constants/strings.dart';
import 'package:softux_weather/features/home/screens/location_screen.dart';
import 'package:softux_weather/features/home/screens/welcome_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case welcomeScreen:
        return MaterialPageRoute(
          builder: (_) {
            return const WelcomeScreen();
          },
        );

      case locationScreen:
        return MaterialPageRoute(
          builder: (_) {
            return const LocationScreen();
          },
        );
    }

    return null;
  }
}
