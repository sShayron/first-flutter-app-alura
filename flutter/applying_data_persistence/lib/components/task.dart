import 'package:flutter/material.dart';
import 'package:nosso_primeiro_projeto/components/difficult_stars.dart';
import 'package:nosso_primeiro_projeto/components/task_image.dart';
import 'package:nosso_primeiro_projeto/components/task_title.dart';
import 'package:nosso_primeiro_projeto/consts/mastery_colors.dart';
import 'package:nosso_primeiro_projeto/data/task_inherited.dart';

class Task extends StatelessWidget {
  final String name;
  final String picture;
  final int difficulty;
  final int level;
  final int mastery;

  const Task(
      {required this.name,
      required this.picture,
      required this.difficulty,
      required this.level,
      required this.mastery,
      super.key});

  @override
  Widget build(BuildContext context) {
    Color masteryColor = masteryColors[mastery];
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
                color: Colors.white,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  TaskImage(picture: picture),
                  Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TaskTitle(name: name),
                        DifficultStars(difficult: difficulty)
                      ]),
                  SizedBox(
                    height: 52,
                    width: 52,
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            padding: EdgeInsets.all(4),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(16),
                              ),
                            ),
                            backgroundColor: Colors.blue),
                        onPressed: () {
                          TaskInherited.of(context).onLevelUpPressed(name);
                        },
                        child: Icon(Icons.arrow_upward, color: Colors.white)),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(8),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 200,
                      child: LinearProgressIndicator(
                        color: Colors.white,
                        backgroundColor: Colors.black26,
                        value: difficulty > 0 ? (level / difficulty) / 10 : 1,
                      ),
                    ),
                    Text('Nivel $level',
                        style: TextStyle(color: Colors.white, fontSize: 16))
                  ]),
            ),
          ])
        ],
      ),
    );
  }
}
