import 'package:flutter/material.dart';

class LocationScreenButton extends StatelessWidget {
  const LocationScreenButton({
    super.key,
    required this.imagePATH,
    required this.bgColor,
    required this.buttonWidthAndHeight,
    this.onTap,
    this.height,
    this.width,
  });

  final void Function()? onTap;

  final String imagePATH;
  final Color bgColor;
  final double buttonWidthAndHeight;
  final double? height;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        constraints: BoxConstraints(
          minWidth: width ?? 120,
          minHeight: height ?? 70,
        ),
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Image.asset(
          imagePATH,
          height: buttonWidthAndHeight,
          width: buttonWidthAndHeight,
        ),
      ),
    );
  }
}
