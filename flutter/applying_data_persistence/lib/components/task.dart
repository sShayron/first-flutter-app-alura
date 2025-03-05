import 'package:flutter/material.dart';
import 'package:nosso_primeiro_projeto/components/difficult_stars.dart';
import 'package:nosso_primeiro_projeto/components/task_image.dart';
import 'package:nosso_primeiro_projeto/components/task_title.dart';
import 'package:nosso_primeiro_projeto/consts/mastery_colors.dart';
import 'package:nosso_primeiro_projeto/data/task_dao.dart';
import 'package:nosso_primeiro_projeto/models/task_model.dart';

class Task extends StatelessWidget {
  final int? id;
  final String name;
  final String picture;
  final int difficulty;
  final int level;
  final int mastery;
  final VoidCallback onDeleteTask;
  final VoidCallback onLeveledUp;

  const Task(
      {this.id,
      required this.name,
      required this.picture,
      required this.difficulty,
      required this.level,
      required this.mastery,
      required this.onDeleteTask,
      required this.onLeveledUp,
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
                          _onLevelUpPressed();
                        },
                        onLongPress: () => showDialog(
                              context: context,
                              builder: (context) => AlertDialog(
                                title: Text(
                                    'Tem certeza que deseja deletar a task?'),
                                content: Text('Essa acao e irreversivel'),
                                actions: [
                                  TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text('Nao')),
                                  TextButton(
                                      onPressed: () {
                                        TaskDAO().delete(id!);
                                        onDeleteTask();
                                        Navigator.of(context).pop();
                                      },
                                      child: Text('Deletar'))
                                ],
                              ),
                            ),
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

  void _onLevelUpPressed() {
    int newLevel = 0;
    int newMastery = 0;

    if ((level / difficulty) == 10 && mastery == 4) return;

    if ((level / difficulty) < 10) {
      newLevel = level + 1;
      newMastery = mastery;
    } else if (mastery < 4) {
      newMastery = mastery + 1;
    }

    TaskDAO().save(TaskModel(
        id: id,
        name: name,
        picture: picture,
        difficulty: difficulty,
        level: newLevel,
        mastery: newMastery));

    onLeveledUp();
  }
}
