import 'package:flutter/material.dart';

import '../../../../../constants/theme/app_colors.dart';
import 'decorated_container.dart';

class WindWidget extends StatelessWidget {
  const WindWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return DecoratedContainer(
      flex: 1,
      child: Column(
        children: [
          Image.asset(
            'assets/images/wind.png',
            width: 32,
          ),
          const SizedBox(height: 3),
          Text(
            '10km/h',
            style: TextStyle(
              fontSize: 12,
              color: AppColors.widgetDetailTextColor,
              fontFamily: 'specialFont',
            ),
          ),
        ],
      ),
    );
  }
}
