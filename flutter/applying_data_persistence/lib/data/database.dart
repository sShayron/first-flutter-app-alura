import 'package:nosso_primeiro_projeto/data/task_dao.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

Future<Database> getDatabase() async {
  final String path = join(await getDatabasesPath(), 'task.db');
  return openDatabase(path, onCreate: (db, version) {
    db.execute(TaskDAO.tableSql);
  }, onUpgrade: (db, oldVersion, newVersion) {
    if (newVersion == 4) {
      db.execute(TaskDAO.updateTableV4);
    }
  }, version: 4);
}
