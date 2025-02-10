import 'package:flutter/material.dart';
import 'package:softux_weather/features/home/presentation/widgets/welcome_screen_button.dart';

import '../../../../constants/strings.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void onNextButtonClicked() {
      Navigator.pushReplacementNamed(
        context,
        locationScreen,
      );
    }

    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Welcome To SoftUx',
                  style: TextStyle(
                    fontSize: 18,
                    fontFamily: 'specialFont',
                  ),
                ),
                const SizedBox(height: 20),
                Image.asset(
                  'assets/images/weather.gif',
                  width: 150,
                  fit: BoxFit.contain,
                ),
                const SizedBox(height: 30),
                const Text(
                  description,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 13,
                  ),
                ),
                const SizedBox(height: 40),
                WelcomeButton(
                  onNextButtonClicked: onNextButtonClicked,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
