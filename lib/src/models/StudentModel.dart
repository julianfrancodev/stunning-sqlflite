// To parse this JSON data, do
//
//     final studentModel = studentModelFromJson(jsonString);

import 'dart:convert';

StudentModel studentModelFromJson(String str) => StudentModel.fromJson(json.decode(str));

String studentModelToJson(StudentModel data) => json.encode(data.toJson());

class StudentModel {
  StudentModel({
    this.id,
    this.codigo,
    this.nombres,
    this.apellidos,
    this.semestre,
    this.facultad,
  });

  int id;
  String codigo;
  String nombres;
  String apellidos;
  String semestre;
  String facultad;

  factory StudentModel.fromJson(Map<String, dynamic> json) => StudentModel(
    id: json["id"],
    codigo: json["codigo"],
    nombres: json["nombres"],
    apellidos: json["apellidos"],
    semestre: json["semestre"],
    facultad: json["facultad"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "codigo": codigo,
    "nombres": nombres,
    "apellidos": apellidos,
    "semestre": semestre,
    "facultad": facultad,
  };
}
