import 'package:flutter/material.dart';

class TaskProgress extends StatelessWidget {
  final int level;
  final int difficult;

  const TaskProgress({required this.level, required this.difficult, super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.all(8),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          SizedBox(
              width: 200,
              child: LinearProgressIndicator(
                color: Theme.of(context).colorScheme.onPrimary,
                backgroundColor: Colors.black26,
                value: difficult > 0 ? (level / difficult) / 10 : 1,
              )),
          Text('Nivel $level',
              style: Theme.of(context).primaryTextTheme.labelLarge)
        ]));
  }
}
