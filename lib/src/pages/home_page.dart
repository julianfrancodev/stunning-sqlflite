import 'package:flutter/material.dart';
import 'package:parcial_02/src/bloc/students_bloc.dart';
import 'package:parcial_02/src/models/StudentModel.dart';


class HomePage extends StatelessWidget {

  final studentsBloc = new StudentsBloc();

  @override
  Widget build(BuildContext context) {

    studentsBloc.getStudents();

    return Scaffold(
      appBar: AppBar(
        title: Text("Estudiantes"),
        actions: [
          IconButton(
            icon: Icon(Icons.delete_forever),
            onPressed: (){
              studentsBloc.deleteAll();
            },
          ),
          IconButton(
            icon: Icon(Icons.add),
            onPressed: (){
              Navigator.pushNamed(context, '/create');
            },
          )
        ],
      ),
      body: StreamBuilder<List<StudentModel>>(
        stream: studentsBloc.studentsStream,
        builder: (BuildContext context, AsyncSnapshot<List<StudentModel>> snapshot){
          if(!snapshot.hasData){
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          final List<StudentModel> students = snapshot.data;
          if(students.length == 0){
            return Center(
              child: Text("No hay estudiantes!"),
            );
          }

          return ListView.builder(
            itemCount: students.length,
            itemBuilder: (context, index){
              return Dismissible(
                key: UniqueKey(),
                background: Container(
                  color: Colors.red,
                ),
                onDismissed: (direction){
                  studentsBloc.deleteStudent(students[index].id);

                },

                child: ListTile(
                  title: Text(students[index].nombres),
                  leading: Text("${students[index].codigo}"),
                  trailing: Icon(Icons.arrow_forward_ios_outlined),
                  onTap: (){
                    print(students[index].id);
                    Navigator.pushNamed(context, '/detail', arguments: students[index]);
                  },
                ),
              );
            },
          );
        },
      )
    );
  }
}
