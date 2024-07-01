import 'package:flutterapp/data/task_dao.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

Future<Database> getDataBase() async {
  final String path = join(await getDatabasesPath(), 'task.db');
  return openDatabase(path, onCreate: (db, version) {
    print("Criando a tabela...");
    db.execute(TaskDao.tableSql).then((value) {
      print("Tabela criada com sucesso");
    }).catchError((error) {
      print("Erro ao criar a tabela: $error");
    });
  }, version: 1);
}