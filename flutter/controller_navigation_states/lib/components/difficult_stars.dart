import 'package:flutter/material.dart';
import 'package:nosso_primeiro_projeto/components/difficult_star.dart';

class DifficultStars extends StatelessWidget {
  final int difficult;
  static const stars = [1, 2, 3, 4, 5];

  const DifficultStars({required this.difficult, super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
        children: stars
            .map((starNumber) => DifficultStar(
                color:
                    difficult >= starNumber ? Colors.blue : Colors.blue[100]))
            .toList());
  }
}
