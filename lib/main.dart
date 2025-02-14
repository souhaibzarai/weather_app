import 'package:flutter/material.dart';
import 'package:softux_weather/weather_details.dart';
import 'app_router.dart';
// ignore: unused_import TODO: delete
import 'constants/strings.dart';
import 'constants/theme/theme.dart';

void main() {
  runApp(
    WeatherApp(
      appRouter: AppRouter(),
    ),
  );
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key, required this.appRouter});

  final AppRouter appRouter;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SoftUX | Weather',
      debugShowCheckedModeBanner: false,
      theme: theme,
      // onGenerateRoute: appRouter.generateRoute,
      // initialRoute: welcomeScreen,
      home: const WeatherDetails(),
    );
  }
}
