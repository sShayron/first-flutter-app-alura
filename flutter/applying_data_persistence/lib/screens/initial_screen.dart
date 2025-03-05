import 'package:flutter/material.dart';
import 'package:nosso_primeiro_projeto/components/default_app_bar.dart';
import 'package:nosso_primeiro_projeto/components/task.dart';
import 'package:nosso_primeiro_projeto/data/task_dao.dart';
import 'package:nosso_primeiro_projeto/models/task_model.dart';

class InitialScreen extends StatefulWidget {
  const InitialScreen({super.key});

  @override
  State<InitialScreen> createState() => _InitialScreenState();
}

class _InitialScreenState extends State<InitialScreen> {
  List<TaskModel> taskList = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBar(
          title: 'Tarefas',
          showLevel: true,
          currentLevel: currentLevel,
          actions: [
            IconButton(
                onPressed: () {
                  setState(() {});
                },
                icon: Icon(Icons.refresh))
          ]),
      body: Padding(
        padding: const EdgeInsets.only(top: 8, bottom: 70),
        child: FutureBuilder<List<TaskModel>>(
            future: TaskDAO().findAll(),
            builder: (context, snapshot) {
              List<TaskModel>? items = snapshot.data;

              if (items != null) {
                taskList = items;
              }

              switch (snapshot.connectionState) {
                case ConnectionState.none:
                case ConnectionState.waiting:
                case ConnectionState.active:
                  return Center(
                      child: Column(
                    children: [CircularProgressIndicator(), Text('Carregando')],
                  ));
                case ConnectionState.done:
                  if (snapshot.hasData && items != null) {
                    if (items.isNotEmpty) {
                      return ListView.builder(
                          padding: EdgeInsets.only(top: 8, bottom: 70),
                          itemCount: items.length,
                          itemBuilder: (context, index) {
                            final task = items[index];
                            return Task(
                              id: task.id,
                              name: task.name,
                              picture: task.picture,
                              difficulty: task.difficulty,
                              level: task.level,
                              mastery: task.mastery,
                              onLeveledUp: () {
                                setState(() {});
                              },
                              onDeleteTask: () {
                                setState(() {});
                              },
                            );
                          });
                    }
                    return Center(
                        child: Column(
                      children: [
                        Icon(
                          Icons.error_outline,
                          size: 128,
                        ),
                        Text(
                          'Nao ha nenhuma tarefa',
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ));
                  }
                  return Text('Erro ao carregar tarefas');
              }
            }),
      ),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.blue,
          onPressed: () {
            Navigator.of(context)
                .pushNamed('/form')
                .then((value) => setState(() {
                      print('Recarregando a tela');
                    }));
          },
          child: Icon(Icons.add, color: Colors.white)),
    );
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

    return weightedSum;
  }
}
