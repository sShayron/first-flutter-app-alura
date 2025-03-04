import 'package:flutter/material.dart';
import 'package:nosso_primeiro_projeto/models/task_model.dart';

class TaskInherited extends InheritedWidget {
  final List<TaskModel> taskList;
  final int maxLevel;
  final void Function(String name) onLevelUpPressed;
  final void Function(String name, String picture, int difficulty) newTask;

  const TaskInherited(
      {super.key,
      required this.taskList,
      required this.maxLevel,
      required this.onLevelUpPressed,
      required this.newTask,
      required super.child});

  @override
  bool updateShouldNotify(TaskInherited oldWidget) => true;

  static TaskInherited of(BuildContext context) {
    final TaskInherited? result =
        context.dependOnInheritedWidgetOfExactType<TaskInherited>();
    assert(result != null, "No TaskInherited found in Context");
    return result as TaskInherited;
  }
}
