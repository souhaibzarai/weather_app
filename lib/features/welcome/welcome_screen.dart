import 'package:flutter/material.dart';
import 'package:softux_weather/features/welcome/welcome_button.dart';

import '../../constants/strings.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void onNextButtonClicked() {
      Navigator.pushNamed(context, locationScreen);
    }

    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Text(
                  'Welcome To SoftUx',
                  style: TextStyle(
                    fontSize: 32,
                    fontFamily: 'specialFont',
                  ),
                ),
                const SizedBox(height: 15),
                Image.asset('assets/images/weather.gif'),
                const SizedBox(height: 60),
                const Text(
                  description,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
                const SizedBox(height: 60),
                WelcomeButton(onNextButtonClicked: onNextButtonClicked),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
