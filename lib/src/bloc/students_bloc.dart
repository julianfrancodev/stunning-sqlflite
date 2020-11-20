import 'dart:async';

import 'package:parcial_02/src/models/StudentModel.dart';
import 'package:parcial_02/src/provider/db_provider.dart';

class StudentsBloc {
  static final StudentsBloc _studentsBloc = new StudentsBloc._();

  factory StudentsBloc() {
    return _studentsBloc;
  }

  StudentsBloc._() {
    getStudents();
  }

  final _studentsController = StreamController<List<StudentModel>>.broadcast();

  Stream<List<StudentModel>> get studentsStream => _studentsController.stream;

  dispose() {
    _studentsController?.close();
  }

  getStudents() async {
    _studentsController.sink.add(await DbProvider.db.getAllStudents());
  }

  saveStudent(StudentModel studentModel) async {
    await DbProvider.db.newStudent(studentModel);
    getStudents();
  }

  deleteStudent(int id) async {
    await DbProvider.db.deleteStudent(id);
    getStudents();
  }

  deleteAll() async {
    await DbProvider.db.delelteAllStudents();
    getStudents();
  }
}
