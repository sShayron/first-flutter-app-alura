import 'package:flutter/material.dart';

class ColorDot extends StatelessWidget {
  final Color? color;
  const ColorDot({Key? key, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 10,
      height: 10,
      decoration: BoxDecoration(
        color: color,
        shape: BoxShape.circle,
      ),
    );
  }
}
