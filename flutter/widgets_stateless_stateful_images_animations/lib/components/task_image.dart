import 'package:flutter/material.dart';

class TaskImage extends StatelessWidget {
  final String picture;

  const TaskImage({required this.picture, super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 72,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: Colors.black26,
      ),
      child: ClipRRect(
          borderRadius: BorderRadius.circular(4),
          child: Image.asset(picture, fit: BoxFit.cover)),
    );
  }
}
