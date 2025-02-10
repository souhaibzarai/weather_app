import 'package:flutter/material.dart';

import '../../../constants/theme/app_colors.dart';

class StepsItem extends StatelessWidget {
  const StepsItem({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          '|',
          style: TextStyle(
            color: AppColors.secondaryColor,
            inherit: true,
            fontSize: 26,
            fontWeight: FontWeight.w500,
          ),
        ),
        SizedBox(width: 20),
        Text(
          text,
          style: TextStyle(
            color: AppColors.mainColor,
            fontSize: 16,
            fontWeight: FontWeight.w300,
          ),
        ),
      ],
    );
  }
}
