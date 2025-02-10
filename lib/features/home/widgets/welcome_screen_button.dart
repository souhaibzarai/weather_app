import 'package:flutter/material.dart';

import '../../../constants/theme/app_colors.dart';

class WelcomeButton extends StatelessWidget {
  const WelcomeButton({super.key, required this.onNextButtonClicked});

  final void Function() onNextButtonClicked;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onNextButtonClicked,
      child: Container(
        constraints: BoxConstraints(
          minHeight: 40,
          minWidth: 250,
          maxWidth: 300,
          maxHeight: 60,
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 10,
        ),
        decoration: BoxDecoration(
            color: AppColors.mainColor,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(12)),
        child: Text(
          'Next >',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontFamily: 'specialFont',
            color: AppColors.backgroundColor,
            fontSize: 15,
          ),
        ),
      ),
    );
  }
}
