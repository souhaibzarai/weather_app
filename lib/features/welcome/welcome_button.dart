import 'package:flutter/material.dart';

import '../../constants/theme/app_colors.dart';

class WelcomeButton extends StatelessWidget {
  const WelcomeButton({super.key, required this.onNextButtonClicked});

  final void Function() onNextButtonClicked;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onNextButtonClicked,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 120, vertical: 10),
        decoration: BoxDecoration(
            color: AppColors.mainColor,
            shape: BoxShape.rectangle,
            borderRadius: BorderRadius.circular(12)),
        child: Text(
          'Next >',
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
