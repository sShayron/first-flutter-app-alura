import 'package:flutter/material.dart';

class TaskTitle extends StatelessWidget {
  final String name;
  const TaskTitle({required this.name, super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 200,
        child: Text(
          name,
          style: TextStyle(
            fontSize: 24,
          ),
          overflow: TextOverflow.ellipsis,
        ));
  }
}
