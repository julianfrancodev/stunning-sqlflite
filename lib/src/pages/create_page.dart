import 'package:flutter/material.dart';
import 'package:parcial_02/src/bloc/students_bloc.dart';
import 'package:parcial_02/src/models/StudentModel.dart';

class CreatePage extends StatefulWidget {
  @override
  _CreatePageState createState() => _CreatePageState();
}

class _CreatePageState extends State<CreatePage> {
  final studentsBloc = new StudentsBloc();
  final _formKey = GlobalKey<FormState>();
  TextEditingController idController = new TextEditingController();
  TextEditingController codigoController = new TextEditingController();
  TextEditingController nombresController = new TextEditingController();
  TextEditingController apellidosController = new TextEditingController();
  TextEditingController semestreController = new TextEditingController();
  TextEditingController facultadController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Crear Estudiante"),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                TextFormField(
                  controller: idController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(hintText: "Ingresar Id (Unico)"),
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Ingresa un id valido";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: codigoController,
                  decoration:
                      InputDecoration(hintText: "Ingresar Codigo (Unico)"),
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Ingresa un codigo valido";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: nombresController,
                  decoration: InputDecoration(hintText: "Ingresar Nombres"),
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Ingresa un nombre valido";
                    }
                    return null;
                  },
                ),

                TextFormField(
                  controller: apellidosController,
                  decoration: InputDecoration(hintText: "Ingresar Apellidos"),
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Ingresa un apellido valido";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: semestreController,
                  decoration: InputDecoration(hintText: "Ingresar Semestre"),
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Ingresa un semestre valido";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: facultadController,
                  decoration: InputDecoration(hintText: "Ingresar Facultad"),
                  validator: (value) {
                    if (value.isEmpty) {
                      return "Ingresa una facultad valida";
                    }
                    return null;
                  },
                ),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState.validate()) {
                      StudentModel student = new StudentModel(
                          id: int.parse(idController.text),
                          codigo: codigoController.text,
                          nombres: nombresController.text,
                          apellidos: apellidosController.text,
                          semestre: semestreController.text,
                          facultad: facultadController.text);

                      print(student.codigo);
                      studentsBloc.saveStudent(student);
                      Navigator.pushNamed(context, '/');
                    }
                  },
                  child: Text("Submit"),
                )
              ],
            ),
          ),
        ));
  }
}
