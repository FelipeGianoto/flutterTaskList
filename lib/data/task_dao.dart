import 'package:flutterapp/components/task.dart';
import 'package:flutterapp/data/database.dart';
import 'package:sqflite/sqflite.dart';

class TaskDao {
  static String tableSql = 'CREATE TABLE $_tablename('
      '$_name TEXT PRIMARY KEY, '
      '$_difficulty INTEGER, '
      '$_image TEXT)';

  static const String _tablename = 'taskTable';
  static const String _name = 'name';
  static const String _difficulty = 'difficulty';
  static const String _image = 'image';

  save(Task tarefa) async {
    final Database db = await getDataBase();
    var itemExist = await find(tarefa.nome);
    Map<String, dynamic> taskMap = toMap(tarefa);
    if (itemExist.isEmpty) {
      return await db.insert(_tablename, taskMap);
    } else {
      return await db.update(_tablename, taskMap,
          where: '$_name = ?', whereArgs: [tarefa.nome]);
    }
  }

  Map<String, dynamic> toMap(Task task) {
    final Map<String, dynamic> taskMap = {};
    taskMap[_name] = task.nome;
    taskMap[_difficulty] = task.dificuldade;
    taskMap[_image] = task.foto;
    return taskMap;
  }

  Future<List<Task>> findAll() async {
    final Database db = await getDataBase();
    final List<Map<String, dynamic>> result = await db.query(_tablename);
    return toList(result);
  }

  List<Task> toList(List<Map<String, dynamic>> taskMap) {
    final List<Task> tasks = [];
    for (Map<String, dynamic> line in taskMap) {
      final Task task = Task(line[_name], line[_image], line[_difficulty]);
      tasks.add(task);
    }
    return tasks;
  }

  Future<List<Task>> find(String nomeDaTarefa) async {
    final Database db = await getDataBase();
    final List<Map<String, dynamic>> result = await db
        .query(_tablename, where: '$_name = ?', whereArgs: [nomeDaTarefa]);
    return toList(result);
  }

  delete(String nomeDaTarefa) async {
    final Database db = await getDataBase();
    return db
        .delete(_tablename, where: '$_name = ?', whereArgs: [nomeDaTarefa]);
  }
}
