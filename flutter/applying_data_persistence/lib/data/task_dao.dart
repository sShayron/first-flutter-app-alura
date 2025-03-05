import 'package:nosso_primeiro_projeto/data/database.dart';
import 'package:nosso_primeiro_projeto/models/task_model.dart';
import 'package:sqflite/sqflite.dart';

class TaskDAO {
  static const String tableSql = '''
    CREATE TABLE $_tablename (
      $_id INTEGER PRIMARY KEY AUTOINCREMENT,
      $_name TEXT, 
      $_difficulty INTEGER,
      $_level INTEGER,
      $_mastery INTEGER,
      $_picture TEXT)''';

  static const String updateTableV3 =
      'ALTER TABLE $_tablename ADD COLUMN $_level INTEGER';
  static const String updateTableV4 =
      'ALTER TABLE $_tablename ADD COLUMN $_mastery INTEGER';

  static const String _tablename = 'taskTable';
  static const String _id = 'id';
  static const String _name = 'name';
  static const String _difficulty = 'difficulty';
  static const String _picture = 'picture';
  static const String _level = 'level';
  static const String _mastery = 'mastery';

  List<TaskModel> toList(List<Map<String, dynamic>> taskMap) {
    final List<TaskModel> tasks = [];

    for (Map<String, dynamic> item in taskMap) {
      final TaskModel task = TaskModel(
          id: item[_id],
          name: item[_name],
          picture: item[_picture],
          difficulty: item[_difficulty],
          level: item[_level],
          mastery: item[_mastery]);
      tasks.add(task);
    }

    print('toList $tasks');

    return tasks;
  }

  Map<String, dynamic> toMap(TaskModel task) {
    return {
      _id: task.id,
      _name: task.name,
      _picture: task.picture,
      _difficulty: task.difficulty,
      _level: task.level,
      _mastery: task.mastery,
    };
  }

  save(TaskModel task) async {
    final Database db = await getDatabase();
    var itemExists = [];

    if (task.id != null) {
      itemExists = await find(task.id!);
    }

    Map<String, dynamic> taskMap = toMap(task);

    if (itemExists.isEmpty) {
      return await db.insert(_tablename, taskMap);
    } else {
      return await db
          .update(_tablename, taskMap, where: '$_id = ?', whereArgs: [task.id]);
    }
  }

  Future<List<TaskModel>> findAll() async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> result = await db.query(_tablename);
    print('findAll result: $result');
    return toList(result);
  }

  Future<List<TaskModel>> find(int taskId) async {
    final Database db = await getDatabase();
    final List<Map<String, dynamic>> tasksMap =
        await db.query(_tablename, where: '$_id = ?', whereArgs: [taskId]);
    return toList(tasksMap);
  }

  delete(int taskId) async {
    final Database db = await getDatabase();
    return db.delete(_tablename, where: '$_id = ?', whereArgs: [taskId]);
  }
}
