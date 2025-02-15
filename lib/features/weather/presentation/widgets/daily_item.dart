import 'package:flutter/material.dart';

import '../../../../constants/app_constants.dart';
import '../../../../constants/theme/app_colors.dart';

class DailyItemWidget extends StatelessWidget {
  const DailyItemWidget({
    super.key,
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 200,
      margin: EdgeInsets.all(8),
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 10),
      decoration: BoxDecoration(
        color: AppColors.widgetBgColor,
        borderRadius: BorderRadius.all(AppConstants.borderRadius),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(
            '06:00',
            style: TextStyle(
              color: AppColors.initialColor,
              fontFamily: 'specialFont',
              fontSize: 16,
            ),
          ),
          Image.asset(
            'assets/images/weather_status/mist.png',
            width: 70,
          ),
          Text(
            '8.7°C',
            style: TextStyle(
              color: AppColors.initialColor,
              fontSize: 17,
            ),
          ),
          Text(
            'soft rain',
            maxLines: 1,
            style: TextStyle(
              color: AppColors.mainColor,
              overflow: TextOverflow.ellipsis,
              fontSize: 16,
            ),
          ),
        ],
      ),
    );
  }
}
