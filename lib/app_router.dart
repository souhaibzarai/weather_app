import 'package:flutter/material.dart';
import 'package:softux_weather/constants/strings.dart';
import 'package:softux_weather/features/welcome/welcome_screen.dart';

class AppRouter {
  Route? generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case welcomeScreen:
        return MaterialPageRoute(
          builder: (_) {
            return const WelcomeScreen();
          },
        );
    }

    return null;
  }
}
