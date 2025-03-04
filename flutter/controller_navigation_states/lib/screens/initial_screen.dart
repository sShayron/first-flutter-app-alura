import 'package:flutter/material.dart';
import 'package:nosso_primeiro_projeto/components/default_app_bar.dart';
import 'package:nosso_primeiro_projeto/components/task.dart';
import 'package:nosso_primeiro_projeto/data/task_inherited.dart';
import 'package:nosso_primeiro_projeto/models/task_model.dart';
import 'package:nosso_primeiro_projeto/screens/form_screen.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  List<TaskModel> taskList = [
    TaskModel(
        name: 'Aprender Fluter',
        picture: 'assets/images/flutter.png',
        difficulty: 3,
        level: 0,
        mastery: 0),
    TaskModel(
        name: 'Andar de Bike',
        picture: 'assets/images/bike.jpeg',
        difficulty: 5,
        level: 0,
        mastery: 0),
    TaskModel(
        name: 'Meditar',
        picture: 'assets/images/meditar.jpeg',
        difficulty: 2,
        level: 0,
        mastery: 0),
    TaskModel(
        name: 'Ler',
        picture: 'assets/images/ler.jpg',
        difficulty: 1,
        level: 0,
        mastery: 0),
    TaskModel(
        name: 'Jogar',
        picture: 'assets/images/jogar.jpg',
        difficulty: 2,
        level: 0,
        mastery: 0),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
        title: 'Tarefas',
        showLevel: true,
        currentLevel: currentLevel,
      ),
      body: TaskInherited(
        taskList: taskList,
        maxLevel: maxLevel,
        onLevelUpPressed: onLevelUpPressed,
        newTask: newTask,
        child: ListView.builder(
            padding: EdgeInsets.only(top: 8, bottom: 70),
            itemCount: taskList.length,
            itemBuilder: (context, index) {
              final task = taskList[index];
              return Task(
                  key: Key(task.name),
                  name: task.name,
                  picture: task.picture,
                  difficulty: task.difficulty,
                  level: task.level,
                  mastery: task.mastery);
            }),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          onPressed: () {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (_) => TaskInherited(
                    taskList: taskList,
                    maxLevel: maxLevel,
                    onLevelUpPressed: onLevelUpPressed,
                    newTask: newTask,
                    child: FormScreen()),
              ),
            );
          },
          child: Icon(Icons.add, color: Colors.white)),
    );
  }

  void newTask(String name, String picture, int difficulty) {
    setState(() {
      taskList.add(TaskModel(
          name: name,
          picture: picture,
          difficulty: difficulty,
          level: 0,
          mastery: 0));
    });
  }

  int get maxLevel {
    return taskList
        .map((e) => e.difficulty * 5)
        .reduce((value, el) => value + el);
  }

  double get currentLevel {
    if (taskList.isEmpty) return 0;
    double weightedSum = taskList.map((task) {
      int accPoints =
          task.mastery > 0 ? task.mastery * task.difficulty * 10 : 0;
      return (accPoints + task.level) / maxLevel;
    }).reduce((value, element) => value + element);

    print('weight sum $weightedSum');
    return weightedSum;
  }

  void onLevelUpPressed(String name) {
    setState(() {
      TaskModel? task = taskList.firstWhere((task) => task.name == name);
      int newLevel = 0;
      int newMastery = 0;

      if ((task.level / task.difficulty) == 10 && task.mastery == 4) return;

      if ((task.level / task.difficulty) < 10) {
        newLevel = task.level + 1;
        newMastery = task.mastery;
      } else if (task.mastery < 4) {
        newMastery = task.mastery + 1;
      }

      taskList[taskList.indexOf(task)] = TaskModel(
          name: name,
          picture: task.picture,
          difficulty: task.difficulty,
          level: newLevel,
          mastery: newMastery);

      for (task in taskList) {
        print(
            'name: ${task.name} level: ${task.level} mastery: ${task.mastery} difficulty: ${task.difficulty}');
      }
    });
  }
}
