import 'package:flutter/material.dart';
import 'package:parcial_02/src/models/StudentModel.dart';

class StudentDetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final StudentModel studentModel = ModalRoute.of(context).settings.arguments;

    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(child: Text("Codigo: ${studentModel.codigo}")),
          Center(child: Text("Nombres: ${studentModel.nombres}")),
          Center(child: Text("Apellidos: ${studentModel.apellidos}")),
          Center(child: Text("Facultad: ${studentModel.facultad}")),
          Center(child: Text("Semestre: ${studentModel.semestre}")),


        ],
      ),
    );
  }
}
