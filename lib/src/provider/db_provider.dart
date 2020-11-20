import 'dart:io';

import 'package:parcial_02/src/models/StudentModel.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class DbProvider {
  static Database _database;
  static final DbProvider db = DbProvider._();

  DbProvider._();

  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await initDB();

    return _database;
  }

  initDB() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();

    final path = join(documentDirectory.path, 'Students.db');

    return await openDatabase(path, version: 1, onOpen: (db) {},
        onCreate: (Database db, int version) async {
          await db.execute('CREATE TABLE Students ('
              'id INTEGER PRIMARY KEY,'
              'codigo TEXT,'
              'nombres TEXT,'
              'apellidos TEXT,'
              'semestre TEXT,'
              'facultad TEXT'
              ')');
        });
  }

  // INSERT

  newStudent(StudentModel studentModel) async {
    final db = await database;

    final result = await db.insert('Students', studentModel.toJson());

    return result;
  }

  // SELECT BY ID

  Future<StudentModel> getStudentById(int id) async {
    final db = await database;

    final result = await db.query('Students', where: 'id = ?', whereArgs: [id]);

    return result.isEmpty ? StudentModel.fromJson(result.first) : null;
  }


  // SELECT ALL
  Future<List<StudentModel>> getAllStudents() async {
    final db = await database;

    final result = await db.query('Students');

    List<StudentModel> scanList = result.isNotEmpty
        ? result.map((e) => StudentModel.fromJson(e)).toList()
        : [];

    return scanList;
  }

  // SELECT BY SPECIFIC FIELD

  Future<List<StudentModel>> getStudentsByFacultad(String type) async {
    final db = await database;

    final result =
    await db.query('Students', where: 'facultad = ?', whereArgs: [type]);

    List<StudentModel> scanList = result.isNotEmpty
        ? result.map((e) => StudentModel.fromJson(e)).toList()
        : [];

    return scanList;
  }

  Future<int> updateStudent(StudentModel scanModel) async {
    final db = await database;

    final result = await db.update('Students', scanModel.toJson(),where: 'id = ?', whereArgs: [scanModel.id]);

    return result;
  }

  Future<int> deleteStudent(int id) async {
    final db = await database;

    final result = await db.delete('Students',where: 'id = ?', whereArgs: [id]);

    return result;
  }

  Future<int> delelteAllStudents() async {
    final db = await database;

    final result = await db.delete('Students');

    return result;
  }
}
