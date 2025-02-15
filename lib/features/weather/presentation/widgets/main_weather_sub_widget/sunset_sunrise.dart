import 'package:flutter/material.dart';

import '../../../../../constants/theme/app_colors.dart';
import 'decorated_container.dart';

class SunsetSunriseWidget extends StatelessWidget {
  const SunsetSunriseWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedContainer(
      flex: 2,
      child: Column(
        children: [
          Text(
            'Sunrise - Sunset',
            style: TextStyle(
              color: AppColors.widgetMainTextColor,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 3),
          Text(
            '06:47 - 19:23',
            style: TextStyle(
              color: AppColors.widgetDetailTextColor,
              fontSize: 12,
              fontFamily: 'specialFont',
            ),
          ),
        ],
      ),
    );
  }
}
