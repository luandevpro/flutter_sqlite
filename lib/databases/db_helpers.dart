import 'package:flutter_sqlite_diy/models/student_models.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io' as io;
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class DBHelper {
  static Database _db;
  Future<Database> get db async {
    if (_db != null) {
      return _db;
    }
    _db = await initDatabase();
    return _db;
  }

  initDatabase() async {
    io.Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, 'student.db');
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  _onCreate(Database db, int version) async {
    await db
        .execute('CREATE TABLE student (id INTEGER PRIMARY KEY, name TEXT)');
  }

  Future<List<Student>> getStudents() async {
    final dbClient = await db;
    List<Map> maps = await dbClient.query("student", columns: ["id", "name"]);
    return List.generate(maps.length, (i) {
      return Student(
        id: maps[i]['id'],
        name: maps[i]['name'],
      );
    });
  }

  Future add(Student student) async {
    final dbClient = await db;
    student.id = await dbClient.insert("student", student.toMap());
    return student;
  }

  Future update(Student student) async {
    final dbClient = await db;
    return await dbClient.update(
      'student',
      student.toMap(),
      where: "id = ?",
      whereArgs: [student.id],
    );
  }

  Future delete(int id) async {
    final dbClient = await db;
    return await dbClient.delete(
      'student',
      where: "id = ?",
      whereArgs: [id],
    );
  }

  Future close() async {
    var dbClient = await db;
    dbClient.close();
  }
}
