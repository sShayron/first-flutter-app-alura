import 'package:flutter/material.dart';
import 'package:nosso_primeiro_projeto/components/difficult_stars.dart';
import 'package:nosso_primeiro_projeto/components/task_image.dart';
import 'package:nosso_primeiro_projeto/components/task_progress.dart';
import 'package:nosso_primeiro_projeto/components/task_title.dart';

class Task extends StatefulWidget {
  final String name;
  final String picture;
  final int difficult;

  const Task(this.name, this.picture, this.difficult, {super.key});

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  int mastery = 0;
  int level = 0;
  static const masteryColors = <Color>[
    Colors.blue,
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.green,
  ];

  void onLevelUpPressed() {
    setState(() {
      if ((level / widget.difficult) < 10) {
        level++;
      } else if (mastery < 4) {
        level = 0;
        mastery++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Color masteryColor =
        mastery == 0 ? Theme.of(context).primaryColor : masteryColors[mastery];
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            height: 140,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(4),
              color: masteryColor,
            ),
          ),
          Column(children: [
            Container(
              height: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4),
                color: Theme.of(context).colorScheme.surface,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TaskImage(picture: widget.picture),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TaskTitle(name: widget.name),
                        DifficultStars(difficult: widget.difficult)
                      ]),
                  Padding(
                    padding: const EdgeInsets.only(right: 8.0),
                    child: SizedBox(
                        height: 52,
                        child: ElevatedButton(
                            onPressed: onLevelUpPressed,
                            child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Icon(
                                    Icons.arrow_drop_up,
                                  ),
                                  Text(
                                    'UP',
                                    style: Theme.of(context)
                                        .primaryTextTheme
                                        .labelMedium,
                                  )
                                ]))),
                  )
                ],
              ),
            ),
            TaskProgress(level: level, difficult: widget.difficult),
          ])
        ],
      ),
    );
  }
}
