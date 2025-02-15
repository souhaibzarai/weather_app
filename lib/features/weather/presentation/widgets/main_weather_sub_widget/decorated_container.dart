import 'package:flutter/material.dart';

import '../../../../../constants/app_constants.dart';
import '../../../../../constants/theme/app_colors.dart';

class DecoratedContainer extends StatelessWidget {
  const DecoratedContainer({
    super.key,
    required this.flex,
    required this.child,
  });

  final int flex;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Flexible(
      flex: flex,
      fit: FlexFit.tight,
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 6, horizontal: 2),
        decoration: BoxDecoration(
          color: AppColors.widgetBgColor,
          borderRadius: BorderRadius.all(
            AppConstants.borderRadius,
          ),
        ),
        constraints: BoxConstraints(
          minHeight: 60,
        ),
        child: child,
      ),
    );
  }
}
