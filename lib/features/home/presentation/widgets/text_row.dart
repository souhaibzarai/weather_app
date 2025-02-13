import 'package:flutter/widgets.dart';

class TextRow extends StatelessWidget {
  const TextRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          'Set u',
          style: TextStyle(
            fontSize: 24,
          ),
        ),
        Container(
          margin: EdgeInsets.only(top: 6),
          child: Image.asset(
            'assets/images/locationIcon.png',
            width: 26,
          ),
        ),
        Text(
          ' your location',
          style: TextStyle(
            fontSize: 24,
          ),
        ),
      ],
    );
  }
}
