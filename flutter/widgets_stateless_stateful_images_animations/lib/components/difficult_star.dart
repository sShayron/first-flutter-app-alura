import 'package:flutter/material.dart';

class DifficultStar extends StatelessWidget {
  final Color? color;

  const DifficultStar({this.color, super.key});

  @override
  Widget build(BuildContext context) {
    return Icon(Icons.star, size: 15, color: color);
  }
}
